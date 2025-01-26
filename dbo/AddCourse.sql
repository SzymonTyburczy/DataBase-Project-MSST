CREATE PROCEDURE AddCourse
    @Name NVARCHAR(30),
    @Description NVARCHAR(30),
    @Price MONEY,
    @Coordinator_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewCourseID INT;

    SELECT @NewCourseID = ISNULL(MAX(Course_ID), 0) + 1 FROM Courses;

    INSERT INTO Courses (Course_ID, Name, Description, Price, Coordinator_ID)
    VALUES (@NewCourseID, @Name, @Description, @Price, @Coordinator_ID);

    SELECT @NewCourseID AS NewCourseID;
END;
go

