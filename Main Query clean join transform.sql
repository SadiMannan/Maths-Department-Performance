use WaMaths2026;

select * from [2025-2026 Year 7 Maths Tracker - Summary];

select * from [2025-2026 Year 8 Maths Tracker - Summary];

select * from [2025-2026 Year 9 Maths Tracker - Summary];

select * from [2025-2026 Year 10 Maths Tracker - Summary];

ALTER TABLE [2025-2026 Year 8 Maths Tracker - Summary] RENAME COLUMN set to currentClass;



select 
Arbor_Student_ID,
First_Name,
Last_Name,
Sex,
SEN_status,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
Current_class,
TeacherID,
AT1 as AT1,
AT2 as AT2,
AT3 as AT3
from [2025-2026 Year 7 Maths Tracker - Summary];

select 
Arbor_Student_ID,
First_Name,
Last_Name,
Sex,
SEN_status,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
currentClass,
TeacherID,
AT1_1,
AT2_1,
AT3_1
from [2025-2026 Year 8 Maths Tracker - Summary];

select
Arbor_Student_ID,
First_Name,
Last_Name,
Sex,
SEN_status,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
SET2,
TeacherID,
AT1,
AT2,
AT3
from [2025-2026 Year 9 Maths Tracker - Summary];


select
Arbor_Student_ID,
First_Name,
Last_Name,
Sex,
SEN_status,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
currentClass,
column26,
AT1_Data_drop,
AT2,
AT3
from [2025-2026 Year 10 Maths Tracker - Summary];

create table sales.CTAS_Customer_Sales as

--Union of all year groups


select 
Arbor_Student_ID ArborID,
First_Name firstName,
Last_Name lastName,
Sex,
SEN_status senStatus,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
Current_class currentClass,
TeacherID,
AT1 as AT1,
AT2 as AT2,
AT3 as AT3
into DBO.MathsWA2026
from [2025-2026 Year 7 Maths Tracker - Summary]
union
select 
Arbor_Student_ID ArborID,
First_Name firstName,
Last_Name lastName,
Sex,
SEN_status senStatus,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
currentClass,
TeacherID,
AT1_1 AT1,
AT2_1 AT2,
AT3_1 AT3
from [2025-2026 Year 8 Maths Tracker - Summary]
union
select
Arbor_Student_ID ArborID,
First_Name firstName,
Last_Name lastName,
Sex,
SEN_status senStatus,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
SET2 as currentClass,
TeacherID,
AT1,
AT2,
AT3
from [2025-2026 Year 9 Maths Tracker - Summary]
union
select
Arbor_Student_ID arborID,
First_Name firstName,
Last_Name lastName,
Sex,
SEN_status senStatus,
Disadvantaged_at_any_time_on_19_Nov_2023 as Disadvantaged,
Pupil_Premium_Eligible_at_any_time_on_19_Nov_2023 as PP,
currentClass,
column26 teacherID,
AT1_Data_drop as AT1,
AT2,
AT3
from [2025-2026 Year 10 Maths Tracker - Summary];

select * from teachers;



select m.*, t.firtsName TeacherfirstName, t.lastName teacherLastName
into dbo.maths26
from dbo.MathsWA2026 m
join teachers t on t.TeacherID = m.TeacherID;

select * from maths26;

select FirstName, LastName,  
case
	when gender='M' then 'Male'
	when gender='F' then 'Female'
end full_gender
from sales.Employees;

select first_name, substring(first_name, 3,3), substring(first_name,2,2) from customers;


select 
*,
case
	when substring(currentClass,1,1)='1' then 10
	when substring(currentClass,1,1)='7' then 7
	when substring(currentClass,1,1)='8' then 8
	when substring(currentClass,1,1)='9' then 9
end as yearGroup,
case
	when senStatus like '%no%' or senStatus is null then 'No'
	else 'Yes'
end SENYN
into dbo.Maths
from maths26;

--drop table Maths;

select * from maths26 where senStatus like '%no%' or senStatus is null;

select * from Maths;
