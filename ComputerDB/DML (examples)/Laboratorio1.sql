EJERCICIO 2 DAVID FERNANDEZ
select 
	id codigo,
	nombre,
	p.precio,
	costo,
	existencia,
	m.nombreMarca, 
	count(sd.cantidad) as [recuento de ventas] 
	from 
	Productos p
	inner join Marca m on p.idMarca = m.idMarca
	left join SalidaDetalle sd on p.id=sd.idProducto where p.idMarca=m.idMarca
	group by id, nombre,p.precio,costo,existencia,m.nombreMarca
	order by nombre , nombreMarca asc


/*
--ESCENARIO 3
--3.	Scenario: Reporte de ventas (Allan y David)
--a.	Given: el dueÃ±o de un negocio requiere informaciÃ³n de las ventas
--b.	When: requiera la informaciÃ³n
--c.	Then: deberÃ­a mostrar la fecha, nit, cliente, total de venta, numero de productos vendidos y fecha de ultima venta del Ãºltimo trimestre por cliente
--d.	And: debe estar ordenado por AÃ±o, mes y dÃ­a.
*/
select s.fecha, s.documento, nit, nombreCliente Cliente, costoTotal Total_Venta,cantidad NumProdVendidos, max(s.fecha) from salida s
inner join Clientes c on c.idCliente = s.idCliente
inner join SalidaDetalle sd on sd.idSalida = s.idSalida
group by s.fecha, s.documento, nit, nombreCliente, costoTotal,cantidad
order by s.fecha asc

/*
--escenario 4
--4.	Scenario: Reporte detallado de utilidad por productos (David Vazquez)
--a.	Given: el dueÃ±o de un negocio requiere conocer la utilidad bruta. 
--b.	When: requiera la informaciÃ³n
--c.	Then: deberÃ­a mostrar el nombre del producto, utilidad bruta.
--d.	And: debe estar ordenado por nombre de producto.
*/
select p.nombre, sum((sd.cantidad * p.precio)-(sd.cantidad * p.costo)) Utilidad_Bruta from Productos p
inner join SalidaDetalle sd on sd.idProducto = p.id
group by p.nombre
order by p.nombre asc


/*
5.  Scenario: Reporte detallado de utilidad por marca (Eloina Carrillo)
Given: el dueño de un negocio requiere conocer la utilidad bruta  por marca
When: requiera la información
Then: debería mostrar el año, el nombre la marca, utilidad bruta.
And: debe estar ordenado por año en forma descendente y por nombre de marca en forma ascendente.
And: debe estar agrupado por año y nombre de marca.
*/
select year(s.fecha) as Año,
       m.nombreMarca as Marca,
       sum(isnull(costoTotal, 0) - isnull(cantidad, 0) * p.costo) as Utilidad_Bruta
from Marca m
inner join Productos p on p.idMarca = m.idMarca
left join SalidaDetalle sd on sd.idProducto = p.id 
inner join Salida s on s.idSalida = sd.idSalida
group by m.nombreMarca, year(s.fecha)
order by year(s.fecha) desc, Marca asc


/*6.Scenario: Frecuencia de ventas por cliente. (Guillermo Pisqui)
a.	Given: el dueño de un negocio requiere la frecuencia de ventas por cliente
b.	When: requiera la información
c.	Then: debe mostrar el nombre del cliente y la frecuencia de ventas según la fecha.
d.	And: debe estar ordenado por la frecuencia de menor a mayor.
*/
--MUESTRA LA FRECUENCIA DE COMPRA POR CADA CLIENTE, segun una fecha determinada
use ComputerDB
select c.idCliente, c.nombreCliente, COUNT(s.idSalida)as frecuencia from clientes c
inner join Salida s on s.idCliente = c.idCliente where s.fecha ='2013-02-12'
group by c.nombreCliente,c.idCliente
order by frecuencia asc



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




/*
9.  Scenario: Reporte de utilidad bruta (Daniel Estupe)
Given: el dueño de un negocio requiere información de las ventas
When: requiera la información
Then: debería mostrar el año, mes, ingresos, egresos y utilidad bruta 
And: debe estar ordenado por año y mes
And: debe ser posible filtrar por ninguno o varios años y por ninguno o varios meses
*/

use ComputerDB;
declare @consulta varchar(max)
declare @anhos varchar(50)
declare @meses varchar(50)

select @anhos = '2016,2017'
select @meses = '2'

set @consulta = 'select year(fecha) as Año,
					   datename(month, fecha) as Mes,
					   sum(sd.costoTotal) as Ingresos,
					   sum(sd.cantidad * p.costo) as Egresos,
					   sum(costoTotal - cantidad * p.costo) as Utilidad_Bruta
				from Salida s
				inner join SalidaDetalle sd on sd.idSalida = s.idSalida
				inner join Productos p on p.id = sd.idProducto
				where (len('''+ @anhos + ''') > 0) 
				and (len(''' + @meses + ''') > 0)
				and (year(fecha) in (' + @anhos + ')) 
				and month(fecha) in (' + @meses + ')
				group by year(fecha), datename(month, fecha), month(fecha)
				order by Año desc, month(fecha) asc'
print(@consulta)
exec(@consulta)






-----------------------------------------------------------------------------
no.#8

select *from salida              select fecha from salida
select *from SalidaDetalle
select *from Departamento
select *from Municipio
select *from Productos

select cantidad from salidadetalle
 select  sum (cantidad) from salidadetalle 
 select sum (existencia) from Productos

select d.nombredepartamento as [nombre] , m.nombremunicipio, salida.idproducto, salida.cantidad , salida.costototal, sa.fecha
  
from Departamento d inner join Municipio m
on d.idDepartamento = m.idMunicipio 
inner join SalidaDetalle salida
on d.idDepartamento = salida.idSalidaDetalle
inner join salida sa
on d.iddepartamento = sa.idsalida

go

-----------------------------------------------------------------------------------
select fecha from Salida
min (fecha) as fechaminima, max (fecha) as fechamaxima
------------------------------------------------------------------------------------



/*
11.	Scenario: Reporte de proveedores (Francisco Ramirez)

a.	Given: El dueño del negocio requiere conocer a sus proveedores
b.	When: requiera la información
c.	Then: un reporte debería mostrar el nombre del proveedor, dirección, teléfono, nit, fecha de primera compra, fecha de última compra, frecuencia de compra promedio 
d.	And: debe estar ordenado por nombre
e.	And: debe estar filtrado por uno o varios meses y uno o varios años
*/
declare @consulta varchar(max)
declare @años varchar(40)
declare @meses varchar(40)

select @años = '2013, 2017'
select @meses = '2, 3'

set @consulta = 'select pr.idProveedor, pr.nombreProveedor, pr.direccion, pr.telefono, pr.nit,
			(select min(entrada.fecha) from entrada)primera_compra, 
				(select max(entrada.fecha) from Entrada )ultima_compra, count(en.idEntrada)promedio, en.fecha
													            from proveedor pr

				inner join Entrada en on en.idProveedor = pr.idProveedor
		where	(len('''+ @años + ''') > 0) 
				and (len(''' + @meses + ''') > 0)
				and (year(fecha) in (' + @años + ')) 
				and month(fecha) in (' + @meses + ')

 -- where (month(en.fecha)=3) and (year(en.fecha) = 2017)

			group by pr.idProveedor, pr.nombreProveedor, pr.direccion, pr.telefono, pr.nit, en.fecha
			order by pr.nombreProveedor asc '

 exec(@consulta)


# 2 david fernandez
--2.REPORTE DE ARTICULOS

 use ComputerDB
select 
	id codigo,
	nombre,
	p.precio,
	costo,
	existencia,
	m.nombreMarca, 
	count(sd.cantidad) as [recuento de ventas] 
from  
	productos p, marca m, SalidaDetalle sd
where p.idMarca in (select idMarca from Marca where p.idMarca=m.idMarca) and
	sd.idProducto in (select idProducto from SalidaDetalle where p.id=sd.idProducto)
group by id, nombre,costo, existencia, p.precio, m.nombreMarca
order by nombre, nombreMarca asc






