use RandomStudent;

/*IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'entities')) 
BEGIN
    EXEC ('CREATE SCHEMA [entities] AUTHORIZATION [dbo]')
	print('create entities scheme')
END else begin
	print('entities schme already exists')
end
*/

if not exists (select * from sysobjects where name='student' and xtype='U')
    create table [student] (
		id int primary key not null  IDENTITY(1,1),
        firstName varchar(50) not null,
		lastName varchar(50) not null,
		carne varchar(50) not null,
		created_at datetime default getdate(),
		updated_at datetime default getdate()
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
