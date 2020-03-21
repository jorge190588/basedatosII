/*Senario: Reporte detallado de utilidad por marca (2 puntos) 
Given: el dueño de un negocio requiere conocer la utilidad bruta  por marca 
When: seleccione una, varias o todas las marcas
And: especifique un monto mínimo y máximo para la utilidad o no sea especificado 
Then: debería mostrar el año, el nombre la marca, utilidad bruta. 
And: debe estar ordenado por año en forma descendente y por nombre de marca en forma ascendente. 
And: debe estar agrupado por año y nombre de marca. */

select * from salida
select * from SalidaDetalle
select * from Productos
select * from Marca

/*Paso 1.
 Diagrama ER (salida -> salidaDetalle -> productos -> marcas)
*/

select * 
from salida s, SalidaDetalle sd, productos p, marca m
where	s.idSalida= sd.idsalida 
		and sd.idProducto= p.id 
		and p.idMarca= m.idmarca

/*Paso 2. seleccionar los campos a usar*/

select	year(s.fecha) [Año], m.nombreMarca marca, 
		sum((sd.precio-sd.costo)*sd.cantidad) utilidadBruta
from salida s, SalidaDetalle sd, productos p, marca m
where	s.idSalida= sd.idsalida 
		and sd.idProducto= p.id 
		and p.idMarca= m.idmarca
group by year(s.fecha), m.nombreMarca
order by year(s.fecha) desc, m.nombreMarca asc

/*Paso 3. Aplicar los filtros*/
declare @filtroMarcas table(codigo int)
--insert into @filtroMarcas (codigo) values(8); //filtro de marca 8
--select * from @filtroMarcas

-- columnas
select	year(s.fecha) [Año], m.nombreMarca marca, 
		sum((sd.precio-sd.costo)*sd.cantidad) utilidadBruta
-- tablas
from salida s, SalidaDetalle sd, productos p, marca m
-- union de tablas
where	s.idSalida= sd.idsalida 
		and sd.idProducto= p.id 
		and p.idMarca= m.idmarca
-- filtros
		and (	(select count(codigo) from @filtroMarcas)=0 
				or ((select count(codigo) from @filtroMarcas)>0 
					and (m.idMarca in (select codigo from @filtroMarcas))
					)
			)
-- grupos y ordenamiento
group by year(s.fecha), m.nombreMarca
order by year(s.fecha) desc, m.nombreMarca asc



-- Consultas de soporte.
select * from salida
select * from salidaDetalle
select count(idsalida) from salida
select count(idsalidaDetalle) from SalidaDetalle
delete from SalidaDetalle
delete from salida
DBCC CHECKIDENT ('SalidaDetalle', RESEED,0)
DBCC CHECKIDENT ('salida', RESEED, 0)

