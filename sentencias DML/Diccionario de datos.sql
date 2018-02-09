use ComputerDB

--________Diccionario de datos de una base de datos en Sql server___________

--Un diccionario de datos es un conjunto de metadatos que contiene las
--características lógicas y puntuales de los datos que se van a utilizar 
--en el sistema que se programa, incluyendo nombre, descripción, alias, contenido
-- y organización.














select 
	d.object_id,
	a.name [table], -- identificara la Tabla
	b.name [column], -- identificara la columna
	c.name [type], -- identificara el Tipo
	CASE-- recibe el tipo de columna
	  --cuando c es   numerico  o   c es     decimal   o  c es      Float   entonces se precisa el numero
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
		ELSE null
	END [Precision], 
--  recibe maximo tamaño de b
	b.max_length, 
	CASE -- recibe si la columna acepta nulos
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE -- recibe si la columna es identity (autoincrementable)
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	ep.value [Descripcion],-- recibe la descripcion de la columna(si la hay)
	f.ForeignKey, -- recibe si es llave foranea
	f.ReferenceTableName, -- recibe la referencia de la tabla
	f.ReferenceColumnName -- recibe la referencia de la columna
from sys.tables a   
      --          //    Seleciona y muestra toda la informacion   \\          --
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
link del video 
https://www.youtube.com/watch?v=KrX724peCfc&feature=youtu.be