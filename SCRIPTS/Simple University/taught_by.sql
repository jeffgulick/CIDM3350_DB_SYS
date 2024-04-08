CREATE DATABASE  IF NOT EXISTS `simpleuniversity` ;
USE `simpleuniversity`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- Table structure for table `taught_by`

DROP TABLE IF EXISTS taught_by;

CREATE TABLE taught_by (
  courses_CourseID varchar(9) NOT NULL,
  professors_ProfID int NOT NULL,
  Semester varchar(7) NOT NULL DEFAULT 'Fall',
  `Year` varchar(4) NOT NULL DEFAULT 2009,
  PRIMARY KEY (courses_CourseID,professors_ProfID,`Year`, Semester),
  CONSTRAINT fk_courses_Taughtby FOREIGN KEY (courses_CourseID) REFERENCES courses (CourseID),
  CONSTRAINT fk_prof_Taughtby FOREIGN KEY ( professors_ProfID) REFERENCES  professors (ProfID)
  
) ;


--   inserting data

INSERT INTO taught_by VALUES ('ACCT-5038',11,'Fall','2009');
INSERT INTO taught_by VALUES ('ACCT-5038',13,'Spring','2009');
INSERT INTO taught_by VALUES ('ACCT-6257',11,'Fall','2009');
INSERT INTO taught_by VALUES ('ACCT-6257',13,'Fall','2010');
INSERT INTO taught_by VALUES ('ACCT-6803',11,'Fall','2009');
INSERT INTO taught_by VALUES ('ACCT-6803',13,'Fall','2011');
INSERT INTO taught_by VALUES ('AGSC-4199',8,'Fall','2009');
INSERT INTO taught_by VALUES ('AGSC-4199',15,'Spring','2009');
INSERT INTO taught_by VALUES ('AGSC-6111',8,'Fall','2010');
INSERT INTO taught_by VALUES ('AGSC-6111',15,'Fall','2009');
INSERT INTO taught_by VALUES ('AGSC-6435',8,'Fall','2009');
INSERT INTO taught_by VALUES ('AGSC-6435',15,'Fall','2010');
INSERT INTO taught_by VALUES ('AGSC-6706',8,'Spring','2010');
INSERT INTO taught_by VALUES ('AGSC-6706',15,'Fall','2009');
INSERT INTO taught_by VALUES ('AGSC-6744',8,'Fall','2009');
INSERT INTO taught_by VALUES ('AGSC-6744',15,'Spring','2009');
INSERT INTO taught_by VALUES ('CHPH-3229',16,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-3229',20,'Fall','2010');
INSERT INTO taught_by VALUES ('CHPH-4247',16,'Fall','2010');
INSERT INTO taught_by VALUES ('CHPH-4247',20,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-5108',16,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-5108',20,'Fall','2010');
INSERT INTO taught_by VALUES ('CHPH-5603',16,'Fall','2010');
INSERT INTO taught_by VALUES ('CHPH-5603',20,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-6512',16,'Fall','2010');
INSERT INTO taught_by VALUES ('CHPH-6512',20,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-6808',16,'Fall','2009');
INSERT INTO taught_by VALUES ('CHPH-6808',20,'Spring','2010');
INSERT INTO taught_by VALUES ('CIDM-3392',3,'Fall','2009');
INSERT INTO taught_by VALUES ('CIDM-3392',4,'Spring','2011');
INSERT INTO taught_by VALUES ('CIDM-3392',14,'Fall','2012');
INSERT INTO taught_by VALUES ('CIDM-3392',17,'Spring','2010');
INSERT INTO taught_by VALUES ('CIDM-5445',3,'Fall','2011');
INSERT INTO taught_by VALUES ('CIDM-5445',4,'Fall','2009');
INSERT INTO taught_by VALUES ('CIDM-5445',14,'Spring','2009');
INSERT INTO taught_by VALUES ('CIDM-5445',17,'Fall','2010');
INSERT INTO taught_by VALUES ('CIDM-6224',3,'Spring','2011');
INSERT INTO taught_by VALUES ('CIDM-6224',4,'Fall','2009');
INSERT INTO taught_by VALUES ('CIDM-6224',14,'Spring','2010');
INSERT INTO taught_by VALUES ('CIDM-6224',17,'Fall','2011');
INSERT INTO taught_by VALUES ('CIDM-6475',3,'Fall','2009');
INSERT INTO taught_by VALUES ('CIDM-6475',4,'Fall','2010');
INSERT INTO taught_by VALUES ('CIDM-6475',14,'Spring','2009');
INSERT INTO taught_by VALUES ('CIDM-6475',17,'Fall','2011');
INSERT INTO taught_by VALUES ('COMD-4981',1,'Fall','2009');
INSERT INTO taught_by VALUES ('COMD-5826',1,'Fall','2009');
INSERT INTO taught_by VALUES ('COMD-5840',1,'Fall','2009');
INSERT INTO taught_by VALUES ('COMD-5946',1,'Fall','2009');
INSERT INTO taught_by VALUES ('COMD-6214',1,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-3169',2,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-4357',2,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-5409',2,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-5783',2,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-6405',2,'Fall','2009');
INSERT INTO taught_by VALUES ('ENCS-6678',2,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-4338',7,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-4930',7,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-5917',7,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-6075',7,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-6752',7,'Fall','2009');
INSERT INTO taught_by VALUES ('Math-6757',7,'Fall','2009');
INSERT INTO taught_by VALUES ('MNGT-5514',6,'Spring','2009');
INSERT INTO taught_by VALUES ('MNGT-5514',9,'Fall','2009');
INSERT INTO taught_by VALUES ('MNGT-5514',18,'Fall','2011');
INSERT INTO taught_by VALUES ('NURS-5337',5,'Spring','2010');
INSERT INTO taught_by VALUES ('NURS-5337',10,'Spring','2009');
INSERT INTO taught_by VALUES ('NURS-5337',19,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-5823',5,'Fall','2011');
INSERT INTO taught_by VALUES ('NURS-5823',10,'Spring','2010');
INSERT INTO taught_by VALUES ('NURS-5823',19,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-5996',5,'Spring','2009');
INSERT INTO taught_by VALUES ('NURS-5996',10,'Spring','2011');
INSERT INTO taught_by VALUES ('NURS-5996',19,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-6138',5,'Spring','2009');
INSERT INTO taught_by VALUES ('NURS-6138',10,'Fall','2011');
INSERT INTO taught_by VALUES ('NURS-6138',19,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-6164',5,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-6164',10,'Fall','2011');
INSERT INTO taught_by VALUES ('NURS-6164',19,'Spring','2010');
INSERT INTO taught_by VALUES ('NURS-6739',5,'Fall','2009');
INSERT INTO taught_by VALUES ('NURS-6739',10,'Spring','2009');
INSERT INTO taught_by VALUES ('NURS-6739',19,'Fall','2010');
INSERT INTO taught_by VALUES ('NURS-6917',10,'Fall','2010');
INSERT INTO taught_by VALUES ('NURS-6917',19,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-3993',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-4631',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-4845',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-5422',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-5693',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-6694',12,'Fall','2009');
INSERT INTO taught_by VALUES ('SESC-6862',12,'Fall','2009');


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

-- END
