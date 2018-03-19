--CONSULTA DE TODAS LA BASES DE DATOS EXISTENTES EN FORMATO JSON
select * from master.sys.databases
order by 1
for json path, root('bases')

--ejemplos a computerDB
--CONSULTA DE TABLA CLIENTES
use ComputerDB
select * from clientes 
where idCliente = 1 for json auto

--LE INDICAMOS QUE INCLUYA ATRIBUTOS NULL
select * from Clientes
where idcliente = 1 for json auto, include_null_values

--LE INDICAMOS QUE NO AGREGUE LOS CORCHETES AL TEXTO JSON
 select * from clientes
 where idCliente =1 for json path, without_Array_wrapper

 ---------------------------------
 --FUNCIONES JSON
 ----------------------------------

 --FUNCION ISJSON: para verificar si un texto es un json

declare @json varchar(max) = 'hola, ejemplos de json'
select case when isjson(@json) > 0
	then 'json Valido' else 'json no valido' end

	--json valido

	declare @texto_json varchar(max) ='[{"idCliente":1,"nombreCliente":"Eduardo Barrios","nit":"1416539-2","direccion":"7ma calle 9-42 Zona 1","idMunicipio":50,"telefono":54441004,"idFormaPago":1}] '
	select case when ISJSON(@texto_json) > 0
	then 'json valido' else 'json invalido' end


--OPEN JSON 

--OPEN JSON. OBTENEMOS UN JSON Y LO CONVERTIMOS A UN REGISTRO DE LA TABLA PRODUCTOS

select  * from Productos where id = 1 for json auto, include_null_values --obtenemos codigo json
declare @textojson varchar(max) = --guardamos json en una variable
		'{
        "codigo":null,
        "nombre":"Monitor",
        "descripcion":"Monitor para PC",
        "precio":4.00000000000000,
        "costo":3.000000000000000,
        "existencia":15,
        "idMarca":1,
        "idDimension":3,
        "idColor":1,
        "idBodega":null
    }'
	--ingresamos un registro a la tabla productos con los datos json.
	insert into Productos
	select * from openjson(@textojson)
	with (
		codigo varchar(50),
		nombre varchar(50),	
		descripcion varchar(50),
		precio float,
		costo float,
		existencia int,
		idMarca int,
		idDimension int,
		idColor int,
		idBodega int
	)
select * from productos where precio =4 and costo = 3 -- VERIFICAMOS QUE EL REGISTRO SE HAYA AGREGADO.

--GUARDAR JSON EN UNA TABLA DE LA BASE DE DATOS
--CREAREMOS LA TABLA DIRECCIONES

drop table if exists direcciones --SI LA TABLA YA EXISTE LA ELIMINAMOS
create table direcciones (
	id int identity primary key,
	direccion_json nvarchar(max) 
)
--AHORA NOS ASEGURAMOS QUE EN EL ATRIBUTO DIRECCION_JSON SOLO INGRESEN TEXTO JSON
-- AGREGANDO UN CHECK CONSTRAINT

alter table direcciones
	add constraint [ content should be formatted as json]
	check(isjson(direccion_json)> 0)

	--agregamos un campo calculado
alter table direcciones
add direccion as json_Value(direccion_json, '$.direccion')

select * from direcciones	
	
--INGRESANDO REGISTRO EN LA TABLA DIRECCIONES
declare @maximo int
set @maximo = (select max(idCliente) from  Clientes)
declare @id_cli int  = 1
while @id_cli <=@maximo
begin
declare @direccion nvarchar(max)
set @direccion = (select nombreCliente, nit, direccion from Clientes where idCliente = @id_cli for json path, without_Array_wrapper )
insert into direcciones (direccion_json) values(@direccion)
set @id_cli=@id_cli +1
end
	
select * from direcciones

--extrayendo valores json de la tabla direcciones y lo mostramos como una tabla temporal
select 
	JSON_VALUE(direccion_json, '$.nombreCliente') as nombre,
	JSON_VALUE(direccion_json, '$.nit') as nit,
	json_value(direccion_json, '$.direccion') as direccion
from direcciones 
	