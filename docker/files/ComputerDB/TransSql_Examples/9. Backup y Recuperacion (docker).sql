use ComputerDB

---- Copia de seguridad

-- Opción 2. contenedor de docker.
BACKUP DATABASE ComputerDB						--Se selecciona la bd a copiar
TO DISK = '/home/ComputerDB.Bak'				--seleccionamos a la carperta en donde se guardara junto con el nombre de la base de datos y la extencion .bak
   WITH FORMAT,								-- FORMAT (elimina las copias de seguridad existente y crea una nueva (con el mismo nombre) ).
      MEDIANAME = 'ComputerDB',
      NAME = 'ComputerDB';
GO

-- Verificar que el archivo fue creado en la carpeta /home de contenedor.
/*1. Acceder al contenedcor "docker exec -it  sqlserver2017 bash"
2. mostrar los archivos de la carpeta home "ls /home"
3. verificar que el archivo exista "ComputerDB.Bak"
*/

------------------------------------------------------------

----- Cerrar las conexions antes de restaurar la base de datos
DECLARE @processid INT 
SELECT  @processid = MIN(spid)
FROM    master.dbo.sysprocesses
WHERE   dbid = DB_ID(@dbname) 
WHILE @processid IS NOT NULL 
    BEGIN 
        EXEC ('KILL ' + @processid) 
        SELECT  @processid = MIN(spid)
        FROM    master.dbo.sysprocesses
        WHERE   dbid = DB_ID('ComputerDB_2') 
    END

------------- 2 REstarurar una Base de Datos 
-- Que permite cambiar la ubicacion de almacenamiento, nombre de la base de datos
-- nombre del archivo mdf y nombre del archivo log
use master;
--opcion 1. Recuperación de backup desde otra base de datos del motor de base de datos.
RESTORE DATABASE ComputerDB_backup_fromBD	-- Se elige la base de datos a restaurar
 FROM ComputerDB				-- la direccion donde se guardan los backups
 WITH RECOVERY,
 MOVE 'ComputerDB_backup_fromBD' TO '/home/ComputerDB_backup_fromBD.mdf', -- archivo con objecto (tablas, sp, funciones, otros) y datos.
 MOVE 'ComputerDB_backup_fromBD_log' TO '/home/ComputerDB_backup_fromBD_log.ldf'; -- archivo de registros (logs)
GO

--opcion 2. Recuperación de backup desde un archivo con extensión .bak
-- crear automaticamente la base de datos
RESTORE DATABASE ComputerDB_backup_fromFile			-- Se elige la base de datos a restaurar
 FROM DISK = '/home/ComputerDB.Bak'	-- la direccion donde se guardan los backups
 WITH RECOVERY,
 MOVE 'ComputerDB_backup_fromFile' TO '/home/ComputerDB_backup_fromFile.mdf',
 MOVE 'ComputerDB_backup_fromFile_log' TO '/home/ComputerDB_backup_fromFile_log.ldf';
GO

 
---------------------------------------------------------------
