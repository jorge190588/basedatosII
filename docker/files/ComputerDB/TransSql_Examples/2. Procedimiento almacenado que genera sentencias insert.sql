SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Salvador Santos Neill
-- Create date: 14 de septiembre 2018
-- Description:	Es un procedimiento almacenado que recibe como parametro
-- el nombre de una tabla y retorna sentencias insert por cada registro.
-- =============================================
CREATE PROCEDURE dbo.crearSentenciaInsert
	@tabla varchar(50)
AS
BEGIN
	 
	--0ro. declarar variable del cursor.
	declare  @COLUMN_NAME VARCHAR(100), @DATA_TYPE VARCHAR(50),
			 @contador int, @query varchar(1000), 
			 @columnas varchar(300)

	select  @query='',@CONTADOR=0,@columnas=''

	  
	--1ro. declarar el cursor curEntrega.
	declare curEjemplo cursor for

	--2do. seleccionar los datos base, ya estan agrupados los datos.
	SELECT   COLUMN_NAME,DATA_TYPE 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @tabla 
	AND TABLE_SCHEMA='dbo' and COLUMN_NAME<>'id'


	--3ro. abrir el cursor.
	open curEjemplo
	fetch next from curEjemplo
	into @COLUMN_NAME,@DATA_TYPE 
	while @@fetch_status = 0
	begin
	--inicio cuerpo del cursor
		select @contador=@contador+1
		if (@contador=1) begin 
			select @query=+  '''''''+convert(varchar(1000),' +@column_name+')+'''''''
			select @columnas=@column_name
		end else begin 
			--print @query
			select @query= @query+ ',''''''+convert(varchar(1000),' +@column_name+')+'''''''
			select @columnas=@columnas+','+@column_name
		end
	 
	--fin cuerpo del cursor
	fetch next from curEjemplo
	into @COLUMN_NAME,@DATA_TYPE 
	end

	--cerrar cursor
	close curEjemplo
	deallocate curEjemplo

	select @query='select ''insert into roles ('+@columnas+') values ('+@query+')'' from '+@TABLA
	print @query
	exec(@query)
 

   
END
GO
