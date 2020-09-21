
drop table DOCpatient;
drop table PATIENT;
drop table DOCTOR;
drop sequence pid;
drop sequence did;


CREATE TABLE PATIENT (
	pid int not null, 
	pname varchar2(30), 
	paddress varchar2(30),
	phone varchar2(11),
	gender varchar2(6),
	age int,
	blood char(5),
    PRIMARY KEY(pid)
	); 
	
CREATE SEQUENCE pid MINVALUE 1 START WITH 1 CACHE 10;



CREATE TABLE DOCTOR(
	did int not null, 
	Dname varchar2(30), 
	DOCcapacity int,
	PRIMARY KEY(did)
);

CREATE SEQUENCE did MINVALUE 1 START WITH 500 CACHE 10;
	
	
CREATE TABLE DOCpatient(
	did int,
	pid int,
	FOREIGN KEY(did) REFERENCES DOCTOR(did),
	FOREIGN KEY(pid) REFERENCES PATIENT(pid)
);

CREATE TABLE DOCpatientDeclare(
	did int,
	pid int,
	statusP varchar2(30),
	FOREIGN KEY(did) REFERENCES DOCTOR(did),
	FOREIGN KEY(pid) REFERENCES PATIENT(pid)
);

commit;