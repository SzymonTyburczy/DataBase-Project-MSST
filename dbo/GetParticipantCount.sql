-- HOW MANY PARTICIPANTS IN COURSE
CREATE FUNCTION [dbo].[GetParticipantCount](@CourseID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Participant_Course
    WHERE Course_ID = @CourseID;

    RETURN @Count;
END
go

