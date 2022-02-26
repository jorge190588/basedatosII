USE ComputerDB
GO  

/*Crear tipos de datos a partir de tipos de datos primitivos*

CREATE TYPE [dbo].[numeroEntero] FROM [int] NOT NULL
CREATE TYPE [dbo].[decimal9_5] FROM [decimal](9,5) NOT NULL

declare @numero numeroEntero, @precio decimal9_5
set @precio=10.335545 -- 10.33555
select @precio

-- Capacidad de un decimal (38 enteros,38 decimales)
-- 99999999999999999999999999999999999999.99999999999999999999999999999999999999

/* CREAR UN TIPO DE DATO TVP table value parameter*/  

-- Paso 1. Crear la estructura del tipo de dato
CREATE TYPE tabletvp AS TABLE   
(idcliente int,idproducto int);  
GO  

-- Paso 2. Create a procedure to receive data for the table-valued parameter. */  
CREATE PROCEDURE dbo.insertarVenta
    @TVP tabletvp READONLY  
    AS   
    SET NOCOUNT ON  
begin
    select * from salida s, salidadetalle d,@TVP p
	where s.idsalida=d.idsalida
	and p.idcliente=s.idCliente and d.idproducto=p.idproducto

end
  

--Paso 3. crear una variabel con el tipo de datos tvp e insertar datos.
declare @filtros tabletvp
insert into @filtros (idcliente,idproducto)values (1,1),(1,2)
exec dbo.insertarVenta @filtros
  
