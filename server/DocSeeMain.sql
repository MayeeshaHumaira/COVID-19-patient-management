SET SERVEROUTPUT ON;
DECLARE
	A PATIENT.pid%TYPE := &pid;
	B PATIENT.pid%TYPE;
	C char(1);
	D int := 0;
	doc DOCTOR.did%TYPE := 0;
	
	error_negative EXCEPTION;

BEGIN

    IF A < 0 THEN
		raise error_negative;
	END IF;

	D := TestResult(A);
	DBMS_OUTPUT.PUT_LINE(A||' '||D);
	IF D = 1 THEN 
		doc := FreeDoctor(A);
		DBMS_OUTPUT.PUT_LINE(doc);
	ELSIF D = 0 THEN
		DBMS_OUTPUT.PUT_LINE('You do not have COVID-19 take rest at home');
	END IF;
	
	EXCEPTION 
		WHEN error_negative THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Patient ID');

	
END;
/