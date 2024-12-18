create table Webinar_Details
(
    Webinar_ID        int           not null
        constraint Webinar_Details_pk
            primary key,
    Price             money         not null,
    Details           nvarchar(max) not null,
    Link_To_Recording nvarchar(max) not null,
    Duration          int           not null
)
go

