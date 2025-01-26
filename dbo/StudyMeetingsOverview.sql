CREATE VIEW StudyMeetingsOverview AS
SELECT
    STM.Studies_Meeting_ID AS MeetingID,
    SD.Name AS StudyProgramName,
    SMD.Form AS MeetingForm,
    CONCAT(E.First_Name, ' ', E.Last_Name) AS InstructorName,
    SMD.Date AS MeetingDate
FROM Studies_Meeting STM
JOIN Studies_Details SD ON STM.Studies_ID = SD.Studies_ID
JOIN Studies_Meeting_Details SMD ON STM.Studies_Meeting_ID = SMD.Study_Meeting_ID
LEFT JOIN Employees E ON STM.Translator_ID = E.Employee_ID
go

