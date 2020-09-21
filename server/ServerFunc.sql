create or replace function TestResult(A in PATIENT.pid%TYPE)
  return int
  is
  
  B PATIENT.pid%TYPE;
  C char(1);
  D int := 0;
  E int := 0;
  NotF int := 0;
  test_result_notFound EXCEPTION;

begin

	FOR I IN (SELECT pid, t_state FROM TEST@site_link)LOOP
			B := I.pid;
			C := I.t_state;
			IF B = A THEN
			   NotF := 1;
			   IF C = 'p' then
				  D:=1;
			      DBMS_OUTPUT.PUT_LINE(B||' '||C||' '||D);
			    ELSIF C = 'n' THEN
					D:=0;
					DBMS_OUTPUT.PUT_LINE(B||' '||C||' '||D);
				END IF;
			   exit;
			END IF;
		END LOOP;
		
		IF NotF = 0 THEN
			raise test_result_notFound;
		Else 
		 return D;
		END IF;
		
		EXCEPTION
			WHEN test_result_notFound THEN
				DBMS_OUTPUT.PUT_LINE('Please complete COVIT-19 test Before visiting a DOCTOR');

end TestResult;
/


create or replace function FreeDoctor(pnum in PATIENT.pid%TYPE)
  return DOCTOR.did%TYPE
  is
  
  docnum DOCTOR.did%TYPE;
  free int := 0;
  no_free_Doctor EXCEPTION;
  cap DOCTOR.DOCcapacity%TYPE := 0;

begin

	FOR I IN (SELECT did, DOCcapacity FROM DOCTOR where DOCcapacity > 0)LOOP
			docnum := I.did;
			cap := I.DOCcapacity;
			free := 1;
			cap := cap - 1;
			DBMS_OUTPUT.PUT_LINE('found');
			assignDocProc(docnum, pnum);
			update DOCTOR set  DOCcapacity = cap where did = docnum;
	        commit;
			return docnum;
			   exit;
		END LOOP;
		
		IF free = 0 THEN
			raise no_free_Doctor;
		END IF;
		
	EXCEPTION
		WHEN no_free_Doctor THEN
			DBMS_OUTPUT.PUT_LINE('No free bed for Patient Look in another HOSPITAL');
		

end FreeDoctor;
/