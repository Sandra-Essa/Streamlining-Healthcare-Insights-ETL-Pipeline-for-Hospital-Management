--Social_Services

create table Social_Services(
Service_ID int  primary key,
Services_Name  varchar(100),
day_of_service  date,
LastModifiedDate datetime,
is_current int

)
----------------------------------------
--Students

create table Students(
Student_ID int  primary key,
Student_Name  varchar(100),
Category  varchar(100),
LastModifiedDate datetime,
is_current int
)
-----------------------------------------------
--Disease

create table Disease(
Dis_ID int  primary key,
Dis_Name  varchar(100),
LastModifiedDate datetime,
is_current int
)
--------------------------------------------
--Nurses

create table Nurses(
Nurse_ID int  primary key,
Nurse_Name  varchar(100),
LastModifiedDate datetime,
is_current int
)
------------------------------------------------
--Specialization

create table Specialization(
Spec_ID int  primary key,
Spec_Name  varchar(100),
LastModifiedDate datetime,
is_current int
)
----------------------------------------------------
--Pharmacy_Address

create table Pharmacy_Address(
Zip_code int  primary key,
City  varchar(100),
Street  varchar(100),
LastModifiedDate datetime,
is_current int
)
--------------------------------------------
--Patients_Address

create table Patients_Address(
Zip_code int  primary key,
City  varchar(100),
Street  varchar(100),
LastModifiedDate datetime,
is_current int
)
-------------------------------------------
--Doctors_Address

create table Doctors_Address(
Zip_code int  primary key,
City  varchar(100),
Street  varchar(100),
LastModifiedDate datetime,
is_current int
)
------------------------------------------------
--Nurses_Students

create table Nurses_Students(
Student_ID int,
Nurse_ID int,
LastModifiedDate datetime,
is_current int,
constraint C1 foreign key(Student_ID) references Students(Student_ID),
constraint C2 foreign key(Nurse_ID) references Nurses(Nurse_ID),
constraint C3 primary key (Student_ID,Nurse_ID),
constraint C16 unique (Student_ID,Nurse_ID)
)
-------------------------------------------------
--Houses_Address

create table Houses_Address(
Zip_code int  primary key,
City  varchar(100),
Street  varchar(100),
LastModifiedDate datetime,
is_current int
)

--------------------------------------------------
--Houses

create table Houses(
House_ID int  primary key,
Patient_ID int,
Zip_code int,
Nurse_ID int,
LastModifiedDate datetime,
is_current int,
constraint C4 foreign key(Nurse_ID) references Nurses(Nurse_ID),
constraint C5 foreign key(Zip_code) references Houses_Address(Zip_code)
)
----------------------------------------------------------
--Nurses_Social_Services

create table Nurses_Social_Services(
Service_ID int,
Nurse_ID int,
LastModifiedDate datetime,
is_current int,
constraint C6 foreign key(Service_ID) references Social_Services(Service_ID),
constraint C7 foreign key(Nurse_ID) references Nurses(Nurse_ID),
constraint C8 primary key (Service_ID,Nurse_ID),
constraint C15 unique (Service_ID,Nurse_ID)
)
----------------------------------------------------------
--Patients

create table Patients(
Patient_ID int  primary key,
Patient_Name varchar(100),
Date_admitted date,
Date_discharged date,
Patient_Gender varchar(100),
Room_NO varchar(100),
Problem varchar(100),
Category varchar(100),
Zip_code int,
LastModifiedDate datetime,
is_current int,
constraint C9 foreign key(Zip_code) references Patients_Address(Zip_code)
)
truncate table Patients
--------------------------------------------------------
--Patients_Disease

create table Patients_Disease(
Patient_ID int,
Dis_ID int,
LastModifiedDate datetime,
is_current int,
constraint C10 foreign key(Patient_ID) references Patients(Patient_ID),
constraint C11 foreign key(Dis_ID) references Disease(Dis_ID),
constraint C12 primary key (Patient_ID,Dis_ID),
constraint C14 unique (Patient_ID,Dis_ID)
)
------------------------------------------------------------------
--Patients_Phone

create table Patients_Phone(
Patient_ID int,
Contact_NO varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C17 foreign key(Patient_ID) references Patients(Patient_ID),
constraint C18 primary key (Patient_ID,Contact_NO),
constraint C19 unique (Patient_ID,Contact_NO)
)
---------------------------------------------------------------------------
--Prescription

create table Prescription(
Pres_ID int  primary key,
Patient_ID int,
Pres_Date date,
PresBY varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C20 foreign key(Patient_ID) references Patients(Patient_ID)

)
------------------------------------------------------------------
--Pharmacy

create table Pharmacy(
Pharmacy_ID int  primary key,
Zip_code int,
Pharmacy_Name varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C21 foreign key(Zip_code) references Pharmacy_Address(Zip_code)

)
---------------------------------------------------------------
--Pharmacy_Phone

create table Pharmacy_Phone(
Pharmacy_ID int,
Contact_NO varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C22 foreign key(Pharmacy_ID) references Pharmacy(Pharmacy_ID),
constraint C23 primary key (Pharmacy_ID,Contact_NO),
constraint C24 unique (Pharmacy_ID,Contact_NO)
)
--------------------------------------------------------------
--Drugs

create table Drugs(
Drug_ID int primary key,
Pharmacy_ID int,
Purpose_of_Drug varchar(100),
Manufacture_drug varchar(100),
Drug_Name varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C25 foreign key(Pharmacy_ID) references Pharmacy(Pharmacy_ID)

)
---------------------------------------------------------
--Prescription_Drugs

create table Prescription_Drugs(
Pres_ID int,
Drug_ID  int,
LastModifiedDate datetime,
is_current int,
constraint C26 foreign key(Pres_ID) references Prescription(Pres_ID),
constraint C27 foreign key(Drug_ID) references Drugs(Drug_ID),
constraint C28 primary key (Pres_ID,Drug_ID),
constraint C29 unique (Pres_ID,Drug_ID)
)
--------------------------------------------------------------------
--Doctors

create table Doctors(
Doctor_ID int  primary key,
Experience_year varchar(100),
Doctor_Name varchar(100),
Spec_ID int,
Zip_code int,
LastModifiedDate datetime,
is_current int,
constraint C30 foreign key(Spec_ID) references Specialization(Spec_ID),
constraint C31 foreign key(Zip_code) references Doctors_Address(Zip_code)
)
--------------------------------------------------
--Doctors_Phone

create table Doctors_Phone(
Doctor_ID int,
Contact_NO varchar(100),
LastModifiedDate datetime,
is_current int,
constraint C32 foreign key(Doctor_ID) references Doctors(Doctor_ID),
constraint C33 primary key (Doctor_ID,Contact_NO),
constraint C34 unique (Doctor_ID,Contact_NO)
)
------------------------------------------------------------------
--Doctors_Patients

create table Doctors_Patients(
Patient_ID int,
Doctor_ID int,
LastModifiedDate datetime,
is_current int,
constraint C35 foreign key(Patient_ID) references Patients(Patient_ID),
constraint C36 foreign key(Doctor_ID) references Doctors(Doctor_ID),
constraint C37 primary key (Doctor_ID,Patient_ID),
constraint C38 unique (Doctor_ID,Patient_ID)
)
-------------------------------------------------------
--Nurses_Patients

create table Nurses_Patients(
Nurse_ID int,
Patient_ID int,
LastModifiedDate datetime,
is_current int,
constraint C39 foreign key(Nurse_ID) references Nurses(Nurse_ID),
constraint C40 foreign key(Patient_ID) references Patients(Patient_ID),
constraint C41 primary key (Patient_ID,Nurse_ID),
constraint C42 unique (Patient_ID,Nurse_ID)
)
-------------------------------------------------------------
--Accounts
create table Accounts(
Account_ID int identity (1,1) ,
Patient_ID int,
Services_Description varchar(200),
Total_Account money,
LastModifiedDate datetime,
is_current int,
constraint C43 foreign key(Patient_ID) references Patients(Patient_ID),
constraint C44 primary key (Patient_ID,Account_ID),
constraint C45 unique (Patient_ID,Account_ID)
)


