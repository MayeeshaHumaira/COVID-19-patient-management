# COVID-19-patient-management
This is my 4th year 1st semester's project using PL/SQL of Oracle. In this project there were two sites one using my PC and another was created using VMware. the name site_link wae given to the VMware site. Following are the tasks that were implemented in this project:
1) At Host(PC)-
    i) patient can tate appoinment after which they are ask to give test sample at site_link for COVID test.
    ii) After the test patient can take doctos appoinment it test result is positive. Patients can only take appoinment is a any doctor is free.
    iii) Doctors can declare his or her assignent patient as still SICK, Recovered or Expired.
    iV) List of these Sick, Recovered or Expired pataients were then transfered to site_link.
    V) In HOST procedure, function, trigger, exception cursor, conditional statements were utilized.
    
2) At site_link-
    i) Test results of patients were inserted.
    ii) if patient id already in TEST table then only updates test result
    ii) Display list of Recovered patient and their blood type to sick patients looking for plasma
    iii) Display number of expired people district wise
    iV) In site_link procedure, view, trigger, exception, cursor, conditional statement were used
