-- select master database
use master;

-- check if database exists
if db_id('RandomStudent') is not null begin
   -- alter database RandomStudent set single_user with rollback immediate
   -- drop database RandomStudent;
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
end;

