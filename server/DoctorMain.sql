SET SERVEROUTPUT ON;
DECLARE
	docN  DOCpatientDeclare.did%TYPE := &did;
	patnum  DOCpatientDeclare.pid%TYPE :=&pid;
	s  DOCpatientDeclare.statusP%TYPE :=&status;
	

BEGIN


	insert into  DOCpatientDeclare (did, pid, statusP) values (docN, patnum, s);
	

	
END;
/