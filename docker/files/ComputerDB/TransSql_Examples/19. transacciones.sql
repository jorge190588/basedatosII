--http://www.devjoker.com/contenidos/articulos/292/Transacciones-en-Transact-SQL.aspx
--https://www.campusmvp.es/recursos/post/Fundamentos-de-SQL-Transacciones.aspx
use ComputerDB

update Productos set idBodega=1
select * from productos

-- first example
SET IMPLICIT_TRANSACTIONS ON
BEGIN TRAN 
	update Productos set idBodega=2 where id=1;
    ROLLBACK TRAN      
--COMMIT TRAN

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


 