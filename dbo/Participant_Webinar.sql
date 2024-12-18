create table Participant_Webinar
(
    Webinar_ID      int not null,
    Participant_ID  int not null,
    Webinar_Payment bit not null,
    Webinar_Access  bit not null,
    constraint Participant_Webinar_pk
        primary key (Webinar_ID, Participant_ID)
)
go

