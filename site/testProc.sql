SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE testProcedure(A IN TEST.pid%TYPE, B IN TEST.t_state%TYPE)
	IS
	
	
begin
	
	insert into TEST (tid, pid, t_state) values (tid.nextval, A, B);
	commit;
	DBMS_OUTPUT.PUT_LINE('-----One test Done-----');
	
end testProcedure;
/


SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE testUpdateProc(A IN TEST.pid%TYPE, B IN TEST.t_state%TYPE)
	IS
	
	
begin
	
	update TEST set  t_state= B where pid = A;
	commit;
	DBMS_OUTPUT.PUT_LINE('-----New Result-----');
	
end testUpdateProc;
/


