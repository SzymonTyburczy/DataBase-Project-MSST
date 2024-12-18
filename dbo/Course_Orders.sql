create table Course_Orders
(
    Details_ID int not null
        constraint Course_Orders_pk
            primary key
        constraint OrderDetails_CourseOrders
            references Orders_Details,
    Course_ID  int not null
        constraint Courses_CoursesOrders
            references Courses
)
go

