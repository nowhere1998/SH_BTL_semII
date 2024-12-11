create database DB_SH_BTL
go

use DB_SH_BTL
go

create table users(
	id int primary key identity,
	name nvarchar(50) not null,
	email varchar(100) not null unique,
	password varchar(50) not null,
	role int default 0,
	img varchar(100) default ''
)
go

select * from users

create table category(
	id int primary key identity,
	name nvarchar(100) not null unique,
	parentName nvarchar(100) not null,
	status bit
)
go

select * from category
go

create table product(
	id int primary key identity,
	categoryId int foreign key references category(id),
	name nvarchar(100) not null unique,
	price float not null,
	salePrice float not null,
	img nvarchar(250),
	description nvarchar(250),
	status bit
)
go

create table orders(
	id int primary key identity,
	accountId int foreign key references users(id),
	totalPrice float not null,
	createdAt date,
	status int,
	phone int,
	address nvarchar(250),
	note nvarchar(100)
)
go

create table orderDetail(
	id int primary key identity,
	productId int foreign key references product(id),
	orderId int foreign key references orders(id),
	amount int,
	price float
)
go


select * from orders order by id desc

insert into orders values (1, 100, null, 1, 123, 'avc', 'adf')

