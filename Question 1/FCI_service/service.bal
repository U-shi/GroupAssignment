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

public final table<Staff> key(staffNumber) StaffTable = table [
    {staffNumber: "jay3958", officeNumber: "A756", staffName: "Jayden Jack", title: "Mr", courses: [1, 2, 3]},
    {staffNumber: "lia3468", officeNumber: "B756", staffName: "Liam Noah", title: "Mrs", courses: [1, 3]},
    {staffNumber: "jam3458", officeNumber: "C756", staffName: "James William", title: "Dr", courses: [3, 2]},
    {staffNumber: "hen3458", officeNumber: "D756", staffName: "Henry Lucas", title: "Prof", courses: [2]}
];

public final table<Course> key(Id) CourseTable = table [
    {Id: 1, Name: "Computer Programming Concepts", code: "CPC711S", NQA_level: 5},
    {Id: 2, Name: "Web Programming 1", code: "WPG711S", NQA_level: 5},
    {Id: 3, Name: "JavaScript-based Web Technologies", code: "JWT711S", NQA_level: 5}
];

public type ConflictingIdError record {|
    *http:Conflict;
    ErrorMsg body;
|};

public type ErrorMsg record {|
    string errmsg;
|};

service /FCI on new http:Listener(9000) {
    //Add a new lecturer
    resource function post addLecture(@http:Payload Staff[] staff) returns Staff[]|ConflictingIdError {

        string[] conflictingId = from Staff Entry in staff
            where StaffTable.hasKey(Entry.staffNumber)
            select Entry.staffNumber;

        if conflictingId.length() > 0 {
            return {
                body: {
                    errmsg: string `Conflicting staff Number`
                }
            };

        } else {
            staff.forEach(staffEntry => StaffTable.add(staffEntry));
            return staff;
        }
    }

    //Retrieve a list of all lecturers within the faculty.

    resource function get getLectures() returns Staff[] {
        return StaffTable.toArray();
    }

    //Update an existing lecturer's information.
    resource function put updateLecture(@http:Payload Staff staff) returns Staff|ConflictingIdError {
        Staff? sfaffEntry = StaffTable[staff.staffNumber];

        if sfaffEntry is () {
            return {
                body: {
                    errmsg: string `Invalid staff Number`
                }
            };
        } else {
            StaffTable.put(staff);

            return staff;
        }

    }

    //Retrieve the details of a specific lecturer by their staff number.

    resource function get getLecture/[string staffNumber]() returns Staff|ConflictingIdError {
        Staff? sfaffEntry = StaffTable[staffNumber];

        if sfaffEntry is () {
            return {
                body: {
                    errmsg: string `Invalid staff Number`
                }
            };
        }

        return sfaffEntry;
    }

    //Delete a lecturer's record by their staff number.

    resource function delete deleteLecture(string staffNumber) returns Staff|ConflictingIdError {
        Staff? sfaffEntry = StaffTable[staffNumber];

        if sfaffEntry is () {
            return {
                body: {
                    errmsg: string `Invalid staff Number`
                }
            };
        } else {
            return StaffTable.remove(sfaffEntry.staffNumber);
        }
    }

    // Retrieve all the lecturers that teach a certain course.

    resource function get getLecturesByCourse(int courseId) returns Staff[]{
        Staff[] salaries = from var staff in StaffTable
                           where staff.courses.some(item=>item==courseId)
                           select staff;

        return salaries;
    }

    //Retrieve all the lecturers that sit in the same office.
    resource function get getLecturesByOffice(string officeId) returns Staff[]  {

        Staff[] officeStaff = from var staff in StaffTable
                              where staff.officeNumber == officeId
                              select staff;

        return officeStaff;          
    }

}
