--http://www.devjoker.com/contenidos/articulos/292/Transacciones-en-Transact-SQL.aspx
--https://www.campusmvp.es/recursos/post/Fundamentos-de-SQL-Transacciones.aspx
use ComputerDB

update Productos set idBodega=1
select * from productos

-- first example
SET IMPLICIT_TRANSACTIONS ON
BEGIN TRAN NOMBRETRANSACCION
	update Productos set idBodega=2 where id=1;
    ROLLBACK TRAN NOMBRETRANSACCION      
-- COMMIT TRAN NOMBRETRANSACCION

-- second example
declare @contador int
BEGIN TRY
	BEGIN TRANSACTION -- O solo BEGIN TRAN	
		update Productos set idBodega=2 where id=1;
		select @contador=count(*) from productos where id=1 and idBodega=2
		if (@contador>0) begin
			raiserror ('all row has idbodega', 16, 1)
		end 

		print 'commit transaction'
		COMMIT TRANSACTION;  
	
END TRY
BEGIN CATCH
	 
	/* Hay un error, deshacemos los cambios*/ 
	ROLLBACK TRANSACTION; -- O solo ROLLBACK
	PRINT 'rollback transaction'
	SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage; 
END CATCH


 
 BEGIN (OBLIGATORIO)
 COMMIT O ROLLBACK





 -- Ejemplo 3
 
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

delete from clientes
select * from clientes
--TRANSACCION
declare @result int, @errorMessage varchar(500)

BEGIN TRY  
	BEGIN TRANSACTION
		insert into clientes (nombre) values ('jorge');
		--insert into clientes (nombre) values ('salvador');
		select 0/0;
		--insert into errores(id) values (1);
		select @result=1;
	commit transaction;
END TRY  
BEGIN CATCH  
	rollback transaction;
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
							case when ERROR_NUMBER()=544 then 'No se pudo generar el correlativo' else 
							case when ERROR_NUMBER()=8134 then 'División entre zero no  permitida' else 
							'Error en la operacion' end end end;
END CATCH;  

select @result result,@errorMessage errorMessage;
 
select * from errores