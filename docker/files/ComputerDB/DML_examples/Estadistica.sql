use ComputerDB


-- SELECCION DE DATOS

select nombre, descripcion, precio, existencia from Productos


select distinct nombreCliente, nit from Clientes c
inner join Salida s on s.idCliente = c.idCliente


select nombreCliente as Cliente, nit, d.nombreDepartamento, m.nombreMunicipio, direccion, f.nombre from Clientes c
inner join FormaDePago f on f.idFormaPago = c.idFormaPago
inner join Municipio m on m.idMunicipio = c.idMunicipio 
inner join Departamento d on d.idDepartamento = m.idDepartamento
where c.idFormaPago = 1


-- USO DE PREDICADOS 

-- BETWEEN
select nombre, descripcion, precio from Productos
where precio 
between 1000 AND 2000


-- IN
select nombreCliente, nit, f.nombre as Forma_de_Pago from Clientes c
inner join FormaDePago f on f.idFormaPago = c.idFormaPago
where c.idFormaPago in (1, 4)


-- LIKE 
select nombreCliente, nit  from Clientes
where nombreCliente
LIKE 'A%'


-- ORDEN DE DATOS

select nombreCliente, nit from Clientes
order by nombreCliente asc

-- FUNCIONES DE AGRUPACION
select count(*) as RegistroProductos from Productos

select sum(existencia) as ExistenciaTotalProductos from Productos

-- Frecuencias
select distinct nombre, count(nombre) Frecuencia from Productos
				group by nombre;

select nombre, sum(existencia) F from Productos
		group by nombre;

-- Cantidad de articulos segun el precio
select  precio, count(*) F from Productos
       group by precio;

-- promedio
select avg(existencia) PromedioExistencia from Productos;

select nombre, avg(existencia) from Productos
		group by nombre;

select precio, round(avg(existencia), 2)  from Productos
		group by precio;

-- moda
select top 1 * from Productos
order by  existencia desc;


-- AGRUPACION DE FILAS 

select nombreCliente as Cliente, nit, count(nombreCliente) as No_Compras from Clientes c
inner join Salida s on s.idCliente = c.idCliente
group by nombreCliente, nit
having count(nombreCliente) > 100 
order by nombreCliente asc
