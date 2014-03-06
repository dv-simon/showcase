CREATE SCHEMA `showcase` DEFAULT CHARACTER SET utf8 ;

/*
 * Drop Table
 */
drop table app_user;
drop table APP_ROLE;
drop table APP_USER_ROLE;

/*
 * User Table 
 */
CREATE TABLE `showcase`.`app_user` (
  `USERID` VARCHAR(100) NOT NULL,
  `LOGINNAME` VARCHAR(100) NOT NULL,
  `NAME` VARCHAR(100) NULL,
  `PASSWORD` VARCHAR(255) NOT NULL,
  `SALT` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(100) NULL,
  `PHONE` VARCHAR(100) NULL,
  `OFFICE` VARCHAR(100) NULL,
  `DEPT` VARCHAR(100) NULL,
  `LANGUAGE` VARCHAR(20) NULL,
  `STATUS` VARCHAR(20) NOT NULL,
  `REMARK` VARCHAR(400) NULL,
  PRIMARY KEY (`USERID`),
  UNIQUE INDEX `LOGINNAME_UNIQUE` (`LOGINNAME` ASC),
  INDEX `IDX1_APP_USER` (`LOGINNAME` ASC, `STATUS` ASC));

CREATE TABLE `showcase`.`app_role` 
   (`ROLEID` VARCHAR(20) NOT NULL, 
	`NAME` VARCHAR(255) NOT NULL, 
	`PERMISSIONS` VARCHAR(1000), 
	`STATUS` VARCHAR(20), 
	`REMARK` VARCHAR(400), 
	 PRIMARY KEY (`ROLEID`)
   );
   
CREATE TABLE `showcase`.`APP_USER_ROLE` 
   (`USERID` VARCHAR(20) NOT NULL, 
	`ROLEID` VARCHAR(20) NOT NULL, 
	 CONSTRAINT `APP_USER_ROLE_PK` PRIMARY KEY (`USERID`, `ROLEID`)
   );

/*
*Sample Data
*/
TRUNCATE `showcase`.`app_user`;
TRUNCATE `showcase`.`app_role`;
TRUNCATE `showcase`.`app_user_role`;


insert into app_user (userId,loginname, name, email, password, salt, phone, office, dept, language, status, remark) values('U1001','ceditor','Messi','admin@spring.org','70b2e3b7a573e9010daaf72c861689cc5f2bd80f','41d005939da010b5','28888888','LHK11','CHB7','en_US','active','');
insert into app_user (userId,loginname, name, email, password, salt, phone, office, dept, language, status, remark) values('U1002','neditor','Rain','user@spring.org','70b2e3b7a573e9010daaf72c861689cc5f2bd80f','41d005939da010b5','28888887','LHK12','CHB7','en_US','active','');
insert into app_user (userId,loginname, name, email, password, salt, phone, office, dept, language, status, remark) values('U1003','ieditor','Backham','jack@spring.org','70b2e3b7a573e9010daaf72c861689cc5f2bd80f','41d005939da010b5','28888886','LHK11','CHB7','en_US','active','');
insert into app_user (userId,loginname, name, email, password, salt, phone, office, dept, language, status, remark) values('U1004','meditor','Kitty','kate@spring.org','70b2e3b7a573e9010daaf72c861689cc5f2bd80f','41d005939da010b5','28888885','LHK12','CHB7','en_US','active','');


insert into app_role (roleid, name, permissions,status,remark) values('R1001','Super Editor','news:create,news:update,news:delete','active','');
insert into app_role (roleid, name, permissions,status,remark) values('R1002','NewsContent Editor','news:create','active','');
insert into app_role (roleid, name, permissions,status,remark) values('R1003','NewsImage Editor','news:create','active','');
insert into app_role (roleid, name, permissions,status,remark) values('R1004','MusicProduct Editor','news:create','active','');


insert into app_user_role (userid, roleid) values('U1001','R1001');
insert into app_user_role (userid, roleid) values('U1002','R1002');
insert into app_user_role (userid, roleid) values('U1003','R1003');
insert into app_user_role (userid, roleid) values('U1004','R1004');