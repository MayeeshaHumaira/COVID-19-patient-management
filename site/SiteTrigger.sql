create or replace trigger Test_trigger_log
after insert
on TEST
for each row

begin
	dbms_output.put_line('----Patient sample COVID testing done----');
	insert into Sitelog_insert
	values(:new.pid, sysdate);
end;
/
commit;

create or replace trigger TestUP_trigger_log
after update
on TEST
for each row

begin
	dbms_output.put_line('---Patient did COVID TEST again----');
	insert into Sitelog_updateT
	values(:new.pid, sysdate);
end;
/
commit;