-- Referencia: https://www.techonthenet.com/sql_server/grant_revoke.php
--EJEMPLO
--Crear usuario de sesión
CREATE LOGIN usr0320 with password = 'Usr0320#';
-- Crear usuario de base de datos
CREATE USER usr0320 for login usr0320
-- Agregar permiso ANSI-92
grant all to usr0320


-- permiso de select para tabla de productos
grant insert productos to usr0320
-- remover permiso de select para tabla de productos
revoke select on productos to usr0320

-- Permisos a todas las tablas y todas las sentencias DML
grant insert to usr0320
grant delete to usr0320
grant select to usr0320
grant update to usr0320
-- en una sola linea
grant insert,delete, update, select to usr0320

revoke insert,delete, update, select to usr0320
