CREATE DATABASE IF NOT EXISTS SPED_01;
USE SPED_01;

SET FOREIGN_KEY_CHECKS=0;
Drop Table IF EXISTS SupportServices;
Drop Table IF EXISTS Disability;
Drop Table IF EXISTS Assessment;
Drop Table IF EXISTS Grade;
Drop Table IF EXISTS StudentSchedule;
Drop Table IF EXISTS Course;
Drop Table IF EXISTS TeacherAdministrator;
Drop Table IF EXISTS ParentGaurdian;
Drop Table IF EXISTS Student;
Drop Table IF EXISTS Users;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE Users(
            UserId                               INTEGER NOT NULL,
            UserFirstName                        VARCHAR(25)    ,
            UserLastName                         VARCHAR(25)    ,
            UserTitle                            VARCHAR(25)    ,
            UserPhone                            VARCHAR(50)    ,
            UserEmail                            VARCHAR(50)    ,
    CONSTRAINT Users_PK PRIMARY KEY (UserId));

CREATE TABLE ParentGuardian
            (ParentGuardianId                    INTEGER NOT NULL,
            ParentGuardianName                   VARCHAR(50)    ,
            ParentGuardianAddress                VARCHAR(255)    ,
            ParentGuardianEmail                  VARCHAR(50)    ,
            ParentGuardianPhone                  VARCHAR(50)    ,
    CONSTRAINT ParentGuardian_PK PRIMARY KEY (ParentGuardianId));

CREATE TABLE TeacherAdministrator
            (TeacherAdministratorId               INTEGER NOT NULL,
            UserId                               INTEGER NOT NULL,
    CONSTRAINT TeacherAdministrator_PK PRIMARY KEY (TeacherAdministratorId),
    CONSTRAINT TeacherAdministrator_FK1 FOREIGN KEY (UserId) REFERENCES Users(UserId));

CREATE TABLE Course
            (CourseId                            INTEGER NOT NULL,
            CourseName                           VARCHAR(50)    ,
            SubjectArea                          VARCHAR(50)    ,
            GradeLevel                           INTEGER NOT NULL, 
            TeacherAdministratorId               INTEGER NOT NULL,
    CONSTRAINT Course_PK PRIMARY KEY (CourseId),
    CONSTRAINT Course_FK1 FOREIGN KEY (TeacherAdministratorId) REFERENCES TeacherAdministrator(TeacherAdministratorId));

CREATE TABLE Student
            (StudentId                           INTEGER NOT NULL,
            StudentName                          VARCHAR(50)    ,
            StudentDOB                           DATE           ,
            StudentGender                        VARCHAR(10)    ,
            StudentGradeLevel                    INTEGER NOT NULL,
            StudentAddress                       VARCHAR(255)    ,
            StudentPhone                         VARCHAR(50)    ,
            ParentGuardianId                     INTEGER NOT NULL,
    CONSTRAINT Student_PK PRIMARY KEY (StudentId),
    CONSTRAINT Student_FK1 FOREIGN KEY (ParentGuardianId) REFERENCES ParentGuardian(ParentGuardianId));

CREATE TABLE StudentDisability
            (StudentDisabilityId                 INTEGER NOT NULL,
            StudentDisabilityName                VARCHAR(255)    ,
            StudentDisabilityDescription         VARCHAR(255)    ,
            StudentId                            INTEGER NOT NULL,
    CONSTRAINT StudentDisability_PK PRIMARY KEY (StudentDisabilityId),
    CONSTRAINT StudentDisability_FK1 FOREIGN KEY (StudentId) REFERENCES Student(StudentId));

CREATE TABLE StudentSchedule
            (StudentScheduleId                          INTEGER NOT NULL,
            StudentScheduleSemester                     VARCHAR(25)    ,       
            StudentScheduleDayOfWeek                    VARCHAR(25)           ,
            StudentSchedulePeriod                       INTEGER NOT NULL,
            StudentScheduleLocation                     VARCHAR(25)    ,
            CourseId                                    INTEGER NOT NULL,
    CONSTRAINT StudentSchedule_PK PRIMARY KEY (StudentScheduleId),
    CONSTRAINT StudentSchedule_FK1 FOREIGN KEY (CourseId) REFERENCES Course(CourseId));

CREATE TABLE Assessment
            (AssessmentId                        INTEGER NOT NULL,
            AssessmentType                       VARCHAR(50)    ,
            AssessmentName                       VARCHAR(50)    ,
            AssessmentDate                       DATE           ,
            AssessmentScore                      FLOAT     ,
            StudentId                            INTEGER NOT NULL,
            StudentScheduleId                           INTEGER NOT NULL,
    CONSTRAINT Assessment_PK PRIMARY KEY (AssessmentId),
    CONSTRAINT Assessment_FK1 FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    CONSTRAINT Assessment_FK2 FOREIGN KEY (StudentScheduleId) REFERENCES StudentSchedule(StudentScheduleId));

CREATE TABLE Grade
            (GradeId                             INTEGER NOT NULL,
            GradeValue                           FLOAT    ,
            GradeDate                            DATE           ,
            StudentId                            INTEGER NOT NULL,
            StudentScheduleId                           INTEGER NOT NULL,
    CONSTRAINT Grade_PK PRIMARY KEY (GradeId),
    CONSTRAINT Grade_FK1 FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
    CONSTRAINT Grade_FK2 FOREIGN KEY (StudentScheduleId) REFERENCES StudentSchedule(StudentScheduleId));

CREATE TABLE SupportServices
             (SupportServiceId                      integer NOT NULL,
              SupportServiceName                    VARCHAR(255)    ,
              SupportServiceDescription             VARCHAR(255)    ,
              StudentDisabilityId                   INTEGER NOT NULL,
    CONSTRAINT SupportService_PK PRIMARY KEY (SupportServiceId),
    CONSTRAINT SupportService_FK1 FOREIGN KEY (StudentDisabilityId) REFERENCES StudentDisability(StudentDisabilityId));

    -- Insert data into the tables

    INSERT INTO Users(UserId, UserFirstName, UserLastName, UserTitle, UserPhone, UserEmail) 
    VALUES  
    (1001, 'John', 'Doe', 'Teacher', '1234567890', 'john.doe@example.com'),
    (1002, 'Jane', 'Smith', 'Principle', '1234567891', 'jane.smith@example.com'),
    (1003, 'Tom', 'Brown', 'Teacher', '1234567892', 'tom.brown@email.com'),
    (1004, 'Sue', 'White', 'Admin', '1234567893', 'sue@email.com'),
    (1005, 'Sam', 'Black', 'Teacher', '1234567894', 'sam@email.com'),
    (1006, 'Sally', 'Green', 'Admin', '1234567895', 'Sally@email.com'),
    (1007, 'Steve', 'Red', 'Teacher', '1234567896', 'Red@email.com'),
    (1008, 'Sarah', 'Blue', 'Principle', '1234567897', 'Sarah@email.com'),
    (1009, 'Shawn', 'Yellow', 'Teacher', '1234567898', 'shawn@email.com'),
    (1010, 'Sherry', 'Purple', 'Teacher', '1234567899', 'sherry@email.com'),
    (1011, 'Shane', 'Orange', 'Teacher', '1234567800', 'shane@email.com'),
    (1012, 'Shawn', 'Pink', 'Case Manager', '1234567801', 'shawnpink@email.com'),
    (1013, 'Sherry', 'Brown', 'Assistant Principle', '1234567802', 'sbrown@email.com'),
    (1014, 'Shane', 'White', 'Teacher', '1234567803', 'swhite@email.com'),
    (1015, 'Shawn', 'Black', 'Teacher', '1234567804', 'sblack@email.com'),
    (1016, 'Sherry', 'Green', 'Teacher', '1234567805', 'sgreen@email.com'),
    (1017, 'Shane', 'Red', 'Teacher', '1234567806', 'shanered@email.com'),
    (1018, 'Shawn', 'Blue', 'Teacher', '1234567807', 'shawnblue@email.com'),
    (1019, 'Sherry', 'Yellow', 'Teacher', '1234567808', 'sherryYellow@email.com'),
    (1020, 'Shane', 'Purple', 'Teacher', '1234567809', 'shanepurple@email.com');

-- Inserting into Parent table
INSERT INTO ParentGuardian(ParentGuardianId, ParentGuardianName, ParentGuardianAddress, ParentGuardianEmail, ParentGuardianPhone)
VALUES
(0001, 'John Doe', '123 Main St, Anytown, USA', 'doe@email.com', '1234567890'),
(0002, 'Michael Johnson', '123 Main St', 'michael@example.com', '555-123-4567'),
(0003, 'Emily Davis', '456 Oak Ave', 'emily@example.com', '555-987-6543'),
(0004, 'Lisa Smith', '789 Elm St', 'lisa@example.com', '555-111-2222'),
(0005, 'Kevin Brown', '456 Pine St', 'kevin@example.com', '555-333-4444'),
(0006, 'Michelle Wilson', '321 Oak St', 'michelle@example.com', '555-555-6666'),
(0007, 'Brian Taylor', '987 Maple St', 'brian@example.com', '555-777-8888'),
(0008, 'Jennifer Martinez', '654 Birch St', 'jennifer@example.com', '555-999-0000'),
(0009, 'Jason Rodriguez', '741 Cedar St', 'jason@example.com', '555-222-3333'),
(0010, 'Samantha Hernandez', '852 Walnut St', 'samantha@example.com', '555-444-5555'),
(0011, 'Mark Thompson', '369 Hickory St', 'mark@example.com', '555-666-7777'),
(0012, 'Rachel Lee', '963 Poplar St', 'rachel@example.com', '555-888-9999'),
(0013, 'Christopher Clark', '147 Oakwood St', 'christopher@example.com', '555-000-1111'),
(0014, 'Laura Hill', '258 Birchwood St', 'laura@example.com', '555-222-3333'),
(0015, 'Ryan Scott', '369 Pinecrest St', 'ryan@example.com', '555-444-5555'),
(0016, 'Rebecca Green', '753 Cedarwood St', 'rebecca@example.com', '555-666-7777'),
(0017, 'Patrick Adams', '852 Maplewood St', 'patrick@example.com', '555-888-9999'),
(0018, 'Stephanie Baker', '963 Hickorywood St', 'stephanie@example.com', '555-000-1111'),
(0019, 'Timothy White', '147 Pinewood St', 'timothy@example.com', '555-222-3333'),
(0020, 'Julie Martinez', '258 Elmwood St', 'julie@example.com', '555-444-5555');

    -- Inserting into TeacherAdministrator table
INSERT INTO TeacherAdministrator(TeacherAdministratorId, UserId)
VALUES 
(01, 1001),
(10, 1002),
(11, 1003),
(100, 1004),
(101, 1005),
(110, 1006),
(111, 1007),
(1000, 1008),
(1001, 1009),
(1010, 1010),
(1011, 1011),
(1100, 1012),
(1101, 1013),
(1110, 1014),
(1111, 1015),
(10000, 1016),
(10001, 1017),
(10010, 1018),
(10011, 1019),
(10100, 1020);

-- Inserting into Student table
INSERT INTO Student(StudentId, StudentName, StudentDOB, StudentGender, StudentGradeLevel, StudentAddress, StudentPhone, ParentGuardianId)
VALUES
(800, 'Sarah Wilson', '2010-12-13', 'M', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0001),
(801, 'Michael Johnson', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0002),
(802, 'Billie Blackwell', '2007-03-17', 'F', 11, '2208 78th St, Lubbock, TX', '8067755200', 0003),
(803, 'Samantha Smith', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0004),
(804, 'John Doe', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0005),
(805, 'Emily Davis', '2007-03-17', 'F', 9, '2208 78th St, Lubbock, TX', '8067755200', 0006),
(806, 'Lisa Smith', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0007),
(807, 'Kevin Brown', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0008),
(808, 'Michelle Wilson', '2007-03-17', 'F', 7, '2208 78th St, Lubbock, TX', '8067755200', 0009),
(809, 'Brian Taylor', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0010),
(810, 'Jennifer Martinez', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0011),
(811, 'Jason Rodriguez', '2007-03-17', 'F', 9, '2208 78th St, Lubbock, TX', '8067755200', 0012),
(812, 'Samantha Hernandez', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0013),
(813, 'Mark Thompson', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0014),
(814, 'Rachel Lee', '2007-03-17', 'F', 9, '2208 78th St, Lubbock, TX', '8067755200', 0015),
(815, 'Christopher Clark', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0016),
(816, 'Laura Hill', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0017),
(817, 'Ryan Scott', '2007-03-17', 'F', 9, '2208 78th St, Lubbock, TX', '8067755200', 0018),
(818, 'Rebecca Green', '2009-05-21', 'F', 8, '123 Main St, Anytown, Lubbock', '1234567890', 0019),
(819, 'Patrick Adams', '2008-12-31', 'M', 10, '1520 Brown St, Lubbock, TX', '8065432222', 0020);

-- Inserting into StudentDisability table
INSERT INTO StudentDisability(StudentDisabilityId, StudentDisabilityName, StudentDisabilityDescription, StudentId)
VALUES
(1000, "Dyslexia", "Difficulty reading", 800),
(1001, "Dysgraphia", "Difficulty writing", 801),
(1002, "Dyscalculia", "Difficulty with math", 802),
(1003, "ADHD", "Attention Deficit Hyperactivity Disorder", 803),
(1004, "Autism", "Autism Spectrum Disorder", 804),
(1005, "Down Syndrome", "Down Syndrome", 805),
(1006, "Cerebral Palsy", "Cerebral Palsy", 806),
(1007, "Hearing Impairment", "Hearing Impairment", 807),
(1008, "Visual Impairment", "Visual Impairment", 808),
(1009, "Speech Impairment", "Speech Impairment", 809),
(1010, "Learning Disability", "Learning Disability", 810),
(1011, "Intellectual Disability", "Intellectual Disability", 811),
(1012, "Emotional Disturbance", "Emotional Disturbance", 812),
(1013, "Orthopedic Impairment", "Orthopedic Impairment", 813),
(1014, "Other Health Impairment", "Other Health Impairment", 814),
(1015, "Multiple Disabilities", "Multiple Disabilities", 815),
(1016, "Deaf-Blindness", "Deaf-Blindness", 816),
(1017, "Traumatic Brain Injury", "Traumatic Brain Injury", 817),
(1018, "Developmental Delay", "Developmental Delay", 818),
(1019, "Specific Learning Disability", "Specific Learning Disability", 819);

-- Inserting into SupportServices table
INSERT INTO SupportServices(SupportServiceId, SupportServiceName, SupportServiceDescription, StudentDisabilityId)
VALUES
(10000, 'Oral Testing', 'Teacher will read the test to the student', 1000),
(10001, 'Extra Time', 'Student will have extra time to complete the test', 1001),
(10002, 'Scribe', 'Student will have someone write for them', 1002),
(10003, 'Calculator', 'Student will be allowed to use a calculator', 1003),
(10004, 'Visual Aids', 'Student will be allowed to use visual aids', 1004),
(10005, 'Sign Language Interpreter', 'Student will have a sign language interpreter', 1005),
(10006, 'Note Taker', 'Student will have a note taker', 1006),
(10007, 'Extended Time', 'Student will have extended time to complete assignments', 1007),
(10008, 'Small Group', 'Student will be in a small group', 1008),
(10009, 'One-on-One', 'Student will have one-on-one instruction', 1009),
(10010, 'Modified Assignments', 'Student will have modified assignments', 1010),
(10011, 'Behavior Plan', 'Student will have a behavior plan', 1011),
(10012, 'Physical Therapy', 'Student will have physical therapy', 1012),
(10013, 'Occupational Therapy', 'Student will have occupational therapy', 1013),
(10014, 'Speech Therapy', 'Student will have speech therapy', 1014),
(10015, 'Social Skills Training', 'Student will have social skills training', 1015),
(10016, 'Counseling', 'Student will have counseling', 1016),
(10017, 'Behavior Intervention Plan', 'Student will have a behavior intervention plan', 1017),
(10018, 'Assistive Technology', 'Student will have assistive technology', 1018),
(10019, 'Special Education', 'Student will have special education services', 1019),
(10020, 'Oral Testing', 'Teacher will read the test to the student', 1001),
(10021, 'Note Taker', 'Student will have a note taker', 1000);

-- Inserting into Course table
INSERT INTO Course(CourseId, CourseName, SubjectArea, GradeLevel, TeacherAdministratorId)
VALUES
(200, "Algreba", "Mathematics", 8, 1001),
(201, 'Geometry', 'Mathematics', 8, 1001),
(202, 'Algebra 1', 'Mathematics', 8, 1001),
(203, 'Algebra 2', 'Mathematics', 9, 10100),
(204, 'Pre-Calculus', 'Mathematics', 10, 1010),
(205, "Reading", "Language Arts", 6, 1001),
(207, "Science", "Science", 6, 1001),
(208, "Social Studies", "Social Studies", 6, 1001),
(209, "History", "Social Studies", 6, 1001),
(210, "Biology", "Science", 9, 1010),
(211, "Chemistry", "Science", 10, 1011),
(212, "Physics", "Science", 11, 10100),
(213, "US History", "Social Studies", 9, 1010),
(214, "World History", "Social Studies", 10, 1010),
(216, "Economics", "Social Studies", 12, 1010),
(217, "Spanish", "Foreign Language", 6, 1001),
(218, "French", "Foreign Language", 6, 1001),
(219, "German", "Foreign Language", 6, 1001),
(220, "Spanish 1", "Foreign Language", 9, 1010),
(221, "Spanish 2", "Foreign Language", 10, 10100),
(222, "Spanish 3", "Foreign Language", 11, 1010),
(223, "Spanish 4", "Foreign Language", 12, 1010),
(224, "French 1", "Foreign Language", 9, 1010),
(225, "French 2", "Foreign Language", 10, 1010),
(226, "French 3", "Foreign Language", 11, 1010),
(227, "French 4", "Foreign Language", 12, 10100),
(228, "German 1", "Foreign Language", 9, 1010),
(229, "German 2", "Foreign Language", 10, 1010),
(230, "German 3", "Foreign Language", 11, 1010),
(231, "German 4", "Foreign Language", 12, 1010),
(232, "Art", "Fine Arts", 6, 1001),
(233, "Music", "Fine Arts", 6, 10100),
(234, "Drama", "Fine Arts", 6, 1001);

-- Inserting into StudentSchedule table
INSERT INTO StudentSchedule(StudentScheduleId, StudentScheduleSemester, StudentScheduleDayOfWeek, StudentSchedulePeriod, StudentScheduleLocation, CourseId)
VALUES
(300, 'Fall', 'Monday', 1, '101', 200),
(301, 'Fall', 'Monday', 2, '102', 201),
(302, 'Fall', 'Monday', 3, '103', 202),
(303, 'Fall', 'Monday', 4, '104', 203),
(304, 'Fall', 'Monday', 5, '105', 204),
(305, 'Fall', 'Tuesday', 1, '101', 205),
(306, 'Fall', 'Tuesday', 2, '102', 207),
(307, 'Fall', 'Tuesday', 3, '103', 208),
(308, 'Fall', 'Tuesday', 4, '104', 209),
(309, 'Fall', 'Tuesday', 5, '105', 210),
(310, 'Fall', 'Wednesday', 1, '101', 211),
(311, 'Fall', 'Wednesday', 2, '102', 212),
(312, 'Fall', 'Wednesday', 3, '103', 213),
(313, 'Fall', 'Wednesday', 4, '104', 214),
(314, 'Fall', 'Wednesday', 5, '105', 216),
(315, 'Fall', 'Thursday', 1, '101', 217),
(316, 'Fall', 'Thursday', 2, '102', 218),
(317, 'Fall', 'Thursday', 3, '103', 219),
(318, 'Fall', 'Thursday', 4, '104', 220),
(319, 'Fall', 'Thursday', 5, '105', 221),
(320, 'Fall', 'Friday', 1, '101', 222),
(321, 'Fall', 'Friday', 2, '102', 223),
(322, 'Fall', 'Friday', 3, '103', 224),
(323, 'Fall', 'Friday', 4, '104', 225),
(324, 'Fall', 'Friday', 5, '105', 226),
(325, 'Spring', 'Monday', 1, '101', 227),
(326, 'Spring', 'Monday', 2, '102', 228),
(327, 'Spring', 'Monday', 3, '103', 229),
(328, 'Spring', 'Monday', 4, '104', 230),
(329, 'Spring', 'Monday', 5, '105', 231),
(330, 'Spring', 'Tuesday', 1, '101', 232),
(331, 'Spring', 'Tuesday', 2, '102', 233),
(332, 'Spring', 'Tuesday', 3, '103', 234),
(333, 'Spring', 'Tuesday', 4, '104', 200),
(334, 'Spring', 'Tuesday', 5, '105', 201),
(335, 'Spring', 'Wednesday', 1, '101', 202),
(336, 'Spring', 'Wednesday', 2, '102', 203),
(337, 'Spring', 'Wednesday', 3, '103', 204),
(338, 'Spring', 'Wednesday', 4, '104', 205),
(339, 'Spring', 'Wednesday', 5, '105', 207),
(340, 'Spring', 'Thursday', 1, '101', 208),
(341, 'Spring', 'Thursday', 2, '102', 209),
(342, 'Spring', 'Thursday', 3, '103', 210),
(343, 'Spring', 'Thursday', 4, '104', 211),
(344, 'Spring', 'Thursday', 5, '105', 212),
(345, 'Spring', 'Friday', 1, '101', 213),
(346, 'Spring', 'Friday', 2, '102', 214),
(347, 'Spring', 'Friday', 3, '103', 216),
(348, 'Spring', 'Friday', 4, '104', 217),
(349, 'Spring', 'Friday', 5, '105', 218);

-- Inserting into Assessment table
INSERT INTO Assessment(AssessmentId, AssessmentType, AssessmentName, AssessmentDate, AssessmentScore, StudentId, StudentScheduleId)
VALUES
(400, 'Test', 'Algebra Test', '2022-10-01', 90, 800, 300),
(401, 'Test', 'Geometry Test', '2022-10-01', 85, 800, 301),
(402, 'Test', 'Algebra 1 Test', '2022-10-01', 95, 800, 302),
(403, 'Test', 'Algebra 2 Test', '2022-10-01', 100, 800, 303),
(404, 'Test', 'Pre-Calculus Test', '2022-10-01', 80, 800, 304),
(405, 'Test', 'Reading Test', '2022-10-01', 90, 801, 305),
(406, 'Test', 'Science Test', '2022-10-01', 85, 801, 306),
(407, 'Test', 'Social Studies Test', '2022-10-01', 95, 801, 307),
(408, 'Test', 'History Test', '2022-10-01', 100, 801, 308),
(409, 'Test', 'Biology Test', '2022-10-01', 80, 801, 309),
(410, 'Test', 'Chemistry Test', '2022-10-01', 90, 802, 310),
(411, 'Test', 'Physics Test', '2022-10-01', 85, 802, 311),
(412, 'Test', 'US History Test', '2022-10-01', 95, 802, 312),
(413, 'Test', 'World History Test', '2022-10-01', 100, 802, 313),
(414, 'Test', 'Economics Test', '2022-10-01', 80, 802, 314),
(415, 'Test', 'Spanish Test', '2022-10-01', 90, 803, 315),
(416, 'Test', 'French Test', '2022-10-01', 85, 803, 316),
(417, 'Test', 'German Test', '2022-10-01', 95, 803, 318),
(418, 'Test', 'Spanish 1 Test', '2022-10-01', 100, 803, 319),
(419, 'Test', 'Spanish 2 Test', '2022-10-01', 80, 803, 320),
(420, 'Test', 'Spanish 3 Test', '2022-10-01', 90, 804, 321),
(421, 'Test', 'Spanish 4 Test', '2022-10-01', 85, 804, 322),
(422, 'Test', 'French 1 Test', '2022-10-01', 95, 804, 323),
(423, 'Test', 'French 2 Test', '2022-10-01', 100, 804, 324),
(424, 'Test', 'French 3 Test', '2022-10-01', 80, 804, 325),
(425, 'Test', 'French 4 Test', '2022-10-01', 90, 805, 326),
(426, 'Test', 'German 1 Test', '2022-10-01', 85, 805, 327),
(427, 'Test', 'German 2 Test', '2022-10-01', 95, 805, 328),
(428, 'Test', 'German 3 Test', '2022-10-01', 100, 805, 329),
(429, 'Test', 'German 4 Test', '2022-10-01', 80, 805, 330),
(430, 'Test', 'Art Test', '2022-10-01', 90, 806, 331),
(431, 'Test', 'Music Test', '2022-10-01', 85, 806, 332),
(432, 'Test', 'Drama Test', '2022-10-01', 95, 806, 333),
(433, 'Test', 'Algebra Test', '2022-10-01', 100, 806, 334),
(434, 'Test', 'Geometry Test', '2022-10-01', 80, 806, 335),
(435, 'Test', 'Algebra 1 Test', '2024-11-01', 90, 819, 336),
(436, 'Test', 'Algebra 2 Test', '2024-11-01', 85, 819, 337),
(437, 'Test', 'Pre-Calculus Test', '2024-11-01', 95, 819, 338),
(438, 'Test', 'Reading Test', '2024-11-01', 100, 819, 339),
(439, 'Test', 'Science Test', '2024-11-01', 80, 819, 340),
(440, 'Test', 'Social Studies Test', '2024-11-01', 90, 819, 341),
(441, 'Test', 'History Test', '2024-11-01', 85, 819, 342),
(442, 'Test', 'Biology Test', '2024-11-01', 95, 819, 343),
(443, 'Test', 'Chemistry Test', '2024-11-01', 100, 819, 344),
(444, 'Test', 'Physics Test', '2024-11-01', 80, 819, 345),
(445, 'Test', 'US History Test', '2024-11-01', 90, 819, 346),
(446, 'Test', 'World History Test', '2024-11-01', 85, 819, 347),
(447, 'Test', 'Economics Test', '2024-11-01', 95, 819, 348),
(448, 'Test', 'Spanish Test', '2024-11-01', 100, 819, 349);

-- Inserting into Grade table
INSERT INTO Grade(GradeId, GradeValue, GradeDate, StudentId, StudentScheduleId)
VALUES
(500, 90, '2022-10-01', 800, 300),
(501, 85, '2022-10-01', 800, 301),
(502, 95, '2022-10-01', 800, 302),
(503, 100, '2022-10-01', 800, 303),
(504, 80, '2022-10-01', 800, 304),
(505, 90, '2022-10-01', 801, 305),
(506, 85, '2022-10-01', 801, 306),
(507, 95, '2022-10-01', 801, 307),
(508, 100, '2022-10-01', 801, 308),
(509, 80, '2022-10-01', 801, 309),
(510, 90, '2022-10-01', 802, 310),
(511, 85, '2022-10-01', 802, 311),
(512, 95, '2022-10-01', 802, 312),
(513, 100, '2022-10-01', 802, 313),
(514, 80, '2022-10-01', 802, 314),
(515, 90, '2022-10-01', 803, 315),
(516, 85, '2022-10-01', 803, 316),
(517, 95, '2022-10-01', 803, 318),
(518, 100, '2022-10-01', 803, 319),
(519, 80, '2022-10-01', 803, 320),
(520, 90, '2022-10-01', 804, 321),
(521, 85, '2022-10-01', 804, 322),
(522, 95, '2022-10-01', 804, 323),
(523, 100, '2022-10-01', 804, 324),
(524, 80, '2022-10-01', 804, 325),
(525, 90, '2022-10-01', 805, 326),
(526, 85, '2022-10-01', 805, 327),
(527, 95, '2022-10-01', 805, 328),
(528, 100, '2022-10-01', 805, 329),
(529, 80, '2022-10-01', 805, 330),
(530, 90, '2022-10-01', 806, 331),
(531, 85, '2022-10-01', 806, 332),
(532, 95, '2022-10-01', 806, 333),
(533, 100, '2022-10-01', 806, 334),
(534, 80, '2022-10-01', 806, 335),
(535, 90, '2024-11-01', 819, 336),
(536, 85, '2024-11-01', 819, 337),
(537, 95, '2024-11-01', 819, 338),
(538, 100, '2024-11-01', 819, 339),
(539, 80, '2024-11-01', 819, 340),
(540, 90, '2024-11-01', 819, 341),
(541, 85, '2024-11-01', 819, 342),
(542, 95, '2024-11-01', 819, 343),
(543, 100, '2024-11-01', 819, 344),
(544, 80, '2024-11-01', 819, 345),
(545, 90, '2024-11-01', 819, 346),
(546, 85, '2024-11-01', 819, 347),
(547, 95, '2024-11-01', 819, 348),
(548, 100, '2024-11-01', 819, 349);