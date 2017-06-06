use ComputerDB
-- =============================================
-- Author:		Eduardo Barrios
-- Create date: 06/04/2017
-- Description:	Create Store Procedure
-- =============================================


-- PROCEDIMIENTO ALMACENADO PARA INSERTAR SALIDAS DE MANERA MASIVA
go
create procedure sp_InsertarSalidaMasivo 
	@contador int
	as
begin
	---- Creacion de la variables para definir un rango en base a los ids existentes de clientes
	declare @Random int;
	declare @maximo int;
	declare @minimo int;

	SET @minimo = 1
	SET @maximo = 15 
	SELECT @Random = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)
	declare @fecha datetime
	select @fecha=dbo.getRandomDate('01/01/2013','10/04/2017')

	insert into dbo.Salida(fecha,documento,idCliente)
	values(@fecha,@contador,@Random)
end
-- FIN DEL PROCEDIMIENTO ALMACENADO PARA INSERTAR SALIDAS DE MANERA MASIVA
go

-- borrar el sp en caso de ser necesario
-- drop proc sp_InsertarSalidaMasivo




-- PROCEDIMIENTO ALMACENADO PARA INSERTAR SALIDADETALLE DE MANERA MASIVA
create procedure sp_InsertarSalidaDetalleMasivo
	@idSalida int
as
begin
	declare @ProductoAzar int;
	declare @maximo int;
	declare @minimo int;

	set @minimo = 1    -- solo tengo 7 productos por eso es el maximo 7
	set @maximo = 7 
	select @ProductoAzar = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)

	declare @CantidadAzar int;
	declare @CantidadMaxima int;
	declare @CantidadMinima int;

	set @CantidadMinima = 1  -- quiero que solo se venda de 1 a 5 productos
	set @CantidadMaxima = 5
	select @CantidadAzar = ROUND(((@CantidadMaxima - @CantidadMinima -1) * RAND() + @CantidadMinima), 0)

	declare @Precio float;
	select @Precio = precio from Productos where id = @ProductoAzar

	insert into SalidaDetalle(idSalida,idProducto,cantidad,precio,costoTotal)
	values(@idSalida,@ProductoAzar,@CantidadAzar,@Precio,(@CantidadAzar*@Precio))
end
go

---------------------------------------------------------------------------------------------



-- PROCEDIMIENTO ALMACENADO PARA INSERTAR A LA TABLA ENTRADA DE MANERA MASIVA
create procedure sp_InsertarEntradaMasivo 
	@fecha date,
	@contador int
	as
begin
	---- Creacion de la variables para definir un rango en base a los ids existentes de proveedores
	declare @Random int;
	declare @maximo int;
	declare @minimo int;

	SET @minimo = 1
	SET @maximo = 15 
	SELECT @Random = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)
	--SELECT @Random as [Aleatorio]	

	insert into dbo.Entrada(fecha,documento,idProveedor)
	values(@fecha,@contador,@Random)
end
-- FIN DEL PROCEDIMIENTO ALMACENADO PARA INSERTAR ENTRADAS DE MANERA MASIVA
go
-- borrar el sp en caso de ser necesario
--drop proc sp_InsertarEntradaMasivo



------------------------------------------------------------------------------------------------


-- PROCEDIMIENTO ALMACENADO PARA INSERTAR ENTRADADETALLE DE MANERA MASIVA
create procedure sp_InsertarEntradaDetalleMasivo
	@idEntrada int
as
begin
	declare @ProductoAzar int;
	declare @maximo int;
	declare @minimo int;

	set @minimo = 1    -- solo tengo 7 productos por eso es el maximo 7
	set @maximo = 7 
	select @ProductoAzar = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)

	declare @CantidadAzar int;
	declare @CantidadMaxima int;
	declare @CantidadMinima int;

	set @CantidadMinima = 1  -- quiero que solo se venda de 1 a 5 productos
	set @CantidadMaxima = 5
	select @CantidadAzar = ROUND(((@CantidadMaxima - @CantidadMinima -1) * RAND() + @CantidadMinima), 0)

	declare @Precio float;
	select @Precio = precio from Productos where id = @ProductoAzar

	insert into EntradaDetalle(idEntrada,idProducto,cantidad,precio,costoTotal)
	values(@idEntrada,@ProductoAzar,@CantidadAzar,@Precio,(@CantidadAzar*@Precio))
end
go
--------------------------------------------------------------------------------------------------