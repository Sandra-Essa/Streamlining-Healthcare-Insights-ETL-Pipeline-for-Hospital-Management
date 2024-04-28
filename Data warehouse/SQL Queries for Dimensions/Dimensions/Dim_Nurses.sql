SELECT N.[Nurse_ID]
      ,N.[Nurse_Name]
      ,NS.[Service_ID]
	  ,H.[House_ID]
	  ,NT.[Student_ID]
	  
FROM [OLTP_Hospital_Management_System].[dbo].[Nurses] as N
left join [OLTP_Hospital_Management_System].[dbo].[Nurses_Social_Services] as NS
on(N.Nurse_ID=NS.Nurse_ID)
left join [OLTP_Hospital_Management_System].[dbo].[Houses] as H
on(N.Nurse_ID=H.Nurse_ID)
left join [OLTP_Hospital_Management_System].[dbo].[Nurses_Students] as NT
on(N.Nurse_ID=NT.Nurse_ID)