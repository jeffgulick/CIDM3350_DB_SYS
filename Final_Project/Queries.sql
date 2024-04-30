USE SPED_01;

-- Select all students and their information
SELECT UserFirstName, UserLastName
FROM Student
JOIN Users ON Users.UserId = Student.UserId
ORDER BY Users.UserFirstName, Users.UserLastName;

-- Prints all students and their learning disability information
SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    d.StudentDisabilityDescription
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN StudentDisability d ON sd.StudentDisabilityId = d.StudentDisabilityId
ORDER BY u.UserFirstName, u.UserLastName;

-- Prints learning disability information for a specific student
SELECT 
    u.UserFirstName, 
    u.UserLastName, 
    d.StudentDisabilityName,
    d.StudentDisabilityDescription
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN StudentDisability d ON sd.StudentDisabilityId = d.StudentDisabilityId
WHERE u.UserFirstName = 'Kyle' AND u.UserLastName = 'Mitchell'
ORDER BY u.UserFirstName, u.UserLastName;

-- Prints support services for a specific student
SELECT DISTINCT 
    u.UserFirstName,
    u.UserLastName,
    svc.SupportServiceName, 
    svc.SupportServiceDescription
FROM Student s
JOIN Users u ON s.UserId = u.UserId
JOIN StudentDisability sd ON s.StudentId = sd.StudentId
JOIN SupportServices ssvc ON sd.StudentDisabilityId = ssvc.StudentDisabilityId
JOIN SupportServices svc ON ssvc.SupportServiceId = svc.SupportServiceId
WHERE u.UserFirstName = 'Kyle' AND u.UserLastName = 'Mitchell'
ORDER BY svc.SupportServiceName;
-- Prints student information and their parent/guardian information
SELECT 
    student.StudentDOB, 
    student.StudentGender, 
    student.StudentGradeLevel, 
    user1.UserFirstName AS StudentFirstName, 
    user1.UserLastName AS StudentLastName, 
    user2.UserFirstName AS ParentFirstName, 
    user2.UserLastName AS ParentLastName, 
    user2.UserPhone AS ParentPhone
FROM Student student
JOIN Users user1 ON student.UserId = user1.UserId
JOIN ParentGuardian ON student.ParentGuardianId = ParentGuardian.ParentGuardianId
JOIN Users user2 ON ParentGuardian.UserId = user2.UserId
ORDER BY user1.UserFirstName, user1.UserLastName;





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
WHERE u.UserFirstName = 'Lauren' AND u.UserLastName = 'Harris'
AND ss.StudentScheduleYear = 2024 AND ss.StudentScheduleSemester = 'Fall'
ORDER BY ss.StudentSchedulePeriod;

