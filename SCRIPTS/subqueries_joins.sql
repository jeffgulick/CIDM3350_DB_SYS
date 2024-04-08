-- Testing Convert builtin  function
-- syntax  CONVERT(expr, type) 
SELECT CONVERT(12.4, Signed); 
SELECT CAST(12.4 AS signed);

SELECT CAST('12-11-20' AS DATE);

-- Run  to select the appropriate database
USE simpleuniversity;  



/* ==================== Subquerries ============================== */
-- Noncorrelated subqueries 
-- Example1: To show names of students whose Major department name has the word "Computer" in it
SELECT concat(s.first_name,' ',s.last_name) , departments_DepID_Major as Major
FROM students s
WHERE  s.departments_DepID_Major
     IN ( SELECT depID 
          FROM departments 
          WHERE DName LIKE '%Computer%');





/*====================================================================*/
-- Attribute Sub-Query : 
-- Example 1: Show student names and their average grade 

SELECT concat(s.first_name,' ',s.last_name) as name, 
	   (SELECT avg(grade) 
         FROM enrolls_in en  
         WHERE  en.students_id = s.id ) as 'avg Grade' 
FROM students s;


 /*================================================================================================================
 FROM clause Sub-Query Example: Show student ID and  Average grade for all students in department with DepID=2
 ================================================================================================================*/

SELECT r.sid,r.AvgGrade 
FROM 
		(SELECT s.id as sid, s.departments_DepID_Major as major, avg(grade) as  AvgGrade 
		 FROM students s, enrolls_in en 
		 WHERE en.students_id = s.id 
		 GROUP BY s.id
         ) as r
WHERE r.major =2;


-- Example 2: Calculate average number of students per course
SELECT AVG(c) FROM 
				(SELECT count(students_id) as c 
                            FROM  enrolls_in e2 
                            group by courses_CourseID, year,Semester) r;

/*================================================================================================================
 WHERE clause Subqueries  Example:  The following query will  
 ================================================================================================================*/
-- Show names of youngest student in each department
SELECT s1.first_name,s1.last_name, s1.dob, s1.departments_DepID_Major as Major
FROM students s1
WHERE   dob >=  ( SELECT  max(dob) 
				 FROM students s2 
                 WHERE s1.departments_DepID_Major = s2.departments_DepID_Major
                 )
 ;
 

/*================================================================================================================     
  Mix of FROM and WHERE corrolated sub-Queries Example: 
  To Show the students major department id and their avg grade for those students whose 
  avg grade >= avg grade of all students of their major department. 
  So for each student we need to calculate the average grade of his department first, then if his grade is above 
  his department's average he  will be selected, otherwise not.
  ================================================================================================================*/
SELECT * FROM 
        (SELECT s.id, s.departments_DepID_Major as major, avg(grade) as a 
         FROM  students s, enrolls_in en    
         WHERE en.students_id = s.id 
         GROUP BY s.id) r
WHERE r.a >=(SELECT  AVg(er.grade) 
              FROM  enrolls_in er,  students s2  
			  WHERE s2.id = er.students_id
					AND s2.departments_DepID_Major= r.Major
             ) ;

-- the following is similar to above query using Join instead 
SELECT * FROM 
          (SELECT s.id, s.departments_DepID_Major as major, avg(grade) as a 
           FROM students s, enrolls_in en  
           WHERE en.students_id = s.id 
           GROUP BY  s.id) r
WHERE r.a >=(SELECT  AVg(er.grade) FROM 
      enrolls_in er JOIN students s2 ON s2.id = er.students_id   
      WHERE  s2.departments_DepID_Major= r.Major
     ) ;
     
     
/* ================ JOINS ===================================================================================*/

/*================================================================================================================
 Join Examples:  
 ================================================================================================================*/
-- EXAMPLE 1: Calculate Avg of students grades per major
SELECT s.departments_DepID_Major as Major, AVg(er.grade) as 'Avg.Grade' 
	FROM      enrolls_in er 
	JOIN students s on s.id = er.students_id  
      	group by s.departments_DepID_Major;


-- EXAMPLE 2: calculate average grades of students major in dep with DepId=2   
-- Without JOIN command   
SELECT  AVg(er.grade) 
	FROM   enrolls_in er , students s    
	WHERE   s.id = er.students_id
      	AND s.departments_DepID_Major=2;
      
      
   -- with JOIN   
SELECT  AVg(er.grade) 
	FROM  enrolls_in er 
	JOIN students s ON  s.id = er.students_id
	WHERE s.departments_DepID_Major=2;


-- EXAMPLE 3: Show students and their Major
SELECT concat(first_name,' ',last_name) as Fullname, DepId
	FROM students  
	JOIN departments ON (DepID = departments_DepID_Major);



/*================================================================================================================
 Join Examples:   Cross join
 ================================================================================================================*/

-- Using CROSS JOIN Command  
SELECT concat(first_name,' ',last_name) , DepId
	FROM students 	
	CROSS JOIN departments;

-- Using JOIN without ON clasue
SELECT concat(first_name,' ',last_name) , DepId
	FROM students  
	JOIN departments;


/*================================================================================================================
 OUTER Join Examples:   Left, Right and Full
 ================================================================================================================*/

-- Left  JOIN
-- EXAMPLE 1: Will include students who dont have major
SELECT concat(first_name,' ',last_name) , DepId
	FROM students 
	LEFT JOIN departments ON (DepID = departments_DepID_Major);

-- RIGHT JOIN
-- EXAMPLE 2: Will include departments  that have no student major in
SELECT concat(first_name,' ',last_name) , DepId
	FROM students 
	RIGHT JOIN departments on (DepID = departments_DepID_Major);



/*================================================================================================================
 More  JOIN Examples:   Using toy data and small tables. 
 Here we create new schema with two simple tables to illustrate JOIN operations
 ================================================================================================================*/

Create schema IF NOT EXISTS  s1;
use s1;


Create  table t1 ( a int, b char);
insert into t1 (a,b) values (1, 'x'),(2,'y'),(3,'x'),(4,'y'),(5,'z');

Create  table t2 ( c int, d char);
insert into t2 (c,d) values (10, 'y'),(20,'x'),(30,'x'),(40,'y'),(50,'W');

-- Cross join, == Join without on clause
SELECT ROW_NUMBER() OVER (ORDER BY t1.a) as idx, a,b,c,d 
	FROM t1 
	CROSS JOIN t2;

SELECT * 
	FROM t1 
	INNER JOIN t2;


-- left Join
SELECT * 
	FROM t1 
	left JOIN t2 on (t1.b=t2.d);

-- Inner Join
SELECT * 
	FROM t1  
	JOIN t2 on (t1.b=t2.d) order by t1.a;

-- FULL outer Join
-- Full outer join. MySQL does not directly provide FULL OUTER JOIN command, 
-- but you can work around  that using UNION of two RIGHT and LEFT joins

SELECT * 
	FROM t1 
	RIGHT  JOIN t2 on (t1.b=t2.d)
	UNION 
		SELECT * 
			FROM t1 
			LEFT  JOIN t2 on (t1.b=t2.d) ;

-- To include duplicates
SELECT * 
	FROM t1 
	RIGHT JOIN t2 on (t1.b=t2.d)
	UNION  ALL
		SELECT * 
		FROM t1 
		LEFT  JOIN t2 on (t1.b=t2.d);


--  JOIN 3 TABLES 

Create  table t3 ( f int, d char);
insert into t3 (f,d) values (100, 'z'),(200,'x'),(300,'k'),(400,'x'),(500,'W');

-- if you use same colmn names and equi-join you can just use the column name in ON clause

SELECT * FROM T1 
         JOIN T2 ON (t1.b=t2.d) 
		 JOIN T3 ON (t2.d=t3.d) ;
         
SELECT * FROM T3;





