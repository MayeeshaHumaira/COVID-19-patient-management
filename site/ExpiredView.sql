create or replace view myview(Address, num_of_Dead_Patients) as
select paddress, count(pid) 
from DEADpatient
group by paddress;

select * from myview;

commit;