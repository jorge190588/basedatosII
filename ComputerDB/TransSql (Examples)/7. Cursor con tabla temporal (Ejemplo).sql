use BDII
--Tabla 
declare @resultados table(id int, resultado int)
--insert into @resultados (id,resultado) values ('1','100')
--select * from @resultados

--AGREGAR COLUMNA recuntoVenta a la tabla de clientes
--alter table cliente add recuentoVenta int 
--update cliente set recuentoVenta=0

--0ro. declarar variable del cursor.
declare @id int, @nombre varchar(50), @recuentoVenta int

--1ro. declarar el cursor curEntrega.
declare curEjemplo cursor for
--2do. seleccionar los datos base, ya estan agrupados los datos.
select id,nombre from cliente

--3ro. abrir el cursor.
open curEjemplo
fetch next from curEjemplo
into @id,@nombre
while @@fetch_status = 0
begin
--inicio cuerpo del cursor
	select @recuentoVenta = count(*) from VENTAS v, VENTASDETALLE d
	where v.id=d.id and v.id=@id 
	
	insert into @resultados (id, resultado) values (@id,@recuentoVenta)
	--update cliente set recuentoVenta=@recuentoVenta where id=@id
	print 'ventas Promedio '+convert(varchar(50),@recuentoVenta)+' id = '+convert(varchar(50),@id)

--fin cuerpo del cursor
fetch next from curEjemplo
into @id,@nombre
end

--cerrar cursor
close curEjemplo
deallocate curEjemplo

select * from @resultados
