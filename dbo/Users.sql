create table Users
(
    User_ID           int          not null
        constraint Users_pk
            primary key,
    First_Name        nvarchar(20) not null,
    Last_Name         nvarchar(20) not null,
    Account_Status    nvarchar(20) not null,
    Address           nvarchar(40) not null,
    Postal_Code       nvarchar(12) not null,
    GDPR_Date_Consent date         not null
)
go

