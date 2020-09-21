create table Serverlog_insert
(pidnew int, log_date date);
commit;


create table ServerDocPlog_insert
(doctor int, patient int, log_date date);
commit;


create table ServerDoclog_up
(Capold int, Capnew int, log_date date);
commit;