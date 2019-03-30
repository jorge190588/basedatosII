use ComputerDB
--1. VARIABLES
--1.1 declarar las variables del origen (tabla, subconsulta, valores)
declare @id int, @nombre varchar(50)
--1.2 Otras variables
declare @recuentoVenta int,@totalVentas decimal(18,2)

--2. DECLARAR CURSOR
declare curEjemplo cursor for
--3. ORIGEN
select top 3 idcliente id, nombreCliente nombre from clientes
--4. ABRIR CURSOR Y RECORRER
open curEjemplo
fetch next from curEjemplo
into @id,@nombre
while @@fetch_status = 0
begin
--5. INICIO CUERPO
	SELECT @ID ID, @NOMBRE NOMBRE
--6. FIN DEL CUERPO
fetch next from curEjemplo
into @id,@nombre
end
--7. CERRAR CURSOR
close curEjemplo
deallocate curEjemplo