SET SERVEROUTPUT ON;
DECLARE
  B PATIENT.pid%TYPE;
  C char(1);
  D int := 0;
  E int := 0;
  

BEGIN


	FOR I IN (SELECT pid, t_state FROM TEST@site_link)LOOP
			B := I.pid;
			C := I.t_state;
			   IF C = 'n' then
					for J in (select pid from RECOVERpatient@site_link WHERE pid=B) LOOP
						E := 1;
				    END LOOP;
					If E = 0 then
					  D:=1;
			          RecProc(B);
					END IF;
				END IF;
				E := 0;
		END LOOP;
	

	
END;
/