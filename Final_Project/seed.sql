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

-- Create the tables

CREATE TABLE Users(
            UserId                               INTEGER NOT NULL,
            UserFirstName                        VARCHAR(25)     ,
            UserLastName                         VARCHAR(25)     ,
            UserPhone                            VARCHAR(50)     ,
            UserEmail                            VARCHAR(50)     ,
    CONSTRAINT Users_PK PRIMARY KEY (UserId));

CREATE TABLE ParentGuardian(
            ParentGuardianId                     INTEGER NOT NULL,
            ParentGuardianAddress                VARCHAR(255)    ,
            UserId                               INTEGER NOT NULL,
    CONSTRAINT ParentGuardian_PK PRIMARY KEY (ParentGuardianId),
    CONSTRAINT ParentGuardian_FK1 FOREIGN KEY (UserId) REFERENCES Users(UserId));

CREATE TABLE TeacherAdministrator(
            TeacherAdministratorId               INTEGER NOT NULL,
            Title                                VARCHAR(25)     ,
            UserId                               INTEGER NOT NULL,
    CONSTRAINT TeacherAdministrator_PK PRIMARY KEY (TeacherAdministratorId),
    CONSTRAINT TeacherAdministrator_FK1 FOREIGN KEY (UserId) REFERENCES Users(UserId));

CREATE TABLE Course(
            CourseId                             INTEGER NOT NULL,
            CourseName                           VARCHAR(50)     ,
            SubjectArea                          VARCHAR(50)     ,
            GradeLevel                           INTEGER NOT NULL, 
            TeacherAdministratorId               INTEGER NOT NULL,
    CONSTRAINT Course_PK PRIMARY KEY (CourseId),
    CONSTRAINT Course_FK1 FOREIGN KEY (TeacherAdministratorId) REFERENCES TeacherAdministrator(TeacherAdministratorId));

CREATE TABLE Student(
            StudentId                            INTEGER NOT NULL,
            StudentDOB                           DATE            ,
            StudentGender                        VARCHAR(10)     ,
            StudentGradeLevel                    INTEGER NOT NULL,
            StudentAddress                       VARCHAR(255)    ,
            UserId                               INTEGER NOT NULL,
            ParentGuardianId                     INTEGER NOT NULL,
    CONSTRAINT Student_PK PRIMARY KEY (StudentId),
    CONSTRAINT Student_FK1 FOREIGN KEY (UserId) REFERENCES Users(UserId),
    CONSTRAINT Student_FK2 FOREIGN KEY (ParentGuardianId) REFERENCES ParentGuardian(ParentGuardianId));

CREATE TABLE StudentDisability(
            StudentDisabilityId                  INTEGER NOT NULL,
            StudentDisabilityName                VARCHAR(255)    ,
            StudentDisabilityDescription         VARCHAR(255)    ,
            StudentId                            INTEGER NOT NULL,
    CONSTRAINT StudentDisability_PK PRIMARY KEY (StudentDisabilityId),
    CONSTRAINT StudentDisability_FK1 FOREIGN KEY (StudentId) REFERENCES Student(StudentId));

CREATE TABLE StudentSchedule(
            StudentScheduleId                           INTEGER NOT NULL,
            StudentScheduleSemester                     VARCHAR(25)     ,    
            StudentScheduleYear                         INTEGER NOT NULL,   
            StudentSchedulePeriod                       INTEGER NOT NULL,
            StudentScheduleLocation                     VARCHAR(25)     ,
            CourseId                                    INTEGER NOT NULL,
            StudentId                                   INTEGER NOT NULL,
    CONSTRAINT StudentSchedule_PK PRIMARY KEY (StudentScheduleId),
    CONSTRAINT StudentSchedule_FK1 FOREIGN KEY (CourseId) REFERENCES Course(CourseId),
    CONSTRAINT StudentSchedule_FK2 FOREIGN KEY (StudentId) REFERENCES Student(StudentId));

CREATE TABLE Assessment(
            AssessmentId                         INTEGER NOT NULL,
            AssessmentType                       VARCHAR(50)     ,
            AssessmentName                       VARCHAR(50)     ,
            AssessmentDate                       DATE            ,
            AssessmentScore                      FLOAT           ,
            StudentScheduleId                    INTEGER NOT NULL,
    CONSTRAINT Assessment_PK PRIMARY KEY (AssessmentId),
    CONSTRAINT Assessment_FK2 FOREIGN KEY (StudentScheduleId) REFERENCES StudentSchedule(StudentScheduleId));

CREATE TABLE Grade(
            GradeId                                     INTEGER NOT NULL,
            GradeValue                                  FLOAT           ,
            GradeDate                                   DATE            ,
            StudentScheduleId                           INTEGER NOT NULL,
    CONSTRAINT Grade_PK PRIMARY KEY (GradeId),
    CONSTRAINT Grade_FK1 FOREIGN KEY (StudentScheduleId) REFERENCES StudentSchedule(StudentScheduleId));

CREATE TABLE SupportServices(
              SupportServiceId                      INTEGER NOT NULL,
              SupportServiceName                    VARCHAR(255)    ,
              SupportServiceDescription             VARCHAR(255)    ,
              StudentDisabilityId                   INTEGER NOT NULL,
    CONSTRAINT SupportService_PK PRIMARY KEY (SupportServiceId),
    CONSTRAINT SupportService_FK1 FOREIGN KEY (StudentDisabilityId) REFERENCES StudentDisability(StudentDisabilityId));

-- Insert data into the tables
INSERT INTO Users(UserId, UserFirstName, UserLastName, UserPhone, UserEmail) 
VALUES  
(1001, 'John', 'Smith', '1234567000', 'john.smith@example.com'),
(1002, 'Emily', 'Johnson', '1234567001', 'emily.johnson@example.com'),
(1003, 'Michael', 'Brown', '1234567002', 'michael.brown@email.com'),
(1004, 'Sarah', 'Miller', '1234567003', 'sarah.miller@email.com'),
(1005, 'David', 'Davis',  '1234567004', 'david.davis@email.com'),
(1006, 'Jessica', 'Martinez', '1234567005', 'jessica.martinez@email.com'),
(1007, 'Matthew', 'Taylor', '1234567006', 'matthew.taylor@email.com'),
(1008, 'Laura', 'Anderson', '1234567007', 'laura.anderson@email.com'),
(1009, 'Christopher', 'Thomas', '1234567008', 'christopher.thomas@email.com'),
(1010, 'Amanda', 'Hernandez', '1234567009', 'amanda.hernandez@email.com'),
(1011, 'Daniel', 'Young', '1234567010', 'daniel.young@email.com'),
(1012, 'Jennifer', 'King', '1234567011', 'jennifer.king@email.com'),
(1013, 'Ryan', 'Scott', '1234567012', 'ryan.scott@email.com'),
(1014, 'Heather', 'Perez',  '1234567013', 'heather.perez@email.com'),
(1015, 'Nicholas', 'Gonzalez', '1234567014', 'nicholas.gonzalez@email.com'),
(1016, 'Samantha', 'Wilson', '1234567015', 'samantha.wilson@email.com'),
(1017, 'Andrew', 'Walker', '1234567016', 'andrew.walker@email.com'),
(1018, 'Megan', 'Lewis',  '1234567017', 'megan.lewis@email.com'),
(1019, 'Justin', 'Roberts', '1234567018', 'justin.roberts@email.com'),
(1020, 'Brittany', 'Nelson', '1234567019', 'brittany.nelson@email.com'),
(1021, 'Michael', 'Johnson', '5551234567', 'michaelJohnson@example.com'),
(1022, 'Billie', 'Blackwell', '8065552244', 'billie.blackwell@email.com'),
(1023, 'Emily', 'Smith', '8062223333', 'esmith@email.com'),
(1024, 'David', 'Brown', '8064445555', 'dbrown@email.com'),
(1025, 'Sarah', 'Taylor', '8066667777', 's.taylor@email.com'),
(1026, 'James', 'Wilson', '8068889999', 'james.wilson@email.com'),
(1027, 'Jessica', 'Martinez', '8060001111', 'jess.martinez@email.com'),
(1028, 'Christopher', 'Garcia', '8062223333', 'cgarcia21@email.com'),
(1029, 'Jennifer', 'Hernandez', '8064445555', 'jhern@email.com'),
(1030, 'Daniel', 'Gonzalez', '8066667777', 'daniel.gonzalez@email.com'),
(1031, 'Amanda', 'Lopez', '8068889999', 'a.lopez@email.com'),
(1032, 'Matthew', 'Perez', '8060001111', 'mattperez@email.com'),
(1033, 'Elizabeth', 'Adams', '8062223333', 'e.adams@email.com'),
(1034, 'Ryan', 'Campbell', '8064445555', 'campbell33@email.com'),
(1035, 'Kimberly', 'Evans', '8066667777', 'kevens@email.com'),
(1036, 'Kevin', 'Turner', '8068889999', 'kevin.turner@email.com'),
(1037, 'Michelle', 'Collins', '8060001111', 'm.collins1@email.com'),
(1038, 'Jason', 'Murphy', '8062223333', 'jmurphy.1@email.com'),
(1039, 'Nicole', 'Rivera', '8064445555', 'nicole.rivera@email.com'),
(1040, 'David', 'Cooper', '8066667777', 'david.cooper@email.com'),
(1041, 'Lauren', 'Harris', '8061112222', 'lauren.harris@email.com'),
(1042, 'Brandon', 'Martinez', '8063334444', 'brandon.martinez@email.com'),
(1043, 'Ashley', 'Thompson', '8065556666', 'ashley.thompson@email.com'),
(1044, 'Justin', 'Nelson', '8067778888', 'justin.nelson@email.com'),
(1045, 'Stephanie', 'Carter', '8069990001', 'stephanie.carter@email.com'),
(1046, 'Kyle', 'Mitchell', '8061112223', 'kyle.mitchell@email.com'),
(1047, 'Rachel', 'Roberts', '8063334445', 'rachel.roberts@email.com'),
(1048, 'Joshua', 'Cook', '8065556667', 'joshua.cook@email.com'),
(1049, 'Melissa', 'Morales', '8067778889', 'melissa.morales@email.com'),
(1050, 'Tyler', 'Hill', '8069990002', 'tyler.hill@email.com'),
(1051, 'Kayla', 'Mitchell', '8061112224', 'kayla.mitchell@email.com'),
(1052, 'Jonathan', 'Gonzalez', '8063334446', 'jonathan.gonzalez@email.com'),
(1053, 'Hannah', 'Parker', '8065556668', 'hannah.parker@email.com'),
(1054, 'Cody', 'Edwards', '8067778890', 'cody.edwards@email.com'),
(1055, 'Rebecca', 'Flores', '8069990003', 'rebecca.flores@email.com'),
(1056, 'Jordan', 'Morris', '8061112225', 'jordan.morris@email.com'),
(1057, 'Maria', 'Bailey', '8063334447', 'maria.bailey@email.com'),
(1058, 'Dylan', 'Barnes', '8065556669', 'dylan.barnes@email.com'),
(1059, 'Morgan', 'Howard', '8067778891', 'morgan.howard@email.com'),
(1060, 'Nathan', 'Hughes', '8069990004', 'nathan.hughes@email.com');

-- Inserting into Parent table
INSERT INTO ParentGuardian(ParentGuardianId, ParentGuardianAddress, UserId)
VALUES
(0001, '123 Main St, Anytown, Lubbock TX, 79413', 1001),
(0002, '8480 SW 81st Ave, Lubbock TX, 79407',1002),
(0003, '2208 78th St, Lubbock TX, 79413', 1003),
(0004, '4321 Elm St,  Lubbock TX, 79401', 1004),
(0005, '5678 Oak St, Lubbock TX, 79402', 1005),
(0006, '8765 Maple St, Lubbock TX, 79403', 1006),
(0007, '9876 Pine St, Lubbock TX, 79404', 1007),
(0008, '1357 Cedar St, Lubbock TX, 79405', 1008),
(0009, '2468 Birch St, Lubbock TX, 79406', 1009),
(0010, '3698 Poplar St, Lubbock TX, 79407', 1010),
(0011, '7531 Sycamore St, Lubbock TX, 79408', 1011),
(0012, '8642 Walnut St, Lubbock TX, 79409', 1012),
(0013,  '9753 Cherry St, Lubbock TX, 79410', 1013),
(0014,  '2580 Pineapple St, Lubbock TX, 79411', 1014),
(0015, '3690 Banana St, Lubbock TX, 79412', 1015),
(0016,  '7412 Orange St, Lubbock TX, 79413', 1016),
(0017, '1478 Grape St, Lubbock TX, 79414', 1017),
(0018,  '3691 Lemon St, Lubbock TX, 79415', 1018),
(0019, '7530 Lime St, Lubbock TX, 79416', 1019),
(0020, '8963 Strawberry St, Lubbock TX, 79417', 1020);

    -- Inserting into TeacherAdministrator table
INSERT INTO TeacherAdministrator(TeacherAdministratorId, Title, UserId)
VALUES 
(01, 'Teacher', 1021),
(10, 'Teacher', 1022),
(11, 'Principle', 1023),
(100, 'Case Manager', 1024),
(101, 'Teacher', 1025),
(110, 'Teacher', 1026),
(111, 'Teacher', 1027),
(1000, 'Teacher', 1028),
(1001, 'Teacher', 1029),
(1010, 'Case Manager', 1030),
(1011, 'Teacher', 1031),
(1100, 'Teacher', 1032),
(1101, 'Case Manager', 1033),
(1110, 'Teacher', 1034),
(1111, 'Teacher', 1035),
(10000, 'Teacher', 1036),
(10001, 'Teacher', 1037),
(10010, 'Teacher', 1038),
(10011, 'Teacher', 1039),
(100000, 'Assistant Principal', 1040);


-- Inserting into Student table
INSERT INTO Student(StudentId, StudentDOB, StudentGender, StudentGradeLevel, UserId, ParentGuardianId)
VALUES
(800, '2010-12-13', 'M', 8, 1041, 0001),
(801, '2008-12-31', 'M', 9, 1042, 0002),
(802, '2007-03-17', 'F', 9, 1043, 0003),
(803, '2009-05-21', 'F', 9, 1044, 0004),
(804, '2008-12-31', 'M', 7, 1045, 0005),
(805, '2007-03-17', 'F', 9, 1046, 0006),
(806, '2011-02-28', 'F', 8, 1047, 0007),
(807, '2010-06-15', 'M', 7, 1048, 0008),
(808, '2009-09-03', 'F', 9, 1049, 0009),
(809, '2012-05-10', 'M', 7, 1050, 0010),
(810, '2011-03-25', 'F', 8, 1051, 0011),
(811, '2010-07-12', 'M', 9, 1052, 0012),
(812, '2009-10-20', 'F', 8, 1053, 0013),
(813, '2012-06-05', 'M', 7, 1054, 0014),
(814, '2011-04-15', 'F', 9, 1055, 0015),
(815, '2010-08-30', 'M', 8, 1056, 0016),
(816, '2009-11-10', 'F', 7, 1057, 0017),
(817, '2012-07-20', 'M', 9, 1058, 0018),
(818, '2011-05-05', 'F', 8, 1059, 0019),
(819, '2010-09-20', 'M', 7, 1060, 0020);

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
(1019, "Specific Learning Disability", "Specific Learning Disability", 819),
(1020, "Dysgraphia", "Difficulty writing", 800),
(1021, "Dyscalculia", "Difficulty with math", 800),
(1022, "ADHD", "Attention Deficit Hyperactivity Disorder", 802),
(1023, "ADHD", "Attention Deficit Hyperactivity Disorder", 801),
(1024, "ADHD", "Attention Deficit Hyperactivity Disorder", 804);

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
(10020, 'Oral Testing', 'Teacher will read the test to the student', 1020),
(10021, 'Note Taker', 'Student will have a note taker', 1021),
(10022, 'Calculator', 'Student will be allowed to use a calculator', 1022),
(10023, 'Extra Time', 'Student will have extra time to complete the test', 1023),
(10024, 'Scribe', 'Student will have someone write for them', 1024),
(10025, 'Scribe', 'Student will have someone write for them', 1005),
(10026, 'Small Group', 'Student will be in a small group', 1005);


-- Inserting into Course table
INSERT INTO Course(CourseId, CourseName, SubjectArea, GradeLevel, TeacherAdministratorId)
VALUES
(200, "Algreba", "Mathematics", 8, 01),
(201, 'Geometry', 'Mathematics', 8, 01),
(202, 'Algebra 1', 'Mathematics', 8, 1001 ),
(203, 'Algebra 2', 'Mathematics', 9, 1001),
(204, 'Pre-Calculus', 'Mathematics', 6, 1001),
(205, "Reading", "Language Arts", 6, 1000),
(207, "Science", "Science", 6, 1000),
(208, "Social Studies", "Social Studies", 6, 1000),
(209, "History", "Social Studies", 6, 1100),
(210, "Biology", "Science", 9, 1100),
(211, "Chemistry", "Science", 7, 1100),
(212, "Physics", "Science", 7, 1110),
(213, "US History", "Social Studies", 9, 1110),
(214, "World History", "Social Studies", 10, 1110),
(216, "Economics", "Social Studies", 9, 1110),
(217, "Spanish", "Foreign Language", 6, 1110),
(218, "French", "Foreign Language", 6, 10011),
(219, "German", "Foreign Language", 7, 10011),
(220, "Spanish 1", "Foreign Language", 9, 10011),
(221, "Spanish 2", "Foreign Language", 7, 10011),
(222, "Spanish 3", "Foreign Language", 7, 10011),
(223, "Spanish 4", "Foreign Language", 8, 10011),
(224, "French 1", "Foreign Language", 9, 10011),
(225, "French 2", "Foreign Language", 8, 10011),
(226, "French 3", "Foreign Language", 6, 10011),
(227, "French 4", "Foreign Language", 8, 10011),
(228, "German 1", "Foreign Language", 9, 10011),
(229, "German 2", "Foreign Language", 7, 10011),
(230, "German 3", "Foreign Language", 7, 10011),
(231, "German 4", "Foreign Language", 9, 10011),
(232, "Art", "Fine Arts", 7, 111),
(233, "Music", "Fine Arts", 7, 111),
(234, "Drama", "Fine Arts", 7, 111);

-- Inserting into StudentSchedule table
INSERT INTO StudentSchedule(StudentScheduleId, StudentScheduleSemester, StudentScheduleYear, StudentSchedulePeriod, StudentScheduleLocation, CourseId, StudentId)
VALUES
(300, 'Fall', 2024,   1, '101', 200, 800),
(301, 'Fall', 2024,   2, '100', 214, 800),
(302, 'Fall', 2024,   3, '102', 201, 800),
(303, 'Fall', 2024,  4, '103', 202, 800),
(304, 'Fall', 2024,  5, '104', 203, 800),
(305, 'Fall', 2024,  6, '105', 205, 800),
(306, 'Fall', 2024,   1, '106', 207, 801),
(307, 'Fall', 2024,   2, '107', 208, 801),
(308, 'Fall', 2024,   3, '108', 209, 801),
(309, 'Fall', 2024,   4, '109', 210, 801),
(310, 'Fall', 2024,   1, '101', 211, 802),
(311, 'Fall', 2024,   2, '100', 212, 802),
(312, 'Fall', 2024,   3, '102', 213, 802),
(313, 'Fall', 2024,   4, '103', 214, 802),
(314, 'Fall', 2024,   5, '104', 205, 802),
(315, 'Fall', 2024,   6, '105', 217, 803),
(316, 'Fall', 2024,   7, '106', 218, 803),
(318, 'Fall', 2024,   8, '107', 219, 803),
(319, 'Fall', 2024,   9, '108', 220, 803),
(320, 'Fall', 2024,   10, '109', 221, 803),
(321, 'Fall', 2024,   1, '101', 222, 804),
(322, 'Fall', 2024,   2, '100', 223, 804),
(323, 'Fall', 2024,  1, '098', 224, 804),
(324, 'Fall', 2024,  2, '099', 225, 804),
(325, 'Fall', 2024,  3, '100', 226, 804),
(326, 'Fall', 2024,  4, '101', 227, 805),
(327, 'Fall', 2024,  5, '102', 228, 805),
(328, 'Fall', 2024,  6, '103', 229, 805),
(329, 'Fall', 2024,  7, '104', 230, 805),
(330, 'Fall', 2024,  8, '105', 231, 805),
(331, 'Fall', 2024,  9, '106', 232, 806),
(332, 'Fall', 2024,  10, '107', 233, 806),
(333, 'Fall', 2024,  1, '101', 234, 806),
(334, 'Fall', 2024,  2, '100', 200, 806),
(335, 'Fall', 2024,  3, '102', 201, 806),
(336, 'Fall', 2024,  4, '103', 202, 819),
(337, 'Fall', 2024,  5, '104', 203, 819),
(338, 'Fall', 2024,  6, '105', 205, 819),
(339, 'Fall', 2024,  7, '106', 207, 819),
(340, 'Fall', 2024,  8, '107', 208, 819),
(341, 'Fall', 2024,  9, '108', 209, 819),
(342, 'Fall', 2024,  10, '109', 210, 819),
(343, 'Fall', 2024,  1, '101', 211, 819)

-- Inserting into Assessment table
INSERT INTO Assessment(AssessmentId, AssessmentType, AssessmentName, AssessmentDate, AssessmentScore, StudentScheduleId)
VALUES
(400, 'Standard', 'Algebra Test', '2024-10-01', 90, 300),
(401, 'Standard', 'World History', '2024-01-02', 75, 301),
(434, 'Formative', 'Geometry', '2024-02-02', 80,  302),
(402, 'Standard', 'Reading', '2024-02-03', 65,  305),
(403, 'Formative', 'Social Studies', '2024-01-04', 70,  307),
(404, 'Standard', 'Biology', '2024-01-04', 85, 309),
(405, 'Standard', 'Chemistry', '2024-01-04', 90,  310),
(406, 'Standard', 'Physics', '2024-01-04', 55,  311),
(407, 'Standard', 'US History', '2024-01-04', 100,  312),
(408, 'Formative', 'World History', '2024-01-04', 55,  313),
(409, 'Standard', 'Economics', '2024-01-04', 65,  314),
(410, 'Standard', 'Spanish', '2024-01-04', 85,  315),
(411, 'Standard', 'French', '2024-01-04', 95,  316),
(412, 'Standard', 'German', '2024-01-04', 77,  318),
(413, 'Standard', 'Spanish 1', '2024-01-04', 75,  319),
(414, 'Standard', 'Spanish 2', '2024-01-04', 45,  320),
(415, 'Standard', 'Spanish 3', '2024-01-04', 85, 321),
(416, 'Standard', 'Spanish 4', '2024-01-04', 95,  322),
(417, 'Standard', 'French 1', '2024-01-04', 88, 323),
(418, 'Standard', 'French 2', '2024-01-04', 80,  324),
(419, 'Standard', 'French 3', '2024-01-04', 90,  325),
(420, 'Standard', 'French 4', '2024-01-04', 85,  326),
(421, 'Standard', 'German 1', '2024-01-04', 95, 327),
(422, 'Standard', 'German 2', '2024-01-04', 100, 328),
(423, 'Standard', 'German 3', '2024-01-08', 80,  329),
(424, 'Standard', 'German 4', '2024-01-04', 90,  330),
(425, 'Standard', 'Art', '2024-01-04', 85, 331),
(426, 'Standard', 'Music', '2024-01-04', 95,  332),
(427, 'Standard', 'Drama', '2024-01-04', 95,  333),
(428, 'Standard', 'Art', '2024-01-04', 80,  334),
(429, 'Standard', 'Music', '2024-10-04', 90,  335),
(430, 'Standard', 'Drama', '2024-01-04', 85,  336),
(431, 'Standard', 'Art', '2024-01-04', 95,  337),
(432, 'Standard', 'Music', '2024-01-04', 65,  338),
(433, 'Standard', 'Drama', '2024-01-04', 80, 339);

-- Inserting into Grade table
INSERT INTO Grade(GradeId, GradeValue, GradeDate, StudentScheduleId)
VALUES
(500, 80, '2024-04-30', 300),
(501, 90, '2024-04-1', 301),
(502, 85, '2024-04-01', 302),
(503, 75, '2024-04-01', 303),
(504, 70, '2024-04-01', 304),
(505, 85, '2024-04-01', 305),
(506, 90, '2024-04-01', 306),
(507, 95, '2024-04-01', 307),
(508, 100, '2024-04-01', 308),
(509, 85, '2024-04-01', 309),
(510, 90, '2024-04-01', 310),
(511, 95, '2024-04-01', 311),
(512, 65, '2024-04-01', 312),
(513, 85, '2024-04-01', 313),
(514, 90, '2024-04-01', 314),
(515, 95, '2024-04-01', 315),
(516, 85, '2024-04-01', 316),
(517, 90, '2024-04-01', 318),
(518, 95, '2024-04-01', 319),
(519, 85, '2024-04-01', 320),
(520, 55, '2024-04-01', 321),
(521, 95, '2024-04-01', 322),
(522, 85, '2024-04-01', 323),
(523, 90, '2024-04-01', 324),
(524, 95, '2024-04-01', 325),
(525, 85, '2024-04-01', 326),
(526, 90, '2024-04-01', 327),
(527, 95, '2024-04-01', 328),
(528, 85, '2024-04-01', 329),
(529, 90, '2024-04-01', 330),
(530, 95, '2024-04-01', 331),
(531, 85, '2024-04-01', 332),
(532, 90, '2024-04-01', 333),
(533, 95, '2024-04-01', 334),
(534, 85, '2024-04-01', 335),
(535, 90, '2024-04-01', 336),
(536, 95, '2024-04-01', 337),
(537, 85, '2024-04-01', 338),
(538, 90, '2024-04-01', 339),
(539, 95, '2024-04-01', 340),
(540, 85, '2024-04-01', 341),
(541, 90, '2024-04-01', 342),
(542, 95, '2024-04-01', 343);

