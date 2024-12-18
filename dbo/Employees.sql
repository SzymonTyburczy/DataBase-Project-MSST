create table Employees
(
    Employee_ID int          not null
        constraint Employees_pk
            primary key,
    First_Name  nvarchar(20) not null,
    Last_Name   nvarchar(20) not null,
    Position_ID int          not null
        constraint Positions_Employees
            references Position
)
go

