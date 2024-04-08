CREATE DATABASE  IF NOT EXISTS `simpleuniversity`;
USE `simpleuniversity`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- Table structure for table `departments`

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  DepID int NOT NULL,
  DName text,
  Phone text,
  College text,
  professors_ProfID_Head int NOT NULL,
  PRIMARY KEY (DepID),
  UNIQUE KEY DepID_UNIQUE (DepID),
  KEY fk_departments_Heaad (professors_ProfID_Head),
  CONSTRAINT fk_departments_Heaad FOREIGN KEY (professors_ProfID_Head) REFERENCES professors (ProfID)
) ;

-- Inserting data

INSERT INTO departments VALUES (1,'Department of Accounting, Economics and Finance','449-390-4226','Paul and Virginia Engler College of Business',3);
INSERT INTO departments VALUES (2,'Department of Computer Information and Decision Management','511-719-1995','Paul and Virginia Engler College of Business',4);
INSERT INTO departments VALUES (3,'Department of Management, Marketing and General Business','574-750-7041','Paul and Virginia Engler College of Business',5);
INSERT INTO departments VALUES (4,'Department of Agricultural Sciences','743-796-8664','Paul Engler College of Agriculture and Natural Sciences',6);
INSERT INTO departments VALUES (5,'Department of Chemistry and Physics','746-977-0458','Paul Engler College of Agriculture and Natural Sciences',7);
INSERT INTO departments VALUES (6,'Department of Engineering and Computer Science','842-790-0413','College of Engineering',8);
INSERT INTO departments VALUES (7,'Department of Mathematics','804-300-9926','College of Engineering',9);
INSERT INTO departments VALUES (8,'Department of Communication Disorders','714-384-6858','College of Nursing and Health Sciences',10);
INSERT INTO departments VALUES (9,'Department of Nursing','572-209-2429','College of Nursing and Health Sciences',11);
INSERT INTO departments VALUES (10,'Department of Sports and Exercise Sciences','571-148-3323','College of Nursing and Health Sciences',12);



/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- EnD
