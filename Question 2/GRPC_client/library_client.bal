import ballerina/io;

LibraryClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    BookRequest addBookRequest = {title: "The Great Gatsby", author_1: "F. Scott Fitzgerald", author_2: "", location: "Fiction Section", isbn: "N97874327", status: true};
    BookResponse addBookResponse = check ep->addBook(addBookRequest);
    io:println(addBookResponse);

    BookRequest updateBookRequest = {title: "To Kill a Mockingbird", author_1: "Harper Lee", author_2: "", location: "Classics Section", isbn: "K978161", status: true};
    BookResponse updateBookResponse = check ep->updateBook(updateBookRequest);
    io:println(updateBookResponse);

    RemoveBookRequest removeBookRequest = {isbn: "N97874327"};
    RemoveBookResponse removeBookResponse = check ep->removeBook(removeBookRequest);
    io:println(removeBookResponse);

    Empty listAvailableBooksRequest = {};
    BookList listAvailableBooksResponse = check ep->listAvailableBooks(listAvailableBooksRequest);
    io:println(listAvailableBooksResponse);

    LocateBookRequest locateBookRequest = {isbn: "K978161"};
    LocateBookResponse locateBookResponse = check ep->locateBook(locateBookRequest);
    io:println(locateBookResponse);

    BorrowBookRequest borrowBookRequest = {user_id: "Kenedy90889", isbn: "K978161"};
    BorrowBookResponse borrowBookResponse = check ep->borrowBook(borrowBookRequest);
    io:println(borrowBookResponse);

    UserRequest createUsersRequest = {user_id: "Sandra34", user_type: "student"};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->createUsers();
    check createUsersStreamingClient->sendUserRequest(createUsersRequest);
    check createUsersStreamingClient->complete();
    UserResponse? createUsersResponse = check createUsersStreamingClient->receiveUserResponse();
    io:println(createUsersResponse);
}

