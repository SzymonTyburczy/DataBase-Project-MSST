CREATE FUNCTION HasStudentCompletedInternships (@StudentID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;

    -- Sprawdzenie, czy student odbył praktyki zgodnie z wymaganiami
    IF NOT EXISTS (
        SELECT 1
        FROM Internship I
        JOIN Student_Internship SI ON I.Internship_ID = SI.Internship_ID
        JOIN Students S ON SI.Student_ID = S.Student_ID
        WHERE S.Student_ID = @StudentID
          AND SI.Completion <> 1 -- Sprawdzenie, czy praktyka nie została ukończona
    ) AND EXISTS (
        SELECT 1
        FROM Internship I
        JOIN Student_Internship SI ON I.Internship_ID = SI.Internship_ID
        JOIN Students S ON SI.Student_ID = S.Student_ID
        WHERE S.Student_ID = @StudentID
        GROUP BY YEAR(I.Start_Date), CEILING(MONTH(I.Start_Date) / 6.0)
        HAVING COUNT(I.Internship_ID) >= 1 -- Sprawdzenie, czy praktyki odbyły się co najmniej raz na pół roku
    )
    BEGIN
        SET @IsValid = 1; -- Student spełnia wymagania
    END
    ELSE
    BEGIN
        SET @IsValid = 0; -- Student nie spełnia wymagań
    END

    RETURN @IsValid;
END
go

