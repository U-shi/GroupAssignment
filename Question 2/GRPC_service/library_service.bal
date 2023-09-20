import ballerina/grpc;

listener grpc:Listener ep = new (9090);
table<BookRequest> key(isbn) Books = table [
    {title: "Ballerina in Action", author_1: "Sameera", author_2: "Lakmal", location: "Tech Section", isbn: "K978161", status: true},
    {title: "Mastering Ballerina", author_1: "Anjana", author_2: "Fernando", location: "Tech Section", isbn: "B9781799", status: true},
    {title: "Programming in Ballerina", author_1: "Lakshitha", author_2: "Samarakoon", location: "Tech Section", isbn: "C9781802", status: true}
];
table<UserRequest> key(user_id) Users = table [];

@grpc:Descriptor {value: LIBRARY_DESC}
service "Library" on ep {

    remote function addBook(BookRequest value) returns BookResponse|error {
        Books.add(value);
        BookResponse response = {isbn: value.isbn};
        return response;

    }
    remote function updateBook(BookRequest value) returns BookResponse|error {

        BookRequest? book = Books[value.isbn];

        if book is () {
            return error("Book not found");
        } else {
            Books.put(book);
            BookResponse response = {isbn: book.isbn};
            return response;
        }
    }
    remote function removeBook(RemoveBookRequest value) returns RemoveBookResponse|error {
        BookRequest? book = Books[value.isbn];

        if book is () {
            return error("Book not found");
        } else {
            _ = Books.remove(book.isbn);
            RemoveBookResponse response = {books: [book]};
            return response;
        }
    }
    remote function listAvailableBooks(Empty value) returns BookList|error {
        BookRequest[] availableBooks = from BookRequest bookRequest in Books
            where bookRequest.status == true
            select bookRequest;

        BookList response = {books: availableBooks};
        return response;
    }
    remote function locateBook(LocateBookRequest value) returns LocateBookResponse|error {
        BookRequest? book = Books[value.isbn];

        if book is () {
            return error("book is not available");
        } else {
            LocateBookResponse response = {location: book.location};
            return response;
        }
    }
    remote function borrowBook(BorrowBookRequest value) returns BorrowBookResponse|error {
        BookRequest? book = Books[value.isbn];

        if book is () {
            return error("book is not available");
        } else {
            _ = Books.put({isbn: book.isbn, status: true});
            BorrowBookResponse response = {message: "Book borrowed successfully"};
            return response;
        }
    }
    remote function createUsers(stream<UserRequest, grpc:Error?> clientStream) returns UserResponse|error {
        string[] user_id = [];

        check clientStream.forEach(function(UserRequest userRequest) {
            if (userRequest is UserRequest) {
                user_id.push(userRequest.user_id);
                _ = Users.add(userRequest);
            }

        });

        UserResponse response = {user_id: user_id.toString()};
        return response;
    }
}
