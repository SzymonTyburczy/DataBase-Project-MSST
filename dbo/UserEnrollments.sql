CREATE VIEW UserEnrollments AS
SELECT
    U.User_ID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    'Study' AS EnrollmentType,
    SD.Name AS EnrollmentName
FROM
    Users U
JOIN
    Students ST ON U.User_ID = ST.Student_ID
JOIN
    Studies S ON ST.Studies_ID = S.Studies_ID
JOIN
    Studies_Details SD ON S.Studies_ID = SD.Studies_ID

UNION ALL

SELECT
    U.User_ID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    'Course' AS EnrollmentType,
    C.Name AS EnrollmentName -- Dodanie kolumny EnrollmentName, aby zgadzała się liczba kolumn
FROM
    Users U
JOIN
    Participant_Course PC ON U.User_ID = PC.Participant_ID
JOIN
    Courses C ON PC.Course_ID = C.Course_ID

UNION ALL

SELECT
    U.User_ID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    'Webinar' AS EnrollmentType,
    W.Webinar_Name AS EnrollmentName
FROM
    Users U
JOIN
    Participant_Webinar PW ON U.User_ID = PW.Participant_ID
JOIN
    Webinars W ON PW.Webinar_ID = W.Webinar_ID
go

