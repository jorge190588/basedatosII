use ComputerDB

select * from Productos
--conteo de datos
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

-- Ordenamiento
select * from Productos 
order by precio ASC;

select * from Productos 
order by precio DESC;

-- promedio
select avg(existencia) PromedioExistencia from Productos;

select nombre, avg(existencia) from Productos
		group by nombre;

select precio, round(avg(existencia), 2)  from Productos
		group by precio;

-- moda
select top 1 * from Productos
order by  existencia desc;

