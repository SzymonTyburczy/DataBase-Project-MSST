create table Participant_Webinar
(
    Webinar_ID      int not null
        constraint Participant_Webinar_Webinars_Webinar_ID_fk
            references Webinars,
    Participant_ID  int not null
        constraint Participant_Webinar_Users_User_ID_fk
            references Users,
    Webinar_Payment bit not null,
    Webinar_Access  bit not null,
    constraint Participant_Webinar_pk
        primary key (Webinar_ID, Participant_ID)
)
go

create index ParticipantWebinar_WebinarAccess
    on Participant_Webinar (Webinar_Access)
go

