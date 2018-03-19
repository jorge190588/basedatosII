-- exec nombre 25,500000000

alter PROCEDURE  [dbo].[nombre]	
	@min int, @max int,@marcas marcaParametro READONLY  
AS
BEGIN

	select *
	from (
		select case 
			 when year(s.fecha) is null  then 0
			 when year(s.fecha) is not null then convert(varchar(4), year(s.fecha))
			end 
			   as Año,
			   m.nombreMarca as Marca,
			   isnull(sum((sd.cantidad * sd.precio) - (sd.cantidad*sd.costo)), 0) as Utilidad_Bruta
		from Marca m
		left join Productos p on p.idMarca = m.idMarca
		left join SalidaDetalle sd on sd.idProducto = p.id 
		left join Salida s on s.idSalida = sd.idSalida
		inner join @marcas m2 on m.idMarca=m2.codigo
		group by m.nombreMarca, year(s.fecha)
		having  isnull(sum((sd.cantidad * sd.precio) - (sd.cantidad*sd.costo)), 0) between @min and @max 
	
		) sb
	order by sb.Año desc, sb.Marca
END
GO

/*

declare @marcas marcaParametro
insert into @marcas (codigo)values (1),(2)
exec  [dbo].[nombre]  0,50000, @marcas 

*/
