create table Participant_Course
(
    Participant_ID        int not null
        constraint Participant_Course_pk
            primary key,
    Course_ID             int not null
        constraint Courses_ParticipantCourse
            references Courses,
    Completion_Percentage int not null
)
go

