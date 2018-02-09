select * from clientes
use ComputerDB



--Creacion de usuarios / Presentacion 6 Tema: Seguridad BDD -- Seguridad Sql
--la creacion de usuarios se debe hacer en la base de datos master.

--EN SLQ SERVER SE DEBE CREAR UN INICIO DE SESION Y LUEGO UN USUARIO
--un Inicio de Sesión (Login) se define a nivel de Instancia mientras que un Usuario se define a nivel de Base de Datos.
--CONSULTAR EL SIGUIENTE LINK PARA ACLARAR DUDAS
--http://www.guillesql.es/Articulos/SQLServerFAQ_Inicio_Sesion_Usuario.aspx

--CREACION DE UN INICIO DE CESION:
CREATE LOGIN pruebabd with password = 'miumg123';

--para listar todos los logins que existan en la bd
SELECT * FROM sys.sql_logins

--para borrar el login creado con anterioridad
drop login pruebabd


--ASIGNACIÓN DE UN USUARIO A UN TABLESPACE ( DEFAULT TABLESPACE )
CREATE USER bdpr for login pruebabd with default_schema = ComputerDB

--para listar todos los usuarios que existan en la bd
select * from sys.sysusers

--para borrar un usuario creado con anterioridad
drop user bdpr

--se le da todos los privilegios a usuario bdpr sobre la tabla clientes
grant all on clientes to bdpr

--se le da solo privilegios de seleccion (consulta)/insercion al usuario creado con anticipacion
grant select on clientes to bdpr
grant insert on clientes to bdpr

--si se le quisiera agregar mas de un permiso.
grant select,insert on clientes to bdpr

--para quitar privilegios a una tabla se utiliza revoke, se muestra como quitar los permisos asignados
--con anterioridad
revoke select on clientes from bdpr
revoke insert on clientes from bdpr
