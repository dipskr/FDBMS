drop database bank;
create database if not exists bank;
show databases;
use bank;
select database();
show tables;
create table if not exists Customer(
      C_ID int unique not null auto_increment,
      C_Name varchar(25) unique not null default '',
      C_Phone varchar(13) unique not null default '',
      C_Address varchar(50) unique not null default '',
      C_Gender enum('M','F') not null,
      primary key(C_ID)
);
create table if not exists Loan(
      L_ID int unique not null auto_increment,
      L_Type varchar(25) unique not null default '',
      L_Amount decimal(7,2) unique not null,
      C_ID int,
      primary key(L_ID),
      foreign key(C_ID) 
      references Customer(C_ID)
);
create table if not exists Account(
      A_AccountNo int unique not null auto_increment,
      A_Type varchar(30) unique not null default '',
      A_Balance decimal(7,2) unique not null,
      primary key(A_AccountNo),
      C_ID int ,
      foreign key(C_ID)
      references Customer(C_ID)
);
create table if not exists Transaction(
      T_ID int unique  not null auto_increment,
      T_Amount decimal(7,2) unique not null,
      T_Date date unique not null,
      primary key(T_ID),
      C_ID int,
      foreign key(C_ID)
      references Customer(C_ID)
);
create table if not exists Branch(
      B_ID int unique not null auto_increment,
      B_Name varchar(25) unique not null default '',
      B_Address varchar(50) unique not null,
      primary key(B_ID),
      L_ID int, 
      foreign key(L_ID) 
      references Loan(L_ID),
      A_AccountNo int, 
      foreign key(A_AccountNo) references Account(A_AccountNo)
);
show tables;
insert into Customer values (1001,'Arun Sharma','8580756700','3/55, Karol bagh,New Delhi','M');
insert into Customer values (1002,'Aisha Kumar','8681766707','25/1025, Karol bagh,New Delhi','F');
insert into Customer values (1003,'Dushyant Singh','8586082714','11/455, Ramjas Road,Karol bagh,New Delhi','M');
insert into Customer values (1004,'Disha Aggarwal','9580778655','3/55,V-52, Old Rajinder Nagar, New Delhi','F');
insert into Customer values (1005,'Kanika Malhotra','8581766899','30/6560, Karol bagh,New Delhi','F');
insert into Customer values (1006,'Kartik Singh','9873004034','10/3555, Karol Bagh, New Delhi','M');
insert into Loan values (2001,'Housing Loan',20000.0,1005);
insert into Loan values (2002,'Agriculture Loan',30000.0,1003);
insert into Loan values (2003,'Car Loan',15000.0,1004);
insert into Loan values (2004,'Gold Loan',5000.0,1002);
insert into Loan values (2005,'Education Loan',50000.0,1006);
insert into Loan values (2006,'Small Traders Loan',4000.0,1001);
insert into Account values (3001,'Saving Bank Account',30000.0,1005);
insert into Account values (3002,'Premium Account',40000.0,1003);
insert into Account values (3003,'Recurring Deposit Account',15000.0,1004);
insert into Account values (3004,'Current Account',45000.0,1002);
insert into Account values (3005,'Fixed Deposit Account',10000.0,1006);
insert into Account values (3006,'Demat Account',7000.0,1001);
insert into Transaction values (4001,30000.0,date '2021-10-01',1005);
insert into Transaction values (4002,40000.0,date '2021-08-10',1003);
insert into Transaction values (4003,5000.0,date '2021-12-26',1004);
insert into Transaction values (4004,11000.0,date '2021-09-15',1002);
insert into Transaction values (4005,9999.99,date '2021-04-08',1006);
insert into Transaction values (4006,25000.0,date '2022-01-04',1001);
insert into Branch values (5001,'Karol Bagh Branch','11/335,Bank Street, Karol Bagh, New Delhi',2001,3001);
insert into Branch values (5002,'Rajinder Nagar Branch','10/371, Old Rajinder Nagar, New Delhi',2002,3002);
insert into Branch values (5003,'Greater Kailash Branch','7/355, Greater Kailash, New Delhi',2003,3003);
insert into Branch values (5004,'Paschim Vihar Branch','Block A, Paschim Vihar, New Delhi',2004,3005);

create user 'Jatin'@'localhost' identified by 'Jatin';
grant create,drop,select,insert on Customer to 'Jatin'@'localhost';
select * from Customer limit 2; 
select * from Account;
create user 'dipu'@'localhost' identified by 'dipu';
grant select,insert, update, delete on Account to 'dipu'@'localhost';
select * from customers limit 2; 
select * from Account;
create user 'karthick'@'localhost' identified by 'karthick';
grant select on Customer.bank to 'karthick'@'localhost';
grant select on Account.bank to 'karthick'@'localhost';
select * from customers limit 2; 
select * from Account;

start transaction;
select * from customer;
Savepoint tran;
insert into Transaction values(4007, 12000.0, date '2021-12-10',1006);
Rollback to tran;
