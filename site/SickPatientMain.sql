SET SERVEROUTPUT ON;
DECLARE
  A SICKpatient.pid%TYPE := &pid;
  D int := 0;
  e RECOVERpatient.pid%TYPE;
  f RECOVERpatient.pname%TYPE;
  g RECOVERpatient.phone%TYPE;
  h RECOVERpatient.paddress%TYPE;
  l RECOVERpatient.gender%TYPE;
  j RECOVERpatient.age%TYPE;
  k RECOVERpatient.bloodGroup%TYPE;
  invalid_access EXCEPTION;
  error_negative EXCEPTION;

BEGIN

	FOR I IN (SELECT pid FROM SICKpatient where pid=A)LOOP
			D := 1;
		END LOOP;
		
	IF D = 1 THEN 
		DBMS_OUTPUT.PUT_LINE('pid-----name-------address--phone--gender--blood');
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
	for I in (select pid, pname, phone, paddress, gender, age, bloodGroup from RECOVERpatient) LOOP
	e := I.pid;
	f := I.pname;
	g := I.phone;
	h := I.paddress;
	l := I.gender;
	j := I.age;
	k := I.bloodGroup;
	DBMS_OUTPUT.PUT_LINE(e||'|'||f||'|'||g||'|'||h||'|'||l||'|'||j||'|'||k);
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
	
	END LOOP;
		
	ELSIF D = 0 then
		DBMS_OUTPUT.PUT_LINE('DO not have access to view');
	END IF;
		
		
	

	
END;
/