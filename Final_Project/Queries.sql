USE SPED_01;

-- Select all students
SELECT UserFirstName, UserLastName
FROM Student
JOIN Users ON Users.UserId = Student.UserId
ORDER BY Users.UserLastName ASC;

-- Counts the number of students in the database
SELECT COUNT(*) AS NumberOfStudents
FROM Student;

-- Prints student information and their parent/guardian information
SELECT 
    user1.UserFirstName AS StudentFirstName, 
    user1.UserLastName AS StudentLastName, 
    student.StudentDOB AS DOB, 
    student.StudentGender AS Gender,
    student.StudentGradeLevel AS GradeLevel, 
    user2.UserFirstName AS ParentFirstName, 
    user2.UserLastName AS ParentLastName, 
    user2.UserPhone AS ParentPhone
FROM Student student
JOIN Users user1 ON student.UserId = user1.UserId
JOIN ParentGuardian ON student.ParentGuardianId = ParentGuardian.ParentGuardianId
JOIN Users user2 ON ParentGuardian.UserId = user2.UserId
ORDER BY user1.UserLastName ASC;


-- Select all teachers and their information
SELECT 
    u.UserFirstName, 
    u.UserLastName,
    u.UserPhone,
    u.UserEmail, 
    t.Title
FROM TeacherAdministrator t
JOIN Users u ON t.UserId = u.UserId
ORDER BY u.UserLastName ASC;

-- Prints all students and their learning disability information
SELECT 
    u.UserFirstName AS FirstName, 
    u.UserLastName AS LastName,
    d.StudentDisabilityName 
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN StudentDisability d ON sd.StudentDisabilityId = d.StudentDisabilityId
ORDER BY u.UserLastName ASC;

-- Prints learning disability information for a specific student
SELECT 
    u.UserFirstName AS FirstName, 
    u.UserLastName AS LastName, 
    d.StudentDisabilityName AS DisabilityName,
    d.StudentDisabilityDescription
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN StudentDisability d ON sd.StudentDisabilityId = d.StudentDisabilityId
WHERE u.UserFirstName = 'Ashley' AND u.UserLastName = 'Thompson'
ORDER BY u.UserFirstName, u.UserLastName;

-- Prints support services for a specific student
SELECT DISTINCT 
    u.UserFirstName AS FirstName,
    u.UserLastName AS LastName,
    svc.SupportServiceName, 
    svc.SupportServiceDescription
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN SupportServices ssvc ON sd.StudentDisabilityId = ssvc.StudentDisabilityId
JOIN SupportServices svc ON ssvc.SupportServiceId = svc.SupportServiceId
WHERE u.UserFirstName = 'Ashley' AND u.UserLastName = 'Thompson'
ORDER BY svc.SupportServiceName;

--Prints student schedule for 2024, with current course grades.
SELECT 
    c.CourseName, 
    ss.StudentScheduleSemester AS Semester, 
    ss.StudentScheduleYear AS Year, 
    ss.StudentSchedulePeriod AS ClassPeriod, 
    ss.StudentScheduleLocation AS RoomNumber,
    g.GradeValue AS CurrentGrade
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Course c ON ss.CourseId = c.CourseId
JOIN Grade g ON ss.StudentScheduleId = g.StudentScheduleId
WHERE u.UserFirstName = 'Ashley' AND u.UserLastName = 'Thompson'
AND ss.StudentScheduleYear = 2024 AND ss.StudentScheduleSemester = 'Fall'
ORDER BY ss.StudentSchedulePeriod ASC;

--Prints student schedule for 2024, with current course grades and teacher information.
SELECT 
    c.CourseName, 
    ss.StudentScheduleSemester AS Semester, 
    ss.StudentScheduleYear AS Year, 
    ss.StudentSchedulePeriod AS ClassPeriod, 
    ss.StudentScheduleLocation AS RoomNumber,
    g.GradeValue AS CurrentGrade,
    tu.UserFirstName AS TeacherFirstName,
    tu.UserLastName AS TeacherLastName
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Course c ON ss.CourseId = c.CourseId
JOIN TeacherAdministrator t ON c.TeacherAdministratorId = t.TeacherAdministratorId
JOIN Users tu ON t.UserId = tu.UserId
JOIN Grade g ON ss.StudentScheduleId = g.StudentScheduleId
WHERE u.UserFirstName = 'Ashley' AND u.UserLastName = 'Thompson'
AND ss.StudentScheduleYear = 2024 AND ss.StudentScheduleSemester = 'Fall'
ORDER BY ss.StudentSchedulePeriod ASC;

-- Prints all assessments for a specific student
SELECT 
    a.AssessmentDate,
    a.AssessmentType, 
    a.AssessmentName, 
    sa.AssessmentScore
FROM StudentSchedule ss
JOIN Student s ON ss.StudentId = s.StudentId
JOIN Users u ON s.UserId = u.UserId
JOIN Assessment sa ON ss.StudentScheduleId = sa.StudentScheduleId
JOIN Assessment a ON sa.AssessmentId = a.AssessmentId
WHERE u.UserFirstName = 'Ashley' AND u.UserLastName = 'Thompson'
ORDER BY a.AssessmentType, a.AssessmentName;

-- Prints all students with grades below 80 and the course they are enrolled in
SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    c.CourseName,
    g.GradeValue
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Course c ON ss.CourseId = c.CourseId
JOIN Grade g ON ss.StudentScheduleId = g.StudentScheduleId
WHERE g.GradeValue < 80;

-- Prints all students with grades below 80, the course they are enrolled in, and the period and semester
SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    c.CourseName,
    ss.StudentSchedulePeriod AS Period,
    ss.StudentScheduleSemester AS Semester,
    g.GradeValue
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Course c ON ss.CourseId = c.CourseId
JOIN Grade g ON ss.StudentScheduleId = g.StudentScheduleId
WHERE g.GradeValue < 80;

-- Prints all students with Assessment Scores below 70
SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    a.AssessmentName,
    a.AssessmentDate,
    a.AssessmentScore
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Assessment a ON ss.StudentScheduleId = a.StudentScheduleId
WHERE a.AssessmentScore < 70;

SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    c.CourseName,
    a.AssessmentName,
    a.AssessmentDate,
    a.AssessmentScore
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentSchedule ss ON s.StudentId = ss.StudentId
JOIN Course c ON ss.CourseId = c.CourseId
JOIN Assessment a ON ss.StudentScheduleId = a.StudentScheduleId
WHERE a.AssessmentScore < 70;
