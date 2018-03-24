-- select master database
use master;

-- check if database exists
if db_id('RandomStudent') is not null begin
   --alter database RandomStudent set single_user with rollback immediate
   --drop database RandomStudent;
   print 'database already exists'
end else begin
	create database RandomStudent;
	/*
	ALTER DATABASE RandomStudent SET OFFLINE;
	ALTER DATABASE RandomStudent MODIFY FILE (
		Name='RandomStudent', 
		FILENAME='/files/RandomStudent/database/RandomStudent.mdf');

	ALTER DATABASE RandomStudent MODIFY FILE (
		Name='RandomStudent_log', 
		FILENAME='/files/RandomStudent/database/RandomStudent_log.mdf');
	
	ALTER DATABASE RandomStudent SET ONLINE;
	ALTER DATABASE RandomStudent SET MULTI_USER;
	*/
	print 'create database';
end

use RandomStudent;

if not exists (select * from sysobjects where name='student' and xtype='U')
    create table student (
		id int primary key not null identity,
        name varchar(50) not null,
		carne varchar(50) not null,
		created_at datetime default getdate(),
		updated_ad datetime default getdate()
    );

if not exists (select * from sysobjects where name='teacher' and xtype='U')
    create table teacher (
		id int primary key not null identity,
        name varchar(50) not null,
		code varchar(50) not null,
		created_at datetime default getdate(),
		updated_ad datetime default getdate()
    );

if not exists (select * from sysobjects where name='quiz' and xtype='U')
	create table quiz (
		id int primary key not null identity,
        name varchar(50) not null,
		code varchar(50) not null,
		teacher int not null,
		created_at datetime default getdate(),
		updated_ad datetime default getdate()
    );

if not exists (select * from sysobjects where name='quizDetail' and xtype='U')
	create table quizDetail (
		id int primary key not null identity,
        quiz int not null,
		student varchar(50) not null,
		point int default 0,
		created_at datetime default getdate(),
		updated_ad datetime default getdate()
    );


