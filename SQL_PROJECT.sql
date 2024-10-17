CREATE DATABASE CHINAL_PROJECT;

USE CHINAL_PROJECT;

-- Q1)EXTRACT ALL THE INFORMATION OF APPOINTMENT SCHEDULING DATA? -- 
select * from appointment_data;
--  This query will print all the data in a table format. --

-- Q2)EXTRACT THE INFORMATION OF TOTAL NO OF CLIENTS IN WHOLE YEAR?--
SELECT COUNT(CLIENT_ID) FROM appointment_data; 
-- This query  provides counting of total number patients that have visited in the whole year. --

-- Q3)EXTRACT THE INFORMATION OF THOSE PATIENTS WHO CAME MORE THAN 5 TIMES IN A WHOLE YEAR? --
select count(*) as visited from appointment_data GROUP BY CLIENT_ID having CLIENT_ID > 5;
-- This query provides information of those patients who visited more than five times and howm many times patients has visited. --

-- Q4)EXTRACT THE ID OF THOSE PATIENTS WHOSE PROVIDER ROLE IS PSYCHOLOGIST?--
select CLIENT_ID from appointment_data where PROVIDER_ROLE = 'Psychologist';
-- This query provides information of those patients who are under supervision of a psychologist. -- 

-- Q5)EXTRACT THE ID AND NAME OF THOSE PATIENTS WHOSE NAME STARTS WITH S AND THEY CAME IN THE NOVEMBER MONTH?--
select CLIENT_ID, concat(FIRST_NAME,' ',LAST_NAME) as name from appointment_data where FIRST_NAME LIKE 'S%' AND MONTH(APPOINTMENT_DATE) = 11;
-- This query provides the information of patients whose name starting charachter is S and they had appointment in november month. --

-- Q6)EXTRACT THE TIMING , DAY NAME AND FULL NAME OF THOSE PATIENTS WHO ARE COMING ON 11/03/2023?--
select concat(FIRST_NAME,' ',LAST_NAME) as name, DAY_NAME from appointment_data where APPOINTMENT_DATE = '11-03-2023';
-- This query provides information of patients who visited on this specific date (11-03-2023) and their appointment timing. --

-- Q7)EXTRACT THE NAME AND ID OF THOSE PATIENTS WHO TIMING IS IN EVENING? 
select CONCAT(FIRST_NAME,' ',LAST_NAME) as FULLNAME,CLIENT_ID,APPOINTMENT_TIME FROM appointment_data where APPOINTMENT_TIME BETWEEN '17:00:00'AND '21:00:00';
-- This query provides information of patients whose appointment timing is between 5:00PM to 9:00PM. --

-- Q8)EXTRACT TOTAL NUMBER OF PATIENTS ON SUNDAY ,MONDAY AND THRUSDAY?
select DAY_NAME,COUNT(FIRST_NAME) as total_patients FROM appointment_data where DAY_NAME IN('SUNDAY','MONDAY','THRUSDAY') group by DAY_NAME;
-- This query provides information about patients who came on these 3 week days only that is sunday , monday and thursday.I t coounts how many patiants visited --

-- Q9)EXTRACT THE INFORMATION OF THOSE PATIENTS WHOSE WAITING TIME WAS LESS THAN 10 DAYS?
select * from appointment_data where WAITING_TIME < 10;
-- This query provides information of patients who appointment requesting time was less than ten days. --

-- Q10)HOW MANY APPOINTMENTS WERE SCHEDULED BY EACH PROVIDER ROLE?
select COUNT(*) as no_of_patients,PROVIDER_ROLE FROM appointment_data group by PROVIDER_ROLE;
-- This query provides number of patients who are under each provider role. --

-- Q11)HOW MANY PATIENTS HAVE APPOINTMENTS SCHEDULED ON A SPECIFIC DAY?
select COUNT(APPOINTMENT_DATE) AS SCHEDULED_APPOINTMENT,DAY_NAME FROM appointment_data group by DAY_NAME;
-- This query provides information that in a week according to individual day how many appointments are scheduled. --

-- Q12)WHICH PATIENTS HAS THE LONGEST WAITING TIME BETWEEN REQUESTING AND THEIR APPOINTMENT?
select (APPOINTMENT_DATE - REQUESTING_DATE) AS WAITING_TIME FROM appointment_data;
-- This query provides information of patients who got appointment whitout waiting too much for appointment. --

-- Q13)HOW MANY APPOINTMENTS ARE SCHEDULED FOR EACH PROVIDER ON A SPECIFIC DATE?
select COUNT(PROVIDER_ROLE) AS SCHEDULED_APPOINTMENT,APPOINTMENT_DATE FROM appointment_data GROUP BY APPOINTMENT_DATE;
-- This query provides information by counting the each provider role has appointments on diffrent dates.--

-- Q14)WHAT IS THE TOTAL NUMBER OF UNIQUE PATIENTS IN THE DATASET?
select COUNT(DISTINCT(FIRST_NAME)) AS UNIQUE_PATIENTS FROM appointment_data;
-- This query provides information of UNIQUE patients. --

-- Q15)WHAT IS THE AVERAGE WAITING TIME FOR EACH PROVIDER ROLE?
select * FROM appointment_data where PROVIDER_ROLE = (SELECT AVG(WAITING_TIME) FROM appointment_data);
-- This query provides information of average waiting time to get an appointment. --

-- Q16)WHICH PATIENTS HAVE APPOINTMENTS SCHEDULED IN THE SAME TIME SLOT ON A PERTICULAR DAY?
select * from appointment_data where APPOINTMENT_TIME = DAY_NAME;
-- This query provides information of patients with same appointment time and same day.--

-- Q17)WHAT IS THE EARLIEST AND LATEST APPOINTMENT TIME FOR EACH DAY OF THE WEEK?
SELECT MIN(APPOINTMENT_TIME) AS EARLIEST,MAX(APPOINTMENT_TIME) AS LATEST FROM appointment_data;
-- This query provides information of minimum and maximum appointment time for every day of week. --


