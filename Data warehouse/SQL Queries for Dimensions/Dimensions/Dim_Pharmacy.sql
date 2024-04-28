SELECT P.[Pharmacy_ID]
      ,P.[Pharmacy_Name]
      ,A.[Zip_code]
	  ,A.[City]
	  ,A.[Street]
	  ,N.[Contact_NO]
FROM [OLTP_Hospital_Management_System].[dbo].[Pharmacy] as P
left join [OLTP_Hospital_Management_System].[dbo].[Pharmacy_Phone] as N
on(P.Pharmacy_ID=N.Pharmacy_ID)
left join [OLTP_Hospital_Management_System].[dbo].[Pharmacy_Address] as A
on(P.Zip_code=A.Zip_code)
