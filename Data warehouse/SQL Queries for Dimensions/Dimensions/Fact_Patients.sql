SELECT 
        P.[Patient_ID]
	   ,P.[Patient_Name]
	   ,P.[Date_admitted]
	   ,P.[Date_discharged]
	   ,P.[Patient_Gender]
	   ,PA.[Street]
       ,PA.[City]
	   ,P.[Zip_code]
	   ,PP.[Contact_NO]
	   ,P.[Room_NO]
	   ,A.[Account_ID]
	   ,A.[Services_Description]
	   ,A.[Total_Account]
        ,P.[LastModifiedDate]
		,NP.[Nurse_ID]
		,PD.[Dis_ID]
		,DP.[Doctor_ID]
		,D.[Drug_ID]

	  
FROM [OLTP_Hospital_Management_System].[dbo].[Patients] as P
LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Patients_Address] as PA
ON P.Zip_code = PA.Zip_code
LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Patients_Phone] as PP
ON P.Patient_ID = PP.Patient_ID
LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Accounts] as A
ON P.Patient_ID = A.Patient_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Nurses_Patients] as NP
ON P.Patient_ID = NP.Patient_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Patients_Disease] as PD
ON P.Patient_ID = PD.Patient_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Doctors_Patients] as DP
ON P.Patient_ID = DP.Patient_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Prescription] as Pr
ON P.Patient_ID = Pr.Patient_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Prescription_Drugs] as Prd
ON Pr.Pres_ID = Prd.Pres_ID

LEFT JOIN [OLTP_Hospital_Management_System].[dbo].[Drugs] as D
ON Prd.Drug_ID= D.Drug_ID

where p.Patient_ID> --user variable last load patient id
and  p.LastModifiedDate>= --user variable last load date
and  p.LastModifiedDate < --system variable start time

