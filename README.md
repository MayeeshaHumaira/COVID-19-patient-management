# COVID-19-patient-management
This is my 4th year 1st semester's project using PL/SQL of Oracle. In this project, there were two sites one using my PC(server) and another was created using VMware. the name site_link was given to the VMware site. Following are the tasks that were implemented in this project:

At Host(PC): 
   - patients can take an appointment after which they are asked to give a test sample at site_link for COVID test. 
   - After the test patient can take a doctor's appointment if the test result is positive. Patients can only take appointments if any doctor is free. 
   - Doctors can declare or her assignment patient as still SICK, Recovered, or Expired. 
   - List of these Sick, Recovered, or Expired patients were then transferred to site_link. 
   - In the HOST procedure, function, trigger, exception cursor, conditional statements were utilized.

At site_link: 
   - Test results of patients were inserted. 
   - if the patient is already in TEST table then only updates test result 
   - Display list of Recovered patient and their blood type to sick patients looking for plasma 
   - Display number of expired people district wise iV) In site_link procedure, view, trigger, exception, cursor, conditional statement were used
