import ballerina/io;
import ballerina/http;

public type Staff record {|
    readonly string staffNumber;
    string officeNumber;
    string staffName;
    string title;
    int[] courses;
|};

public type Course record {
    readonly int Id;
    string Name;
    string code;
    int NQA_level;
};

public function main() returns error? {

    // Define the base URL of the service
    http:Client clientEndpoint = check new ("localhost:9000/FCI");

    Staff[] createStaffs = check clientEndpoint->/addLecture.post([
        {
            staffNumber: "john1234",
            officeNumber: "E123",
            staffName: "John Doe",
            title: "Dr",
            courses: [1, 2]
        }
    ]);
    io:println("Lecture created: " + createStaffs.toJsonString());

    // Getting a list of all lecturers
    Staff[] listOfLectures = check clientEndpoint->/getLectures;
    io:println("Getting a list of all lecturers: " + listOfLectures.toJsonString());

    // Updating an existing lecturer's information
    Staff updateStaffs = check clientEndpoint->/updateLecture.put(
        {
            staffNumber: "jay3958",
            officeNumber: "D123",
            staffName: "Kennedy Faul",
            title: "Dr",
            courses: [1, 2]
        }
    );
    io:println("Updating an existing lecturer's information: " + updateStaffs.toJsonString());

    // Getting details of a specific lecturer
    Staff LectureById = check clientEndpoint->/getLecture/jay3958;
    io:println("Getting details of a specific lecturer: " + LectureById.toJsonString());

    // Deleting a lecturer
    Staff deleteLectureById = check clientEndpoint->/deleteLecture.delete(staffNumber="jay3958");
    io:println("Deleting a lecturer: " + deleteLectureById.toJsonString());

    // Getting lecturers by course
    Staff [] getLectureByCourse = check clientEndpoint->/getLecturesByCourse.get(courseId=1);
    io:println("Getting lecturers by course: " + getLectureByCourse.toJsonString());

    // Getting lecturers by office
    Staff [] getLectureByOffice = check clientEndpoint->/getLecturesByOffice.get(officeId = "B756");
    io:println("Getting lecturers by office: " + getLectureByOffice.toJsonString());
}
