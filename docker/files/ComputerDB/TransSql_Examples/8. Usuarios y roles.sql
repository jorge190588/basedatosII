use ComputerDB
use master

--Creacion de usuarios / Presentacion 6 Tema: Seguridad BDD -- Seguridad Sql
--la creacion de usuarios se debe hacer en la base de datos master.

--EN SLQ SERVER SE DEBE CREAR UN INICIO DE SESION Y LUEGO UN USUARIO
--un Inicio de Sesión (Login) se define a nivel de Instancia mientras que un Usuario se define a nivel de Base de Datos.
--CONSULTAR EL SIGUIENTE LINK PARA ACLARAR DUDAS
--http://www.guillesql.es/Articulos/SQLServerFAQ_Inicio_Sesion_Usuario.aspx

--CREACION DE UN INICIO DE CESION:
CREATE LOGIN pruebabd3 with password = 'miumg123';

--para listar todos los logins que existan en la bd
SELECT * FROM sys.sql_logins

--para borrar el login creado con anterioridad
drop login pruebabd

--ASIGNACIÓN DE UN USUARIO A UN TABLESPACE ( DEFAULT TABLESPACE )
CREATE USER bdpr3 for login pruebabd3 -- with default_schema = dbo

--para listar todos los usuarios que existan en la bd
select * from sys.sysusers

--para borrar un usuario creado con anterioridad
drop user bdpr

--se le da todos los privilegios a usuario bdpr sobre la tabla clientes
grant all on clientes to bdpr3

--se le da solo privilegios de seleccion (consulta)/insercion al usuario creado con anticipacion
grant select on clientes to bdpr
grant insert on clientes to bdpr

--si se le quisiera agregar mas de un permiso.
grant select,insert on clientes to bdpr3

--para quitar privilegios a una tabla se utiliza revoke, se muestra como quitar los permisos asignados
--con anterioridad
revoke select on clientes from bdpr3
revoke insert on clientes from bdpr2

select * from clientes




SELECT DISTINCT
        name AS database_name,
        session_id,
        host_name,
        login_time,
        login_name,
        reads,
        writes
FROM    sys.dm_exec_sessions
        LEFT OUTER JOIN sys.dm_tran_locks ON sys.dm_exec_sessions.session_id = sys.dm_tran_locks.request_session_id
        INNER JOIN sys.databases ON sys.dm_tran_locks.resource_database_id = sys.databases.database_id
--WHERE   --resource_type <> 'master'
-- name ='ComputerDB'
ORDER BY name


SELECT dp.type_desc, dp.SID, dp.name AS user_name  
FROM sys.database_principals AS dp  
LEFT JOIN sys.server_principals AS sp   ON dp.SID = sp.SID  
WHERE sp.SID IS NULL  
    AND authentication_type_desc = 'INSTANCE'; 