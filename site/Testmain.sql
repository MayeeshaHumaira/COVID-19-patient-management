SET SERVEROUTPUT ON;
DECLARE
	A TEST.pid%TYPE := &pid;
	B TEST.t_state%TYPE := &TestResult;
	C TEST.pid%TYPE;
	D TEST.pid%TYPE := 0;
	error_negative EXCEPTION;
	result_error EXCEPTION;

BEGIN

	IF A < 0 THEN
		raise error_negative;
	END IF;
	
	IF B != 'n' or B != 'p' THEN
		raise result_error;
		end If;

	FOR I IN (SELECT pid FROM TEST)LOOP
			C := I.pid;
			IF C = A THEN
			   D := 1;
			   exit;
			END IF;
		END LOOP;
	
	IF D=0 THEN
		testProcedure(A, B);
	ELSIF D=1 THEN
		testUpdateProc(A, B);
	END IF;
	
	EXCEPTION 
		WHEN error_negative THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Patient ID');
		
		WHEN result_error THEN
			DBMS_OUTPUT.PUT_LINE('Invalid Result Input');

		
	
END;
/