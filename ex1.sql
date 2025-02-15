create database Hospital;
go
create table Departaments
(
    Id int identity(1,1) not null primary key,
    Building int not null check(Building between 1 and 5),
    Financing money not null default 0 check(Financing >= 0),
    Name nvarchar(100) not null check (Name<>'') unique,
);
create table Diseases
(
    Id int identity(1,1) not null primary key,
    Name nvarchar(100) not null check(Name<>'') unique,
    Severity int not null check(Severity >= 1) default 1,
);
go
create table Doctors
(
    Id int identity(1,1) not null primary key,
    Name nvarchar(max) not null check(Name<>''),
    Phone char(10) not null,
    Salary money not null check(Salary > 0),
    Surname nvarchar(max) not null check(Surname<>''),
);
go
create table Examinations
(
    Id int identity(1,1) not null primary key,
    DayOfWeek int not null check(DayOfWeek between 1 and 7),
    Name nvarchar(100) not null unique check(Name <> ''),
    StartTime time not null check(StartTime between '08:00:00' and '18:00:00'),
    EndTime time not null,
    constraint chk_EndTime check (EndTime > StartTime)
);
use Hospital;
go

-- Drop existing tables if they exist
if object_id('Departaments', 'U') is not null drop table Departaments;
if object_id('Diseases', 'U') is not null drop table Diseases;
if object_id('Doctors', 'U') is not null drop table Doctors;
if object_id('Examinations', 'U') is not null drop table Examinations;
go