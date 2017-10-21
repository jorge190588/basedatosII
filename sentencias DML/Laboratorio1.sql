/*
1.	Scenario: Reporte de clientes
Given: El dueño del negocio requiere conocer a sus clientes
When: requiera la información
Then: un reporte debería mostrar el nombre, dirección, teléfono y nit
And: debe estar ordenado por nombre 
And: debe estar filtrado por las ventas del primer semestre de cada año.
And: debe estar filtrado por el día lunes de las ventas.
*/

select nombreCliente nombre, direccion,telefono,nit,
s.fecha,datename(dw,s.fecha) nombreDia,day(s.fecha) dia, 
datepart(qq,s.fecha) trimestre, datename(mm,s.fecha) nombreMes
from Clientes c
inner join Salida s on s.idCliente=c.idCliente
--where month(s.fecha) in (1,2,3,4,5,6) 
where datepart(qq,s.fecha) in (1,2)
and datename(dw,s.fecha)='Lunes'
order by nombreCliente

/*
2.	Scenario: Reporte de artículos
Given: El dueño del negocio requiere un listado de productos
When: requiera la información
Then: debería mostrar el código, nombre, precio, costo, existencia, marca, total en ventas, total en costos y total en utilidad 
And: debe estar ordenado por marca y nombre de artículo
*/

select  codigo,nombre,d.precio,d.cantidad, d.costoTotal costo, existencia, m.nombreMarca marca,
d.cantidad*d.precio totalVenta, d.costoTotal*d.cantidad totalCosto,
(d.precio-d.costoTotal)*d.cantidad totalUtilidad
from Productos p
inner join marca m on p.idmarca=m.idmarca
inner join SalidaDetalle d on p.id=d.idproducto
order by m.nombreMarca,p.nombre

select p.codigo,p.nombre,p.descripcion,
avg(d.cantidad) cantidadPromedio,
sum(d.cantidad) cantidadSuma,
min(d.cantidad) cantidadMinima,
max(d.cantidad) cantidadMaximo,
sum(d.cantidad*d.precio) totalVenta, sum(d.costoTotal*d.cantidad) totalCosto,
sum((d.precio-d.costoTotal)*d.cantidad) totalUtilidad
from Productos p
inner join SalidaDetalle d on p.id=d.idproducto
group by  p.codigo,p.nombre,p.descripcion

update SalidaDetalle set costoTotal=(precio*0.6)


select p.codigo,p.nombre,s.fecha,
sum((d.precio-d.costoTotal)*d.cantidad) totalUtilidad
from Productos p
inner join SalidaDetalle d on p.id=d.idproducto
inner join Salida as s on d.idsalida=s.idsalida
where s.fecha between dateadd(MONTH,-7,getdate()) and GETDATE()
group by  p.codigo,p.nombre,s.fecha
order by p.nombre


select fecha from salida
order by fecha desc



