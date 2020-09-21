create or replace trigger Patient_trigger_log
after insert
on PATIENT
for each row

begin
	dbms_output.put_line('Patient Details inserted');
	insert into Serverlog_insert
	values(:new.pid, sysdate);
end;
/
commit;

create or replace trigger PatientDoctor_trigger_log
after insert
on DOCpatient
for each row

begin
	dbms_output.put_line('-----Patient assigned to Doctor----');
	insert into ServerDocPlog_insert
	values(:new.did,:new.pid, sysdate);
end;
/
commit;

create or replace trigger PatientDoctorUP_trigger_log
after update
on DOCTOR
for each row

begin
	dbms_output.put_line('-----Doctor capacity updated----');
	insert into ServerDoclog_up
	values(:old.DOCcapacity, :new.DOCcapacity, sysdate);
end;
/
commit;