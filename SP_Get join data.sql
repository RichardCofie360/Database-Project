USE [hospitalDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_get_joined_data]    Script Date: 10/17/2023 4:05:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_get_joined_data] 
@from int,
@to int
AS
SELECT        diagnosis.Disease, diagnosis.Date_of_Diagnosis, 
diagnosis.VisitID, 
visit.PatientID, visit.DateOfAttendance,
YEAR( visit.DateOfAttendance) year_of_attendance,
DATENAME(YEAR,visit.DateOfAttendance)+'Q'+DATENAME(QUARTER,visit.DateOfAttendance) quarter_of_attendance,
DATENAME(MONTH, visit.DateOfAttendance) month_of_attendance,
MONTH(visit.DateOfAttendance) month_num_of_attendance,
DATENAME(WEEKDAY,visit.DateOfAttendance) week_day_of_attendance,
DATEPART(WEEKDAY,visit.DateOfAttendance) week_day_num_of_attendance,
DATEPART(WEEK,visit.DateOfAttendance) week_of_attendance,
YEAR( diagnosis.Date_of_Diagnosis) year_of_diagnosis,
DATENAME(YEAR,diagnosis.Date_of_Diagnosis)+'Q'+DATENAME(QUARTER,diagnosis.Date_of_Diagnosis) quarter_of_diagnosis,
DATENAME(MONTH, diagnosis.Date_of_Diagnosis) month_of_diagnosis,
MONTH(diagnosis.Date_of_Diagnosis) month_num_of_diagnosis,
DATENAME(WEEKDAY,diagnosis.Date_of_Diagnosis) week_day_of_diagnosis,
DATEPART(WEEKDAY,diagnosis.Date_of_Diagnosis) week_day_num_of_diagnosis,
DATEPART(Week,diagnosis.Date_of_Diagnosis) week_of_diagnosis,
visit.Sex, visit.AgeGroup, visit.Hospital
FROM    diagnosis INNER JOIN
  visit ON diagnosis.VisitID = visit.VisitID
  where YEAR(DateOfAttendance) 
  BETWEEN @from 
  AND @to 
  AND YEAR(Date_of_Diagnosis)
  BETWEEN @from 
  AND @to
GO


