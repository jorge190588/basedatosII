use ComputerDB;
--1. crear la tabla temporal
declare @resultados table(id int, resultado int)
--2. insertar valores en la tabla
insert into @resultados values (1,1),(2,2),(3,3)
--3. seleccionar los resultados
select * from @resultados