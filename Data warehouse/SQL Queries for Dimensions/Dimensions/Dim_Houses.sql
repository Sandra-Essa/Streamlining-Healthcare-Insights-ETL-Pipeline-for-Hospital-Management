SELECT H.[House_ID]
      ,H.[Patient_ID]
      ,A.[Zip_code]
	  ,A.[City]
	  ,A.[Street]
FROM [OLTP_Hospital_Management_System].[dbo].[Houses] as H
left join [OLTP_Hospital_Management_System].[dbo].[Houses_Address] as A
on(H.Zip_code=A.Zip_code)
