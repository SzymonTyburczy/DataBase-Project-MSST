create table Webinar_Orders
(
    Details_ID int not null
        constraint Webinar_Orders_pk
            primary key
        constraint Webinar_Orders_Orders_Details_Details_ID_fk
            references Orders_Details,
    Webinar_ID int not null
        constraint Webinar_Orders_Webinars_Webinar_ID_fk
            references Webinars
)
go

