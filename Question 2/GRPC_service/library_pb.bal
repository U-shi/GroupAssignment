import ballerina/grpc;
import ballerina/protobuf;

public const string LIBRARY_DESC = "0A0D6C6962726172792E70726F746F22A1010A0B426F6F6B5265717565737412140A057469746C6518012001280952057469746C6512190A08617574686F725F311802200128095207617574686F723112190A08617574686F725F321803200128095207617574686F7232121A0A086C6F636174696F6E18042001280952086C6F636174696F6E12120A046973626E18052001280952046973626E12160A06737461747573180620012808520673746174757322220A0C426F6F6B526573706F6E736512120A046973626E18012001280952046973626E22430A0B557365725265717565737412170A07757365725F69641801200128095206757365724964121B0A09757365725F747970651802200128095208757365725479706522270A0C55736572526573706F6E736512170A07757365725F6964180120012809520675736572496422270A1152656D6F7665426F6F6B5265717565737412120A046973626E18012001280952046973626E22380A1252656D6F7665426F6F6B526573706F6E736512220A05626F6F6B7318012003280B320C2E426F6F6B526571756573745205626F6F6B7322070A05456D70747922270A114C6F63617465426F6F6B5265717565737412120A046973626E18012001280952046973626E22300A124C6F63617465426F6F6B526573706F6E7365121A0A086C6F636174696F6E18012001280952086C6F636174696F6E22400A11426F72726F77426F6F6B5265717565737412170A07757365725F6964180120012809520675736572496412120A046973626E18022001280952046973626E222E0A12426F72726F77426F6F6B526573706F6E736512180A076D65737361676518012001280952076D657373616765222E0A08426F6F6B4C69737412220A05626F6F6B7318012003280B320C2E426F6F6B526571756573745205626F6F6B7332D8020A074C69627261727912260A07616464426F6F6B120C2E426F6F6B526571756573741A0D2E426F6F6B526573706F6E7365122C0A0B6372656174655573657273120C2E55736572526571756573741A0D2E55736572526573706F6E7365280112290A0A757064617465426F6F6B120C2E426F6F6B526571756573741A0D2E426F6F6B526573706F6E736512350A0A72656D6F7665426F6F6B12122E52656D6F7665426F6F6B526571756573741A132E52656D6F7665426F6F6B526573706F6E736512270A126C697374417661696C61626C65426F6F6B7312062E456D7074791A092E426F6F6B4C69737412350A0A6C6F63617465426F6F6B12122E4C6F63617465426F6F6B526571756573741A132E4C6F63617465426F6F6B526573706F6E736512350A0A626F72726F77426F6F6B12122E426F72726F77426F6F6B526571756573741A132E426F72726F77426F6F6B526573706F6E7365620670726F746F33";

public isolated client class LibraryClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARY_DESC);
    }

    isolated remote function addBook(BookRequest|ContextBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/addBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function addBookContext(BookRequest|ContextBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/addBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function updateBook(BookRequest|ContextBookRequest req) returns BookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookResponse>result;
    }

    isolated remote function updateBookContext(BookRequest|ContextBookRequest req) returns ContextBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BookRequest message;
        if req is ContextBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/updateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookResponse>result, headers: respHeaders};
    }

    isolated remote function removeBook(RemoveBookRequest|ContextRemoveBookRequest req) returns RemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <RemoveBookResponse>result;
    }

    isolated remote function removeBookContext(RemoveBookRequest|ContextRemoveBookRequest req) returns ContextRemoveBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        RemoveBookRequest message;
        if req is ContextRemoveBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/removeBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <RemoveBookResponse>result, headers: respHeaders};
    }

    isolated remote function listAvailableBooks(Empty|ContextEmpty req) returns BookList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/listAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookList>result;
    }

    isolated remote function listAvailableBooksContext(Empty|ContextEmpty req) returns ContextBookList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/listAvailableBooks", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookList>result, headers: respHeaders};
    }

    isolated remote function locateBook(LocateBookRequest|ContextLocateBookRequest req) returns LocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <LocateBookResponse>result;
    }

    isolated remote function locateBookContext(LocateBookRequest|ContextLocateBookRequest req) returns ContextLocateBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        LocateBookRequest message;
        if req is ContextLocateBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/locateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <LocateBookResponse>result, headers: respHeaders};
    }

    isolated remote function borrowBook(BorrowBookRequest|ContextBorrowBookRequest req) returns BorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BorrowBookResponse>result;
    }

    isolated remote function borrowBookContext(BorrowBookRequest|ContextBorrowBookRequest req) returns ContextBorrowBookResponse|grpc:Error {
        map<string|string[]> headers = {};
        BorrowBookRequest message;
        if req is ContextBorrowBookRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("Library/borrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BorrowBookResponse>result, headers: respHeaders};
    }

    isolated remote function createUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("Library/createUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUserRequest(UserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUserRequest(ContextUserRequest message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUserResponse() returns UserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <UserResponse>payload;
        }
    }

    isolated remote function receiveContextUserResponse() returns ContextUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <UserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class LibraryBorrowBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBorrowBookResponse(BorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBorrowBookResponse(ContextBorrowBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryLocateBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendLocateBookResponse(LocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextLocateBookResponse(ContextLocateBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryUserResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUserResponse(UserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUserResponse(ContextUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookResponse(BookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookResponse(ContextBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryBookListCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookList(BookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookList(ContextBookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryRemoveBookResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendRemoveBookResponse(RemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextRemoveBookResponse(ContextRemoveBookResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextUserRequestStream record {|
    stream<UserRequest, error?> content;
    map<string|string[]> headers;
|};

public type ContextBookResponse record {|
    BookResponse content;
    map<string|string[]> headers;
|};

public type ContextUserResponse record {|
    UserResponse content;
    map<string|string[]> headers;
|};

public type ContextLocateBookRequest record {|
    LocateBookRequest content;
    map<string|string[]> headers;
|};

public type ContextLocateBookResponse record {|
    LocateBookResponse content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextBookList record {|
    BookList content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookRequest record {|
    RemoveBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookResponse record {|
    BorrowBookResponse content;
    map<string|string[]> headers;
|};

public type ContextBorrowBookRequest record {|
    BorrowBookRequest content;
    map<string|string[]> headers;
|};

public type ContextBookRequest record {|
    BookRequest content;
    map<string|string[]> headers;
|};

public type ContextRemoveBookResponse record {|
    RemoveBookResponse content;
    map<string|string[]> headers;
|};

public type ContextUserRequest record {|
    UserRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookResponse record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserResponse record {|
    string user_id = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type LocateBookResponse record {|
    string location = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookList record {|
    BookRequest[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookRequest record {|
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BorrowBookRequest record {|
    string user_id = "";
    string isbn = "";
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type BookRequest record {|
    string title = "";
    string author_1 = "";
    string author_2 = "";
    string location = "";
    readonly string isbn = "";
    boolean status = false;
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type RemoveBookResponse record {|
    BookRequest[] books = [];
|};

@protobuf:Descriptor {value: LIBRARY_DESC}
public type UserRequest record {|
    readonly string user_id = "";
    string user_type = "";
|};

