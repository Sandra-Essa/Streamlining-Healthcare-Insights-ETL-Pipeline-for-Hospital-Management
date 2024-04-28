SELECT D.[Doctor_ID]
      ,D.[Zip_code]
      ,DA.[City]
	  ,DA.[Street]
	  ,D.[Experience_year]
	  ,D.[Doctor_Name]
	  ,DP.[Contact_NO]
	  ,S.[Spec_ID]
      ,S.[Spec_Name]
	  
FROM [OLTP_Hospital_Management_System].[dbo].[Doctors] as D
left join [OLTP_Hospital_Management_System].[dbo].[Doctors_Address] as DA
on(D.Zip_code=DA.Zip_code)

left join [OLTP_Hospital_Management_System].[dbo].[Doctors_Phone] as DP
on(D.Doctor_ID=DP.Doctor_ID)

left join [OLTP_Hospital_Management_System].[dbo].[Specialization] as S
on(D.Spec_ID=S.Spec_ID)