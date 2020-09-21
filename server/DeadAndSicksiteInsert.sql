SET SERVEROUTPUT ON;
DECLARE
  A DOCpatientDeclare.did%TYPE;
  B DOCpatientDeclare.pid%TYPE;
  C char(1);
  E int := 0;
  F int := 0;
  G DOCpatientDeclare.pid%TYPE;
  H DOCpatientDeclare.pid%TYPE;
  

BEGIN


	FOR I IN (SELECT did, pid, statusP FROM DOCpatientDeclare)LOOP
	        A := I.did;
			B := I.pid;
			C := I.statusP;
			   IF C = 'e' then
				for J in (select pid from DEADpatient@site_link WHERE pid=A) LOOP
						E := 1;
				END LOOP;
					If E = 0 then
					  DeadProc(B);
					END IF;
			   ELSIF C = 's' then
				for K in (select pid from SICKpatient@site_link WHERE pid=A) LOOP
						F := 1;
				END LOOP;
					If F = 0 then
				       SickProc(A,B);
					   END IF;
			   END IF;
			   E := 0;
			   F := 0;
		END LOOP;
	

	
END;
/
