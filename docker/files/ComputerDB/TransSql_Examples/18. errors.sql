--https://docs.microsoft.com/en-us/sql/t-sql/functions/error-message-transact-sql?view=sql-server-2017
--https://www.red-gate.com/simple-talk/sql/database-administration/handling-errors-in-sql-server-2012/
-- first example
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
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

create table errores (id int primary key not null identity, 
nombre varchar(50), 
fecha datetime default getdate())
  
-- third example
BEGIN TRY  
    -- Generate a divide-by-zero error.  
    SELECT 1/0;  
END TRY  
BEGIN CATCH  
    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH;  
GO  

 