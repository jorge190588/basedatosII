use RandomStudent;
drop table course;
drop table pensum;
drop table grade;
drop table city;
drop table state;
drop table country;
drop table student;
drop table town;

if not exists (select * from sysobjects where name='pensum' and xtype='U')
    create table [pensum] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) null,
		code varchar(20) not null,
		year int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)

if not exists (select * from sysobjects where name='course' and xtype='U')
    create table [course] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) null,
		code varchar(20) not null,
		pensum int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)
alter table course add constraint FK_course_pensum foreign key(pensum) references pensum(id)

if not exists (select * from sysobjects where name='grade' and xtype='U')
    create table [grade] (
		id int primary key not null  IDENTITY(1,1),
        name varchar(50) null,
		code varchar(20) not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)

if not exists (select * from sysobjects where name='grade_course' and xtype='U')
    create table [grade_course] (
		id int primary key not null  IDENTITY(1,1),
        course int not null,
		grade int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)
alter table grade_course add constraint FK_grade_course_course foreign key(course) references course(id);
alter table grade_course add constraint FK_grade_course_grade foreign key(grade) references grade(id);


if not exists (select * from sysobjects where name='content' and xtype='U')
    create table [content] (
		id int primary key not null  IDENTITY(1,1),
        code varchar(10) not null,
		name varchar(150) not null,
		indicator int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)

if not exists (select * from sysobjects where name='evaluationCriteria' and xtype='U')
    create table [evaluationCriteria] (
		id int primary key not null  IDENTITY(1,1),
        code varchar(10) not null,
		name varchar(150) not null,
		indicator int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)

if not exists (select * from sysobjects where name='indicator' and xtype='U')
    create table [indicator] (
		id int primary key not null  IDENTITY(1,1),
        code varchar(10) not null,
		name varchar(150) not null,
		competency int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)
	
if not exists (select * from sysobjects where name='competency' and xtype='U')
    create table [competency] (
		id int primary key not null  IDENTITY(1,1),
        code varchar(10) not null,
		name varchar(150) not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)
	
if not exists (select * from sysobjects where name='grade_course_content' and xtype='U')
    create table grade_course_content (
		id int primary key not null  IDENTITY(1,1),
        content int not null,
		course_grade int not null,
		created_at datetime default getdate(),
		updated_at datetime null,
		created_by int null,
		updated_by int null,
		version int
	)


alter table course_grade_cont add constraint FK_course_course foreign key(course) references course(id);
alter table course_grade add constraint FK_course_grade foreign key(grade) references grade(id);





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
