use ComputerDB
------------------1  Backup de Una base de datos completa 

BACKUP DATABASE ComputerDB						--Se selecciona la bd a copiar
TO DISK = 'C:\backups\ComputerDB.Bak'				--seleccionamos a la carperta en donde se guardara junto con el nombre de la base de datos y la extencion .bak
   WITH FORMAT,								-- FORMAT (elimina las copias de seguridad existente y crea una nueva (con el mismo nombre) ).
      MEDIANAME = 'Z_SQLServerBackups',
      NAME = 'ComputerDB';
GO

------------------------------------------------------------



------------- 2 REstarurar una Base de Datos 
-- Que permite cambiar la ubicacion de almacenamiento, nombre de la base de datos
-- nombre del archivo mdf y nombre del archivo log

RESTORE DATABASE ComputerDB												-- Se elige la base de datos a restaurar
 FROM Z_SQLServerBackups											-- la direccion donde se guardan los backups
 WITH RECOVERY,
 MOVE 'Z_SQLServerBackups' TO 'C:\backups\ComputerDB.mdf',
 MOVE 'Z_SQLServerBackups_Log' TO 'C:\backups\ComputerDB.ldf';
GO

---------------------------------------------------------------
