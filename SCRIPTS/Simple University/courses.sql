CREATE DATABASE  IF NOT EXISTS `simpleuniversity`;
USE `simpleuniversity`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- Table structure for table `courses`

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
  CourseID varchar(9) NOT NULL,
  Cname text,
  Descr text,
  departments_DepID int NOT NULL,
  PRIMARY KEY (CourseID),
  KEY fk_courses_departments (departments_DepID),
  CONSTRAINT fk_courses_departments FOREIGN KEY (departments_DepID) REFERENCES departments (DepID)
) ;


--  Inserting data

INSERT INTO courses VALUES ('ACCT-5038','Cross-platform asymmetric structure','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',1);
INSERT INTO courses VALUES ('ACCT-6257','Focused client-driven middleware','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',1);
INSERT INTO courses VALUES ('ACCT-6803','Enhanced user-facing toolset','Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',1);
INSERT INTO courses VALUES ('AGSC-4199','Horizontal foreground local area network','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',4);
INSERT INTO courses VALUES ('AGSC-6111','Grass-roots bottom-line encryption','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',4);
INSERT INTO courses VALUES ('AGSC-6435','Stand-alone zero defect parallelism','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',4);
INSERT INTO courses VALUES ('AGSC-6706','Re-engineered optimal infrastructure','Sed ante. Vivamus tortor. Duis mattis egestas metus.',4);
INSERT INTO courses VALUES ('AGSC-6744','Enhanced background toolset','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',4);
INSERT INTO courses VALUES ('CHPH-3229','Realigned empowering monitoring','In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',5);
INSERT INTO courses VALUES ('CHPH-4247','Inverse context-sensitive hub','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',5);
INSERT INTO courses VALUES ('CHPH-5108','Polarised reciprocal capability','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',5);
INSERT INTO courses VALUES ('CHPH-5603','Ergonomic scalable open architecture','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',5);
INSERT INTO courses VALUES ('CHPH-6512','Right-sized bandwidth-monitored solution','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',5);
INSERT INTO courses VALUES ('CHPH-6808','Synergized 24/7 knowledge base','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',5);
INSERT INTO courses VALUES ('CIDM-3392','Synergistic full-range service-desk','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',2);
INSERT INTO courses VALUES ('CIDM-5445','Implemented local implementation','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',2);
INSERT INTO courses VALUES ('CIDM-6224','Automated impactful knowledge base','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',2);
INSERT INTO courses VALUES ('CIDM-6475','Right-sized disintermediate groupware','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',2);
INSERT INTO courses VALUES ('COMD-4981','Upgradable optimizing collaboration','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',8);
INSERT INTO courses VALUES ('COMD-5826','Distributed empowering algorithm','Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.',8);
INSERT INTO courses VALUES ('COMD-5840','Re-contextualized mobile collaboration','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',8);
INSERT INTO courses VALUES ('COMD-5946','Compatible attitude-oriented algorithm','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',8);
INSERT INTO courses VALUES ('COMD-6214','Synchronised mobile open system','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',8);
INSERT INTO courses VALUES ('ENCS-3169','Secured real-time encryption','Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',6);
INSERT INTO courses VALUES ('ENCS-4357','Customer-focused heuristic matrices','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',6);
INSERT INTO courses VALUES ('ENCS-5409','Enhanced scalable matrix','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',6);
INSERT INTO courses VALUES ('ENCS-5783','Open-architected optimal success','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',6);
INSERT INTO courses VALUES ('ENCS-6405','Reduced contextually-based customer loyalty','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',6);
INSERT INTO courses VALUES ('ENCS-6678','Re-contextualized empowering intranet','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',6);
INSERT INTO courses VALUES ('Math-4338','Devolved context-sensitive framework','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',7);
INSERT INTO courses VALUES ('Math-4930','Self-enabling 24/7 encryption','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',7);
INSERT INTO courses VALUES ('Math-5917','Programmable homogeneous approach','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',7);
INSERT INTO courses VALUES ('Math-6075','Synergistic contextually-based encryption','Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',7);
INSERT INTO courses VALUES ('Math-6752','Cloned directional complexity','Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',7);
INSERT INTO courses VALUES ('Math-6757','Ergonomic cohesive open architecture','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',7);
INSERT INTO courses VALUES ('MNGT-5514','Total full-range model','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',3);
INSERT INTO courses VALUES ('NURS-5337','User-centric bottom-line capability','In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',9);
INSERT INTO courses VALUES ('NURS-5823','Open-source high-level leverage','Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',9);
INSERT INTO courses VALUES ('NURS-5996','Inverse user-facing parallelism','Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',9);
INSERT INTO courses VALUES ('NURS-6138','Grass-roots intangible support','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',9);
INSERT INTO courses VALUES ('NURS-6164','Fully-configurable object-oriented function','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',9);
INSERT INTO courses VALUES ('NURS-6739','Universal disintermediate access','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',9);
INSERT INTO courses VALUES ('NURS-6917','Extended bi-directional extranet','Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',9);
INSERT INTO courses VALUES ('SESC-3993','Object-based bandwidth-monitored workforce','Sed ante. Vivamus tortor. Duis mattis egestas metus.',10);
INSERT INTO courses VALUES ('SESC-4631','Public-key tangible utilisation','Phasellus in felis. Donec semper sapien a libero. Nam dui.',10);
INSERT INTO courses VALUES ('SESC-4845','Grass-roots attitude-oriented emulation','Phasellus in felis. Donec semper sapien a libero. Nam dui.',10);
INSERT INTO courses VALUES ('SESC-5422','Switchable clear-thinking challenge','Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.',10);
INSERT INTO courses VALUES ('SESC-5693','Universal dynamic analyzer','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',10);
INSERT INTO courses VALUES ('SESC-6694','Ameliorated context-sensitive database','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',10);
INSERT INTO courses VALUES ('SESC-6862','Implemented exuding flexibility','Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',10);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- End