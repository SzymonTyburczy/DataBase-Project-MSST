CREATE PROCEDURE UpdateMeetingDuration
    @MeetingID INT,
    @NewDuration TIME
AS
BEGIN
    UPDATE Course_Meeting
    SET Duration = @NewDuration
    WHERE Course_Meeting_ID = @MeetingID;
END;
go

