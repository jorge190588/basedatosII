--https://docs.microsoft.com/en-us/sql/t-sql/functions/error-message-transact-sql?view=sql-server-2017
--https://www.red-gate.com/simple-talk/sql/database-administration/handling-errors-in-sql-server-2012/
-- first example
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
	select 1
END TRY  
BEGIN CATCH  
    SELECT ERROR_MESSAGE() as message	
END CATCH;  


-- second example
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
	declare @mensaje varchar(50)
    SELECT @mensaje=ERROR_MESSAGE()
	insert into errores(nombre) values(@mensaje)
END CATCH;  
GO

select * from errores
drop table errores
create table errores (id int primary key not null identity, 
nombre varchar(50), 
fecha datetime default getdate())
  
-- third example
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    insert into errores (ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO  

create table errores (id int primary key not null identity, 
ErrorNumber int,
ErrorSeverity int,
ErrorState int,
ErrorProcedure varchar(500), 
ErrorLine int,
ErrorMessage varchar(500),
fecha datetime default getdate())

create table clientes (id int primary key not null identity, 
nombre varchar(5), 
fecha datetime default getdate())
select * from clientes


--fourth
declare @result int, @errorMessage varchar(500)

BEGIN TRY  
	insert into clientes (nombre) values ('jorge');
	--insert into clientes (nombre) values ('salvador');
	insert into errores(id) values (1);
	select @result=1;
END TRY  
BEGIN CATCH  
	insert into errores (ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
	SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
	select @result=0;
	select @errorMessage= case when ERROR_NUMBER()=8152 then 'El texto de un campo es mayor a su longitud' else 
							case when ERROR_NUMBER()=544 then 'División entre zero no  permitida' else 
							'Error en la operacion' end end ;
END CATCH;  

select @result result,@errorMessage errorMessage
GO  