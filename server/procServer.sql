SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE NewPatient(A IN PATIENT.pname%TYPE, B IN PATIENT.paddress%TYPE, C IN PATIENT.phone%TYPE, D IN PATIENT.gender%TYPE,
 E IN PATIENT.age%TYPE, F IN PATIENT.blood%TYPE)
	IS
	
	
begin
	
	insert into PATIENT (pid, pname, paddress, phone, gender, age, blood) values (pid.nextval, A, B, C, D, E, F);
	commit;
	DBMS_OUTPUT.PUT_LINE('-----Entry Successful Give sample for COVID testing and wait for results-----');
	
end NewPatient;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE assignDocProc(doc IN DOCTOR.did%TYPE, p IN PATIENT.pid%TYPE)
	IS
	
	
begin

	insert into DOCpatient (did, pid) values (doc, p);
	commit;
	DBMS_OUTPUT.PUT_LINE('-----DOC Assigned-----');
	
end assignDocProc;
/



SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE RecProc(X IN PATIENT.pid%TYPE)
	IS
	a PATIENT.pname%TYPE;
	b PATIENT.paddress%TYPE;
	c PATIENT.phone%TYPE;
	d PATIENT.gender%TYPE;
	e PATIENT.age%TYPE;
	f PATIENT.blood%TYPE;
	
	
begin

	for I in (select pname, paddress, phone, gender, age, blood from PATIENT where pid = X) LOOP
	a := I.pname;
	b := I.paddress;
	c := I.phone;
	d := I.gender;
	e := I.age;
	f := I.blood;
	
	END LOOP;
	insert into RECOVERpatient@site_link (pid, pname, paddress, phone, gender, age, bloodGroup) values (X, a, b, c, d, e, f);
	commit;
	
end RecProc;
/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE DeadProc(X IN PATIENT.pid%TYPE)
	IS
	g PATIENT.pname%TYPE;
	h PATIENT.paddress%TYPE;
	p PATIENT.phone%TYPE;
	
begin

	for I in (select pname, paddress, phone from PATIENT where pid = X) LOOP
	g := I.pname;
	h := I.paddress;
	p := I.phone;
	END LOOP;
	insert into DEADpatient@site_link (pid, pname, paddress, phone) values (X, g, h, p);
	commit;
	
end DeadProc;
/



SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE SickProc(Y IN DOCTOR.did%TYPE, X IN PATIENT.pid%TYPE)
	IS
	m PATIENT.pname%TYPE;
	n PATIENT.paddress%TYPE;
	o PATIENT.phone%TYPE;
	q PATIENT.gender%TYPE;
	r PATIENT.age%TYPE;
	s PATIENT.blood%TYPE;
	
	
begin

	for I in (select pname, paddress, phone, gender, age, blood from PATIENT where pid = X) LOOP
	m := I.pname;
	n := I.paddress;
	o := I.phone;
	q := I.gender;
	r := I.age;
	s := I.blood;
	
	END LOOP;
	insert into SICKpatient@site_link (pid, pname, paddress, phone, gender, age, bloodGroup, did) values (X, m, n, o, q, r, s, Y);
	commit;
	
end SickProc;
/





