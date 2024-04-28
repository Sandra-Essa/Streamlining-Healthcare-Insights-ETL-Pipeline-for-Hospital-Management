--Dim_Social_Services

create table Dim_Social_Services(
Service_ID_SK int identity(1,1) primary key,
Service_ID_BK int,
Services_Name  varchar(100),
day_of_service  date,

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint

)
------------------------------------------------
--Dim_Houses

create table Dim_Houses(
House_ID_SK int identity(1,1) primary key,
House_ID_BK int,
Patient_ID int,
City  varchar(100),
Street  varchar(100),
Zip_code_BK int,

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint
)
-------------------------------------------------------
--Dim_Students

create table Dim_Students(
Student_ID_SK int identity(1,1) primary key,
Student_ID_BK int,
Student_Name  varchar(100),
Category  varchar(100),

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint
)
--------------------------------------------------
--Dim_Nurses

create table Dim_Nurses(
Nurse_ID_SK int identity(1,1) primary key,
Nurse_ID_BK int, 
Nurse_Name  varchar(100),
Student_ID_FK int,
House_ID_FK int,
Service_ID_FK int,

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint,

constraint C1 foreign key(Service_ID_FK) references Dim_Social_Services(Service_ID_SK),
constraint C2 foreign key(House_ID_FK) references Dim_Houses(House_ID_SK),
constraint C3 foreign key(Service_ID_FK) references Dim_Students(Student_ID_SK)
)
----------------------------------------------------------
--Dim_Prescription

create table Dim_Prescription(
Pres_ID_SK int identity(1,1) primary key,
Pres_ID_BK int,
Pres_Date date,
PresBY varchar(100),

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint
)
-------------------------------------------------------------
--Dim_Pharmacy

create table Dim_Pharmacy(
Pharmacy_ID_SK int identity(1,1)  primary key,
Pharmacy_ID_BK int,
Pharmacy_Name varchar(100),
Contact_NO_BK varchar(100),
Zip_code_BK int  ,
City  varchar(100),
Street  varchar(100),

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint

)
---------------------------------------------------
--Dim_Drugs

create table Dim_Drugs(
Drug_ID_SK int identity(1,1) primary key,
Drug_ID_BK int,
Purpose_of_Drug varchar(100),
Manufacture_drug varchar(100),
Drug_Name varchar(100),
Pres_ID_FK int,
Pharmacy_ID_FK int,

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint,
constraint C4 foreign key(Pres_ID_FK) references Dim_Prescription(Pres_ID_SK),
constraint C5 foreign key(Pharmacy_ID_FK) references Dim_Pharmacy(Pharmacy_ID_SK)

)
-------------------------------------------------------
--Dim_Disease
create table Dim_Disease(
Dis_ID_SK int identity(1,1) primary key,
Dis_ID_BK int,
Dis_Name  varchar(100),

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint
)
-----------------------------------------------------
--Dim_Doctors

create table Dim_Doctors(
Doctor_ID_SK int identity(1,1) primary key,
Doctor_ID_BK int,
Experience_year varchar(100),
Doctor_Name varchar(100),
Spec_ID_BK int,
Zip_code_BK int,
Contact_NO_BK varchar(100),
City  varchar(100),
Street  varchar(100),
Spec_Name  varchar(100),

start_date datetime,
end_date datetime,
is_current tinyint,
source_system_code tinyint
)
-----------------------------------------------------
--Fact_Patients

create table Fact_Patients(
Fact_Transactional_PK_SK int identity(1,1) primary key,
Nurse_ID_FK int,
Drug_ID_FK int,
Dis_ID_FK int,
Doctor_ID_FK int,

Patient_ID_BK int,
Zip_code_BK int ,
City  varchar(100),
Street  varchar(100),
Patient_Name varchar(100),
Date_admitted date,
Date_discharged date,
Patient_Gender varchar(100),
Room_NO varchar(100),
Contact_NO_BK varchar(100),
Account_ID_BK int,
Services_Description varchar(200),
Total_Account money,

create_at datetime,
source_system_code tinyint,

constraint C7 foreign key(Nurse_ID_FK) references Dim_Nurses(Nurse_ID_SK),
constraint C8 foreign key(Drug_ID_FK) references Dim_Drugs(Drug_ID_SK),
constraint C9 foreign key(Dis_ID_FK) references Dim_Disease(Dis_ID_SK),
constraint C10 foreign key(Doctor_ID_FK) references Dim_Doctors(Doctor_ID_SK),

)
--------------------------------------------------------------
create table Meta_Control_Fact_Patients_Load(
id int identity(1,1) primary key,
PatientID nvarchar(100),
Last_load_date datetime,
Last_Load_PatientID_BK int
)