--CREACION DE UN INICIO DE SESIÓN:
CREATE LOGIN usr0320 with password = 'Usr0320#';
-- usuario de base de datos
CREATE USER usr0320 for login usr0320
-- agregar permiso
grant all to usr0320
-- permiso de select para tabla de productos
grant select on productos to usr0320
-- remover permiso de select para tabla de productos
revoke select on productos to usr0320

