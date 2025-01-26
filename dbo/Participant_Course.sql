create table Participant_Course
(
    Participant_ID        int not null
        constraint Participant_Course_pk
            primary key
        constraint Participant_Course_Users_User_ID_fk
            references Users,
    Course_ID             int not null
        constraint Courses_ParticipantCourse
            references Courses,
    Completion_Percentage int not null
)
go

create index ParticipantCourse_CompletionPercentage
    on Participant_Course (Completion_Percentage)
go

