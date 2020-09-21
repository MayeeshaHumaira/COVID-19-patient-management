drop table TEST;
drop table DEADpatient;
drop table SICKpatient;
drop table RECOVERpatient;
drop sequence tid;

CREATE TABLE TEST (
	tid int not null, 
	pid int, 
	t_state char(1), 
	PRIMARY KEY(tid)
	);
	
CREATE SEQUENCE tid MINVALUE 1 START WITH 800 CACHE 10;
	
	
CREATE TABLE DEADpatient (
	pid int,
	pname varchar2(30),
	paddress varchar2(30),
	phone varchar2(11)
);


CREATE TABLE RECOVERpatient (
	pid int,
	pname varchar2(30),
	paddress varchar2(30),
	phone varchar2(11),
	gender varchar2(30),
	age int,
	bloodGroup char(5)
);

CREATE TABLE SICKpatient (
	pid int,
	pname varchar2(30),
	paddress varchar2(30),
	phone varchar2(11),
	gender varchar2(30),
	age int,
	bloodGroup char(5),
	did int
);
commit;