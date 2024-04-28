SELECT D.[Drug_ID]
      ,D.[Manufacture_drug]
      ,D.[Drug_Name]
	  ,D.[Purpose_of_Drug]
	  ,PD.[Pres_ID]
	  ,P.[Pharmacy_ID]
	  
FROM [OLTP_Hospital_Management_System].[dbo].[Drugs] as D
left join [OLTP_Hospital_Management_System].[dbo].[Prescription_Drugs] as PD
on(D.Drug_ID=PD.Drug_ID)
left join [OLTP_Hospital_Management_System].[dbo].[Pharmacy] as P
on(D.Pharmacy_ID=P.Pharmacy_ID)
