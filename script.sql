create database Academy;
go

create table Groups
(
    Id int identity(1,1) not null primary key,
    Name nvarchar(10) not null unique check(Name <> ''),
    Rating int not null check(Rating >= 0 and Rating <= 5),
    Year int not null check(Year >= 1 and Year <= 5)
);
go

create table Departments
(
    Id int identity(1,1) not null primary key,
    Financing money not null default 0 check(Financing >= 0),
    Name nvarchar(100) not null unique check(Name <> '')
);
go

create table Faculties
(
    Id int identity(1,1) not null primary key,
    Name nvarchar(100) not null unique check(Name <> '')
);
go

create table Teachers
(
    Id int identity(1,1) not null primary key,
    EmploymentDate date not null check(EmploymentDate >= '1990-01-01'),
    Name nvarchar(max) not null check(Name <> ''),
    Premium money not null default 0 check(Premium >= 0),
    Salary money not null check(Salary > 0),
    Surname nvarchar(max) not null check(Surname <> '')
);