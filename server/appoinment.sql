SET SERVEROUTPUT ON;
DECLARE
	A PATIENT.pname%TYPE := &Name;
	B PATIENT.paddress%TYPE := &address;
	C PATIENT.phone%TYPE := &phone;
	D PATIENT.gender%TYPE := &gender;
	E PATIENT.age%TYPE := &age;
	F PATIENT.blood%TYPE := &bloodGroup;

BEGIN
	NewPatient(A, B, C, D, E, F);
	commit;
END;
/

