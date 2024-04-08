CREATE DATABASE  IF NOT EXISTS `simpleuniversity`;
USE `simpleuniversity`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- Table structure for table `professors`

DROP TABLE IF EXISTS professors;

CREATE TABLE professors (
  ProfID int NOT NULL,
  Profname text,
  email text,
  departments_DepID_affeliation int DEFAULT NULL,
  PRIMARY KEY (ProfID),
  KEY fk_professors_departments (departments_DepID_affeliation),
  CONSTRAINT fk_professors_departments FOREIGN KEY (departments_DepID_affeliation) REFERENCES departments (DepID)
);

-- Inserting data
 
 
INSERT INTO professors VALUES (1,'Lyndell Coche','lcoche0@whitehouse.gov',8);
INSERT INTO professors VALUES (2,'Rakel Matasov','rmatasov1@flickr.com',6);
INSERT INTO professors VALUES (3,'Cassy Weatherhead','cweatherhead2@lycos.com',2);
INSERT INTO professors VALUES (4,'Brita Mepham','bmepham3@shutterfly.com',2);
INSERT INTO professors VALUES (5,'Mellie Gerson','mgerson4@usnews.com',9);
INSERT INTO professors VALUES (6,'Luis Beavon','lbeavon5@freewebs.com',3);
INSERT INTO professors VALUES (7,'Vladimir Loeber','vloeber6@multiply.com',7);
INSERT INTO professors VALUES (8,'Roby Cradduck','rcradduck7@columbia.edu',4);
INSERT INTO professors VALUES (9,'Ernaline Hestrop','ehestrop8@printfriendly.com',3);
INSERT INTO professors VALUES (10,'Beniamino Haitlie','bhaitlie9@so-net.ne.jp',9);
INSERT INTO professors VALUES (11,'Lorette Loudian','lloudiana@ow.ly',1);
INSERT INTO professors VALUES (12,'Jard Layman','jlaymanb@youtube.com',10);
INSERT INTO professors VALUES (13,'Hannie Sindall','hsindallc@networkadvertising.org',1);
INSERT INTO professors VALUES (14,'Philip St. Queintain','pstd@free.fr',2);
INSERT INTO professors VALUES (15,'Tabbitha Whiterod','twhiterode@moonfruit.com',4);
INSERT INTO professors VALUES (16,'Rees Byer','rbyerf@amazon.com',5);
INSERT INTO professors VALUES (17,'Sib Shillum','sshillumg@cdbaby.com',2);
INSERT INTO professors VALUES (18,'Jessie Mulryan','jmulryanh@webmd.com',3);
INSERT INTO professors VALUES (19,'Fan Wallenger','fwallengeri@plala.or.jp',9);
INSERT INTO professors VALUES (20,'Bar Jansson','bjanssonj@macromedia.com',5);



/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- END
