use ComputerDB;
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
	declare @minimo int;
	declare @maximo int;
	
	SET @minimo = 1
	select @maximo=max(idcliente)  from Clientes
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
	select @maximo = max(id) from Productos
	select @ProductoAzar = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)

	declare @CantidadAzar int;
	declare @CantidadMaxima int;
	declare @CantidadMinima int;

	set @CantidadMinima = 1  -- quiero que solo se venda de 1 a 5 productos
	set @CantidadMaxima = 10
	select @CantidadAzar = ROUND(((@CantidadMaxima - @CantidadMinima -1) * RAND() + @CantidadMinima), 0)

	declare @Precio float;
	declare @Costo float;

	select @Precio = precio from Productos where id = @ProductoAzar
	select @Costo = costo from Productos where id = @ProductoAzar
	

	insert into SalidaDetalle(idSalida,idProducto,cantidad,precio,costo)
	values(@idSalida,@ProductoAzar,@CantidadAzar,@Precio,@costo)
end
go

---------------------------------------------------------------------------------------------



-- PROCEDIMIENTO ALMACENADO PARA INSERTAR A LA TABLA ENTRADA DE MANERA MASIVA
create procedure sp_InsertarEntradaMasivo 
	--@fecha date,
	@contador int
	as
begin
	---- Creacion de la variables para definir un rango en base a los ids existentes de proveedores
	declare @Random int;
	declare @maximo int;
	declare @minimo int;
	
	SET @minimo = 1
	SET @maximo = 31 
	SELECT @Random = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)
	declare @fecha datetime 
	SELECT @fecha = dbo.getRandomDate('01/01/2013','22/02/2018')

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

--procedimiento de ventas
CREATE PROCEDURE SP_venta
AS
BEGIN
select year(s.fecha) año,month(s.fecha) mes,d.nombreDepartamento departamento, m.nombreMunicipio municipio,
c.nombreCliente cliente,p.nombre producto, count(sd.idProducto)as recuento_producto,
sum(sd.cantidad * sd.costo)as total_costo,
sum(sd.cantidad * sd.precio) as total_venta,
sum((sd.cantidad * sd.precio)-(sd.cantidad * sd.costo)) as utilidad_total
 from Salida s, SalidaDetalle sd, clientes c, Municipio m, Departamento d, productos p 
where s.idSalida=sd.idSalida and c.idCliente=s.idCliente
and c.idMunicipio=m.idMunicipio and m.idDepartamento=d.idDepartamento
and p.id= sd.idproducto
group by year(s.fecha),month(s.fecha),c.nombreCliente, P.nombre, m.nombreMunicipio, d.nombreDepartamento
END;
go


--procedimiento de recuento de ventas
CREATE PROCEDURE SP_RecuentoDeVentas
AS
BEGIN
SELECT t.fecha, t.Año, t.semestre, t.trimestre, t.mes, t.semana, t.dia, t.diaNombre, p.nombre,
t.mesNombre1 + t.mesNombre2 AS mesNombre, s.idSalida,
count(sd.idProducto)as recuento_producto,
sum(sd.cantidad * sd.costo)as total_costo,
sum(sd.cantidad * sd.precio) as total_venta,
sum((sd.cantidad * sd.precio)-(sd.cantidad * sd.costo)) as utilidad_total
FROM     (SELECT        fecha, YEAR(fecha) AS Año, CASE WHEN MONTH(fecha) BETWEEN 1 AND 6 THEN 1 ELSE 2 END AS semestre, DATEPART(qq, fecha) AS trimestre, 
                                                    MONTH(fecha) AS mes, DATEPART(wk, fecha) AS semana, DAY(fecha) AS dia, DATENAME(dw, fecha) AS diaNombre, CASE WHEN MONTH(fecha) 
                                                    = 1 THEN 'Enero' ELSE CASE WHEN MONTH(fecha) = 2 THEN 'Febrero' ELSE CASE WHEN MONTH(fecha) 
                                                    = 3 THEN 'Marzo' ELSE CASE WHEN MONTH(fecha) = 4 THEN 'Abril' ELSE CASE WHEN MONTH(fecha) 
                                                    = 5 THEN 'Mayo' ELSE CASE WHEN MONTH(fecha) = 6 THEN 'Junio' ELSE '' END END END END END END AS mesNombre1, CASE WHEN MONTH(fecha)
                                                     = 7 THEN 'Julio' ELSE CASE WHEN MONTH(fecha) = 8 THEN 'Agosto' ELSE CASE WHEN MONTH(fecha) 
                                                    = 9 THEN 'Septiembre' ELSE CASE WHEN MONTH(fecha) = 10 THEN 'Octubre' ELSE CASE WHEN MONTH(fecha) 
                                                    = 11 THEN 'Noviembre' ELSE CASE WHEN MONTH(fecha) = 12 THEN 'Diciembre' ELSE '' END END END END END END AS mesNombre2, idSalida
                          FROM            Salida) AS t, SalidaDetalle sd, Salida s, Productos p
						  group by t.fecha, t.Año, t.semestre, t.trimestre, t.mes, t.semana, t.dia, t.diaNombre, t.mesNombre1, t.mesNombre2, s.idSalida, p.nombre
end;
--------------------------------------------------------------------------------------------------------------
