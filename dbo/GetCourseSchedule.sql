CREATE FUNCTION GetCourseSchedule (@CourseID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        CM.Course_Meeting_ID AS MeetingID,
        C.Name AS CourseName,
        CM.Form AS MeetingForm,
        CM.Date AS MeetingDate,
        CM.Duration AS MeetingDuration,
        CONCAT(E.First_Name, ' ', E.Last_Name) AS InstructorName,
        L.Language AS Language
    FROM Course_Meeting CM
    JOIN Courses C ON CM.Course_ID = C.Course_ID
    LEFT JOIN Employees E ON CM.Instructor_ID = E.Employee_ID
    LEFT JOIN Language L ON CM.Language_ID = L.Language_ID
    WHERE CM.Course_ID = @CourseID
)
go

