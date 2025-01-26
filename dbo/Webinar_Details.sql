create table Webinar_Details
(
    Webinar_ID        int           not null
        constraint Webinar_Details_pk
            primary key
        constraint Webinar_Details_Webinars_Webinar_ID_fk
            references Webinars,
    Price             money         not null,
    Link_To_Recording nvarchar(max) not null,
    Duration          int
)
go

