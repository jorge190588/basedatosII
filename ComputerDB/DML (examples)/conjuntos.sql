---Eloina Carrillo
---Brenda de León
use ComputerDB

----tablas a utilizar para el join, right join, left join, all join 
select * from Productos
select * from bodega


select Productos.idProductos as id,  Productos.nombre as nombre
from Productos

select bodega.idBodega, bodega.nombreBodega
from bodega

----join-----
select bodega.nombreBodega as bodega, Productos.nombre as nombre
from Productos	right join bodega on Productos.idBodega=bodega.idBodega
group by bodega.nombreBodega, Productos.nombre

---cross join----
select * from Productos cross join bodega

---tablas a utilizar para intersect, except 
select * from Clientes
select * from Proveedor

--- busqueda de datos iguales para realizar una intersección-----
Select * from  Clientes where nombreCliente  like 'A%'
Select * from  Proveedor where nombreProveedor  like 'A%'

------ingreso de datos para la intersección 
insert into Proveedor(nombreProveedor,nit, direccion, idMunicipio,telefono)
values	('Akasio Martinez','5643243-7','Hacienda San Joaquín Zona 4',30,54563321),
		('Agustin Herrera','456754-1','8ra avenida calle 5-05 Zona 3',6,46563452),
		('Cesar Cancinos','543667-7','9na avenida Zona 4',2,58646984),
		('Cecilia Leal','12345-7','Llanos del Pinal',5,54563321)


---- uso de except----
select nombreCliente,nit, direccion, idMunicipio,telefono 
from Clientes
except
select nombreProveedor,nit, direccion, idMunicipio,telefono 
from Proveedor

----- uso de intersect-----
select nombreCliente,telefono 
from Clientes
intersect 
select nombreProveedor,telefono 
from Proveedor

----uso de union----
select nombreCliente, direccion,telefono 
from Clientes
union
select nombreProveedor, direccion,telefono 
from Proveedor

------uso de union all-------
select nombreCliente, direccion,telefono 
from Clientes
union all
select nombreProveedor, direccion,telefono 
from Proveedor
