use RandomStudent;
/*
 drop table student
select * from student
insert into student (birthday, city) values('19/05/1988',4)
select * from student
drop table student
*/
if not exists (select * from sysobjects where name='student' and xtype='U')
    create table [student] (
		id int primary key not null  IDENTITY(1,1),
        enrollment varchar(50) null,
		birthday datetime not null,
		age as ( 
			CONVERT(int,ROUND(DATEDIFF(hour,birthday,GETDATE())/8766.0,0))
		),
		firstName varchar(50) null,
		lastName varchar(50) null,
		adress varchar(50) null,
		phone varchar(50) null,
		mail varchar(50) null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int,
		city int not null,
		constraint FK_student_city foreign key(city) references city(id)
    );

/*select * from city
insert into city(name,state) values ('Reu',1111)
drop table city*/
if not exists (select * from sysobjects where name='city' and xtype='U')
    create table [city] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) not null,
		[state] int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
);

alter table city add constraint FK_city_state foreign key(state) references state(id)

if not exists (select * from sysobjects where name='state' and xtype='U')
    create table [state] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) not null,
		country int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
);
alter table state add constraint FK_state_country foreign key(country) references country(id)

if not exists (select * from sysobjects where name='country' and xtype='U')
    create table [country] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
);



if not exists (select * from sysobjects where name='teacher' and xtype='U')
    create table [teacher] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) not null,
		code varchar(50) not null,
		created_at datetime default getdate(),
		updated_at datetime default getdate()
    );

if not exists (select * from sysobjects where name='quiz' and xtype='U')
	create table [quiz] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) not null,
		code varchar(50) not null,
		teacher int not null,
		created_at datetime default getdate(),
		updated_at datetime default getdate()
    );

if not exists (select * from sysobjects where name='quizDetail' and xtype='U')
	create table [quizDetail] (
		id int primary key not null  IDENTITY(1,1),
        quiz int not null,
		student int not null,
		point int default 0,
		created_at datetime default getdate(),
		updated_at datetime default getdate()
    );

alter table quiz add constraint quiz_teacher_id foreign key (teacher) references teacher(id)
alter table quizDetail add constraint quizDetail_quiz_id foreign key (quiz) references quiz(id)
alter table quizDetail add constraint quizDetail_student_id foreign key (student) references student(id)

-- create user in database
CREATE LOGIN std1 with password = 'ComputerDB190%';


SP_ADDSRVROLEMEMBER 'std1','SYSADMIN'
