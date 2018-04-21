/* Create a table type. */  
CREATE TYPE tabla_temporal_utilidad AS TABLE   
(nombre_marca varchar(50) 
,año int  
, utilidad bigINT );  
GO  



	/* Create a procedure to receive data for the table-valued parameter. */  
create procedure utilidadTVP  
    @TVP tabla_temporal_utilidad READONLY ,
	@monto_menor  int ,
	@monto_maximo int
    AS   
				--variable del cursor.
			declare @nombre_marca varchar(50), @año int ,@utilidad bigint

			-- declarar el cursor cursor1
			declare cursor_utilidad cursor for
			select * from @TVP tv where tv.utilidad between @monto_menor and @monto_maximo
			--3ro. abrir el cursor.
			open cursor_utilidad
			fetch next from cursor_utilidad
			into @nombre_marca,@año,@utilidad
			while @@fetch_status = 0
			begin
			--inicio cuerpo del cursor
				print 'NOMBRE DE LA MARCA: '+@nombre_marca+' AÑO '+convert(varchar(50),@año) + ' UTILIDAD: Q.'+convert(varchar(50),@utilidad)

			--fin cuerpo del cursor
			fetch next from cursor_utilidad
			into @nombre_marca,@año,@utilidad
			end

			--cerrar cursor
			close cursor_utilidad
			deallocate cursor_utilidad


        GO 


/* Declare a variable that references the type. */  
DECLARE @tabla_temporal_utilidadTVP AS tabla_temporal_utilidad;  

/* Add data to the table variable. */  
declare @marcas_seleccionadas varchar(50);
declare @consulta varchar(3000);
--declare @monto_minimo int;
--declare @monto_maximo int;
--set @marcas_seleccionadas = '1,2';--(una o varias marcas)
if(@marcas_seleccionadas is null)
 set @consulta= 'select m.nombreMarca, year(s.fecha) as año, sum((sa.cantidad * sa.precio)-(sa.cantidad* p.costo)) as UTILIDAD from Marca m
		inner join Productos p on
		p.idMarca = m.idMarca
		inner join SalidaDetalle sa on
		sa.idProducto = p.id
		inner join Salida s on
		s.idSalida = sa.idSalida
		group by m.nombreMarca, YEAR(s.fecha)
		order by m.nombreMarca asc, YEAR(s.fecha) desc'
else
	set @consulta =' select m.nombreMarca, year(s.fecha) as año, sum((sa.cantidad * sa.precio)-(sa.cantidad* p.costo)) as UTILIDAD from Marca m
		inner join Productos p on
		p.idMarca = m.idMarca
		inner join SalidaDetalle sa on
		sa.idProducto = p.id
		inner join Salida s on
		s.idSalida = sa.idSalida
		where m.idMarca in('+@marcas_seleccionadas+')
		group by m.nombreMarca, YEAR(s.fecha)
		order by m.nombreMarca asc, YEAR(s.fecha) desc '
INSERT INTO @tabla_temporal_utilidadTVP (nombre_marca,año,utilidad)  
--variables
	exec (@consulta);






/* Pass the table variable data to a stored procedure. */  
EXEC utilidadTVP @tabla_temporal_utilidadTVP,5308255,21073908;  
GO  