CREATE FUNCTION GetStudentSchedule (@StudentID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        gss.MeetingID,
        gss.StudyName,
        gss.SubjectID,
        gss.Language,
        gss.MeetingForm,
        gss.MeetingDate
    FROM dbo.GetStudiesSchedule(
        (SELECT Studies_ID FROM Students WHERE Student_ID = @StudentID)
    ) gss
)
go

