# **SENTENCIAS BASICAS DML**
## **USO DE FECHAS**

#### **Funciones que obtienen valores de fecha y hora del sistema**
###### Todos los valores de fecha y hora del sistema se derivan del sistema operativo del equipo en el que se ejecuta la instancia de SQL Server.

##### EJEMPLOS:
##### **SYSDATETIME (Transact-SQL)**
SYSDATETIME y SYSUTCDATETIME tienen más precisión de fracciones de segundo que GETDATE y GETUTCDATE. SYSDATETIMEOFFSET incluye el ajuste de zona horaria del sistema. SYSDATETIME, SYSUTCDATETIME y SYSDATETIMEOFFSET pueden asignarse a una variable de cualquier tipo de fecha y hora.
* ###### **A.Obtener la fecha y hora actuales del sistema**
     ###### SELECT SYSDATETIME() 
     ###### ,SYSDATETIMEOFFSET()
     ###### ,SYSUTCDATETIME()
     ###### ,CURRENT_TIMESTAMP
     ###### ,GETDATE()
     ###### ,GETUTCDATE();
###### Que al ejecutar dichas funciones nos retornaria, por ejemplo:
   ###### SYSDATETIME()      2007-04-30 13:10:02.0474381
   ###### SYSDATETIMEOFFSET()2007-04-30 13:10:02.0474381 -07:00
   ###### SYSUTCDATETIME()   2007-04-30 20:10:02.0474381
   ###### CURRENT_TIMESTAMP  2007-04-30 13:10:02.047
   ###### GETDATE()          2007-04-30 13:10:02.047
   ###### GETUTCDATE()       2007-04-30 20:10:02.047

* ###### **B.Obtener la fecha actual del sistema**
     ###### SELECT CONVERT (date, SYSDATETIME())
     ###### ,CONVERT (date, SYSDATETIMEOFFSET())
     ###### ,CONVERT (date, SYSUTCDATETIME())
     ###### ,CONVERT (date, CURRENT_TIMESTAMP)
     ###### ,CONVERT (date, GETDATE())
     ###### ,CONVERT (date, GETUTCDATE());
###### Todo esto nos retornaria una fecha similar: 2007-04-30


#### **SYSDATETIMEOFFSET (Transact-SQL)**
Devuelve un valor datetimeoffset(7) que contiene la fecha y hora del equipo en el que se está ejecutando la instancia de SQL Server. El ajuste de zona horaria está incluido.
SQL Server obtiene los valores de fecha y hora utilizando la API de Windows GetSystemTimeAsFileTime(). La exactitud depende del hardware del equipo y de la versión de Windows en las que la instancia de SQL Server se esté ejecutando. La precisión de esta API se fija en 100 nanosegundos. La precisión se puede determinar mediante la API de Windows GetSystemTimeAdjustment().
* ###### **A.Mostrar los formatos que devuelven las funciones de fecha y hora**
En el ejemplo siguiente se muestran los distintos formatos que devuelven las funciones de fecha y hora.
  ###### SELECT SYSDATETIME() AS SYSDATETIME
  ###### ,SYSDATETIMEOFFSET() AS SYSDATETIMEOFFSET
  ###### ,SYSUTCDATETIME() AS SYSUTCDATETIME
  ###### ,CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP
  ###### ,GETDATE() AS GETDATE
  ###### ,GETUTCDATE() AS GETUTCDATE;
###### El conjunto de resultados es el siguiente.
  ###### SYSDATETIME() 2007-04-30 13:10:02.0474381
  ###### SYSDATETIMEOFFSET()2007-04-30 13:10:02.0474381 -07:00
  ###### SYSUTCDATETIME() 2007-04-30 20:10:02.0474381
  ###### CURRENT_TIMESTAMP 2007-04-30 13:10:02.047
  ###### GETDATE() 2007-04-30 13:10:02.047
  ###### GETUTCDATE() 2007-04-30 20:10:02.047

* ###### **B.Convertir valores de fecha y hora en date**
En el ejemplo siguiente se muestra cómo convertir valores de fecha y hora en date.
   ###### SELECT CONVERT (date, SYSDATETIME())
   ###### ,CONVERT (date, SYSDATETIMEOFFSET())
   ###### ,CONVERT (date, SYSUTCDATETIME())
   ###### ,CONVERT (date, CURRENT_TIMESTAMP)
   ###### ,CONVERT (date, GETDATE())
   ###### ,CONVERT (date, GETUTCDATE());
###### El conjunto de resultados es el siguiente.
  ###### 2007-04-30  
  ###### 2007-04-30  
  ###### 2007-04-30
  ###### 2007-04-30
  ###### 2007-04-30
  ###### 2007-04-30


#### **SYSUTCDATETIME (Transact-SQL)**
Devuelve un valor datetime2 que contiene la fecha y hora del equipo en el que la instancia de SQL Server se está ejecutando. La fecha y hora se devuelven como una hora universal coordinada (UTC). La especificación de precisión de fracción de segundo tiene un intervalo de 1 a 7 dígitos. La precisión predeterminada es 7 dígitos.
SYSDATETIME y SYSUTCDATE tienen más precisión de fracciones de segundo que GETDATE y GETUTCDATE. SYSDATETIMEOFFSET incluye el ajuste de zona horaria del sistema. SYSDATETIME, SYSUTCDATE y SYSDATETIMEOFFSET pueden asignarse a una variable de cualquier tipo de fecha y hora.


#### **TIMEFROMPARTS (Transact-SQL)**
Devuelve un valor time para la hora especificada y con la precisión indicada.
TIMEROMPARTS devuelve un valor de hora totalmente inicializado. Si los argumentos no son válidos, se generará un error. Si alguno de los parámetros es NULL, se devuelve NULL. Sin embargo, si el argumento precision es NULL, se generará un error.
El argumento fractions depende del argumento precision. Por ejemplo, si precision es 7, cada fracción representa 100 nanosegundos; si precision es 3, cada fracción representa un milisegundo. Si el valor de precision es cero, el valor de fractions también debe ser cero; de lo contrario, se produce un error.
Esta función se puede enviar de forma remota a servidores SQL Server 2012 y posteriores. No se puede enviar de forma remota a servidores que tengan una versión inferior a SQL Server 2012.

* ###### **A.Ejemplo simple sin fracciones de segundo**
###### SELECT TIMEFROMPARTS ( 23, 59, 59, 0, 0 ) AS Result;
###### El conjunto de resultados es el siguiente.
###### Result -------------------- 23:59:59.0000000
(1 row(s) affected)
* ###### **B.Ejemplo con fracciones de segundo**
###### En el siguiente ejemplo se muestra el uso de los parámetros fractions y precision:
###### 1.	Cuando fractions tiene el valor 5 y precision tiene un valor de 1, el valor de fractions representa 5/10 de un segundo.
###### 2.	Cuando fractions tiene el valor 50 y precision tiene un valor de 2, el valor de fractions representa 50/100 de un segundo.
###### 3.	Cuando fractions tiene el valor 500 y precision tiene un valor de 3, el valor de fractions representa 500/1000 de un segundo.
######  Transact-SQL
######  SELECT TIMEFROMPARTS ( 14, 23, 44, 5, 1 );
###### SELECT TIMEFROMPARTS ( 14, 23, 44, 50, 2 );
###### SELECT TIMEFROMPARTS ( 14, 23, 44, 500, 3 );
###### GO
###### El conjunto de resultados es el siguiente.
###### ----------------
###### 14:23:44.5
###### (1 row(s) affected)
###### ----------------
###### 14:23:44.50
###### (1 row(s) affected)
###### ----------------
###### 14:23:44.500
###### (1 row(s) affected)


#### **TODATETIMEOFFSET (Transact-SQL)**
Devuelve un valor de tipo datetimeoffset que se traduce a partir de una expresión datetime2.
La expresión no puede ser del tipo text, ntext o image, ya que estos tipos no se pueden convertir implícitamente en varchar o nvarchar.
* ###### **A.Cambiar el ajuste de zona horaria de la fecha y hora actuales**
En el ejemplo siguiente se cambia el ajuste de zona horaria de la fecha y hora actuales a la zona horaria -07:00.
###### DECLARE @todaysDateTime datetime2;
###### SET @todaysDateTime = GETDATE();
###### SELECT TODATETIMEOFFSET (@todaysDateTime, '-07:00');
###### -- RETURNS 2007-08-30 15:51:34.7030000 -07:00
* ###### **B.Cambiar el ajuste de zona horaria en minutos**
En el ejemplo siguiente se cambia la zona horaria actual a -120 minutos.
###### DECLARE @todaysDate datetime2;
###### SET @todaysDate = GETDATE();
###### SELECT TODATETIMEOFFSET (@todaysDate, -120);
###### -- RETURNS 2007-08-30 15:52:37.8770000 -02:00
* ###### **C.Agregar un ajuste de zona horaria de 13 horas**
En el ejemplo siguiente se agrega un ajuste de zona horaria de 13 horas a una fecha y hora.
###### DECLARE @dateTime datetimeoffset(7)= '2007-08-28 18:00:30';
###### SELECT TODATETIMEOFFSET (@dateTime, '+13:00');
###### -- RETURNS 2007-08-28 18:00:30.0000000 +13:00


#### **YEAR (Transact-SQL)**
Devuelve un entero que representa la parte del año de la date especificada.
YEAR devuelve el mismo valor que DATEPART (year, date).
Si date contiene únicamente una parte horaria, el valor devuelto es 1900, el año base.

###### Ejemplos
* La siguiente instrucción devuelve 2007. Este número corresponde al año.
SELECT YEAR('2007-04-30T01:01:01.1234567-07:00');
* La siguiente instrucción devuelve 1900, 1, 1. El argumento para date es el número 0. SQL Server interpreta 0 como 1 de enero de 1900.
SELECT YEAR(0), MONTH(0), DAY(0);


#### **MONTH (Transact-SQL)**
Devuelve un entero que representa el mes de date especificado.
MONTH devuelve el mismo valor que DATEPART (month, date).
Si date contiene solo una parte horaria, el valor devuelto es 1, el mes base.
###### Ejemplos
* La siguiente instrucción devuelve 4. Este número corresponde al mes.
SELECT MONTH('2007-04-30T01:01:01.1234567 -07:00');
* La siguiente instrucción devuelve 1900, 1, 1. El argumento para date es el número 0. SQL Server interpreta 0 como 1 de enero de 1900.
SELECT YEAR(0), MONTH(0), DAY(0);


#### **DAY (Transact-SQL)**
Devuelve un entero que representa el día (día del mes) de la date especificada.
DAY devuelve el mismo valor que DATEPART (day, date).
Si date contiene solo una parte horaria, el valor devuelto es 1, el día base.
###### Ejemplos
* La siguiente instrucción devuelve 30. Este número corresponde al día.
SELECT DAY('2007-04-30T01:01:01.1234567 -07:00');
* La siguiente instrucción devuelve 1900, 1, 1. El argumento para date es el número 0. SQL Server interpreta 0 como 1 de enero de 1900.
SELECT YEAR(0), MONTH(0), DAY(0);


#### **GETDATE (Transact-SQL)**
Devuelve la marca de tiempo del sistema de base de datos actual como un valor datetime sin el ajuste de zona horaria de la base de datos. Este valor se deriva del sistema operativo del equipo donde la instancia de SQL Server se está ejecutando.
SYSDATETIME y SYSUTCDATETIME tienen más precisión de fracciones de segundo que GETDATE y GETUTCDATE. SYSDATETIMEOFFSET incluye el ajuste de zona horaria del sistema. SYSDATETIME, SYSUTCDATETIME y SYSDATETIMEOFFSET pueden asignarse a una variable de cualquier tipo de fecha y hora.
###### Ejemplos
En los ejemplos siguientes se usan las seis funciones del sistema de SQL Server que devuelven la fecha y hora actuales para devolver la fecha, la hora o ambas. Los valores se devuelven en serie; por consiguiente, sus fracciones de segundo podrían ser diferentes.
* ###### **A.Obtener la fecha y hora actuales del sistema**
###### SELECT SYSDATETIME()
###### ,SYSDATETIMEOFFSET()
###### ,SYSUTCDATETIME()
###### ,CURRENT_TIMESTAMP
###### ,GETDATE()
###### ,GETUTCDATE();
###### El conjunto de resultados es el siguiente.
###### SYSDATETIME() 2007-04-30 13:10:02.0474381
###### SYSDATETIMEOFFSET()2007-04-30 13:10:02.0474381 -07:00
###### SYSUTCDATETIME() 2007-04-30 20:10:02.0474381
###### CURRENT_TIMESTAMP 2007-04-30 13:10:02.047
###### GETDATE() 2007-04-30 13:10:02.047
###### GETUTCDATE() 2007-04-30 20:10:02.047

* ###### **B.Obtener la fecha actual del sistema**
###### SELECT CONVERT (date, SYSDATETIME())
###### ,CONVERT (date, SYSDATETIMEOFFSET())
###### ,CONVERT (date, SYSUTCDATETIME())
###### ,CONVERT (date, CURRENT_TIMESTAMP)
###### ,CONVERT (date, GETDATE())
###### ,CONVERT (date, GETUTCDATE());
###### El conjunto de resultados es el siguiente.
###### SYSDATETIME() 2007-05-03
###### SYSDATETIMEOFFSET() 2007-05-03
###### SYSUTCDATETIME() 2007-05-04
###### CURRENT_TIMESTAMP 2007-05-03
###### GETDATE() 2007-05-03
###### GETUTCDATE() 2007-05-04

* ###### **C.Obtener la hora actual del sistema**
###### SELECT CONVERT (time, SYSDATETIME())
###### ,CONVERT (time, SYSDATETIMEOFFSET())
###### ,CONVERT (time, SYSUTCDATETIME())
###### ,CONVERT (time, CURRENT_TIMESTAMP)
###### ,CONVERT (time, GETDATE())
###### ,CONVERT (time, GETUTCDATE());
###### El conjunto de resultados es el siguiente.
###### SYSDATETIME() 13:18:45.3490361
###### SYSDATETIMEOFFSET()13:18:45.3490361
###### SYSUTCDATETIME() 20:18:45.3490361
###### CURRENT_TIMESTAMP 13:18:45.3470000
###### GETDATE() 13:18:45.3470000
###### GETUTCDATE() 20:18:45.3470000


# Uso de Strings


# Estadística Descriptiva
Las estadísticas de SQL son información sobre la distribución de los datos existentes en las columnas de las tablas de nuestra base de datos. 

En el archivo de [Estadística Descriptiva](https://github.com/jorge190588/basedatosII/sentencias DML) se manipularán los datos para obtener información útil, precisa y concisa, la cual, servirá en casos de organización, análisis, toma de decisiones, etc. Como objetivo principal se explicarán los siguientes temas:

* [Selección de datos](#selección-de-datos)
* [Ordenamiento](#ordenamiento)
* [Funciones de agregación](#funciones-de-agregación)
* [Agrupación de filas](#agrupación-de-filas)


## Selección de datos
La clave para obtener datos es la declaración **SELECT**, que en su forma básica es muy simple y fácil de usar. Sin embargo, se detallarán muchas opciones adicionales que hacen que la declaración SELECT sea muy poderosa.

La sintaxis básica es la siguiente:

```
SELECT columna1, columna2, ..., columnaX FROM nombre_tabla
```
Para obtener todos los valores únicos en un registro, se debe utilizar la palabra clave **DISTINCT**. Se agrega a la lista de columnas de la instrucción SELECT, directamente después de la palabra clave SELECT.

```
SELECT DISTINCT columna FROM nombre_tabla
```
Filtra los resultados con la cláusula **WHERE**

```
SELECT columnas FROM nombre_tabla
WHERE condiciones
```


&nbsp;

**Para definir las condiciones en la cláusula WHERE, se pueden utilizar los siguientes operadores:**

|Operadores de comparación| Descripción|
|------------|------------|
|=           | igual      |
|<           | menor      |
|>           | mayor      |
|<=          | menor o igual      |
|>=          | mayor o igual      |
|<>          | diferente      |


|Operadores lógicos| Descripción|
|------------|------------|
|NOT           |Para la negación de condiciones|
|AND         |Para la conjunción de condiciones|
|OR         |Para la disyunción de condiciones|


&nbsp;
### Uso de predicados

##### BETWEEN
Se utiliza para expresar una condición que quiere encontrar un valor entre unos límites concretos.

```
SELECT nombre_columnas_a_seleccionar
FROM tabla_a_consultar
WHERE columna BETWEEN limite1 AND limite2
```

##### IN
Para comprobar si un valor coincide con los elementos de una lista utilizaremos IN, y para ver si no coincide, NOT IN:

```
SELECT nombre_columnas_a_seleccionar
FROM tabla_a_consultar
WHERE columna [NOT] IN (valor1, ..., valorN);
```

##### LIKE
Se utiliza para comprobar si una columna de tipo carácter cumple alguna propiedad determinada.

```
SELECT nombre_columnas_a_seleccionar
FROM tabla_a_consultar
WHERE columna LIKE característica;
```

##### IS NULL
Para comprobar si un valor es nulo utilizaremos IS NULL, y para averiguar si no lo es, IS NOT NULL. 

```
SELECT nombre_columnas_a_seleccionar
FROM tabla_a_consultar
WHERE columna IS [NOT] NULL;
```

## Orden de datos
Para la ordenar los datos obtenidos en respuestas a consultas se utiliza la cláusula **ORDER BY** en la sentencia SELECT. 

**DESC:** ordena los datos en forma descendente.


**ASC:** ordena los datos en forma ascendente.

```
SELECT nombre_columnas_a seleccionar
FROM tabla_a_consultar
[WHERE condiciones]
ORDER BY columna [DESC] | [ASC]
```

## Funciones de agregación
Son funciones para efectuar operaciones sobre los datos de una base de datos. Las principales funciones de agregación son:

* **COUNT**
     Obtiene el número total de filas seleccionadas
* **SUM**
     Suma los valores de una columna
* **MIN**
     Obtiene el valor mínimo de una columna
* **MAX**
     Obtiene el valor máximo de una columna
* **AVG**
     Calcula el valor medio de una columna

> Nota: 
  En general, las funciones de agregación se aplican a una columna, excepto la función de agregación COUNT. 
  
  ``` 
  SELECT COUNT(*) FROM nombre_tabla    //contará todas las filas de la tabla que cumplan las condiciones
  ```
  ```
  SELECT COUNT (DISTINCT columna) FROM nombre_tabla  //contaría los valores que no fuesen nulos ni repetidos
  ```
  ```
  SELECT COUNT (columna) FROM nombre_tabla   //contaria los valores que no fuesen nulos
  ```
  
### Agrupación de filas 
Las cláusulas siguientes permiten organizar las filas por grupos:

**a. GROUP BY**

Se utiliza para agrupar filas según las columnas que indique esta cláusula.
     

**b. HAVING**

Especifica condiciones de búsqueda para grupos de filas; lleva a cabo la misma función que antes cumplía la cláusula WHERE para
las filas de toda la tabla, pero ahora las condiciones se aplican a los grupos obtenidos.

```
SELECT nombre_columnas_a seleccionar
FROM tabla_a_consultar
[WHERE condiciones]
GROUP BY columnas_según_las_cuales_se_quiere_agrupar
[HAVING condiciones_por_grupos]
[ORDER BY columna_ordenación [DESC] [, columna [DESC]...]];
```

# Conversión de Datos a Json
JSON es un popular formato de datos textuales utilizado para intercambiar datos en aplicaciones web y móviles modernas. JSON también se utiliza para almacenar datos no estructurados en archivos de registro o bases de datos NoSQL como Microsoft Azure DocumentDB. 

SQL Server proporciona funciones integradas y operadores que le permiten hacer lo siguiente con el texto de JSON.
* Analizar texto JSON y leer o modificar valores.
* Transformar matrices de objetos JSON en formato de tabla.
* Ejecute cualquier consulta Transact-SQL en los objetos JSON convertidos.
* Formatee los resultados de las consultas Transact-SQL en formato JSON.

     ###### Funciones clave de JSON de SQL Server
###### Extraer valores del texto JSON y utilizarlos en consultas
Si tiene texto JSON almacenado en tablas de bases de datos, puede utilizar funciones integradas para leer o modificar valores en el texto JSON.
* Utilice la función JSON_VALUE para extraer un valor escalar de una cadena JSON.
* Utilice JSON_QUERY para extraer un objeto o una matriz de una cadena JSON.
* Utilice la función ISJSON para comprobar si una cadena contiene JSON válido.
* Utilice la función JSON_MODIFY para cambiar un valor en una cadena JSON.

###### CONTROL DE OTRAS OPCIONES DE SALIDA JSON 
* ROOT . Para agregar un solo elemento de nivel superior a la salida JSON.
* INCLUDE_NULL_VALUES . Para incluir valores nulos en la salida JSON.
* SIN_ARRAY_WRAPPER . Para eliminar los corchetes que rodean la salida JSON de la cláusula FOR JSON de forma predeterminada.

###### Convertir los Resultados Usando el Modo AUTO
Esta es la manera más simple de convertir datos relacionales a formato JSON, ya que todo lo que tiene que hacer es añadir la cláusula FOR JSON AUTO al final de su sentencia SELECT. En este modo, la estructura de la salida JSON es determinada por una combinación del orden de las columnas en su sentencia SELECT, así como las tablas que son referenciadas por la sentencia SELECT
De forma predeterminada, los valores nulos no se incluyen en la salida. Se puede trabajar INCLUDE_NULL_VALUES para cambiar este comportamiento

###### Convertir Resultados Usando el Modo Path
* El modo PATH puede ser usado en dos maneras:
* Sin una sintaxis de punto 
* Con una sintaxis de punto 

Cuando se está trabajando sin una sintaxis de punto, trabaja de manera similar al modo AUTO en que generará una salida JSON basada en el orden de las columnas en su sentencia SELECT. 
En el modo PATH, puedes usar la sintaxis de punto, por ejemplo, ‘Item.Price’ para dar formato a la salida anidada.

##### link para ver mas informacion y algunos ejemplos
https://www.sqlshack.com/es/convertir-resultados-de-sql-server-json/

https://docs.microsoft.com/es-es/sql/relational-databases/json/json-data-sql-server


# TEORIA DE CONJUNTOS


## Union
La cláusula UNION de SQL permite unir las filas devueltas por dos instrucciones SELECT. Para ello se debe cumplir que las columnas devueltas en ambas instrucciones coincidan en número y en tipo de datos de cada una de ellas, ya que en caso contrario dará un error al ejecutarse.

### Ejemplo
select nombreCliente, direccion,telefono 
from Clientes
union
select nombreProveedor, direccion,telefono 
from Proveedor


## Interseccion
Devuelve la intersección entre dos o más conjuntos de resultados en uno. El conjunto obtenido como resultado de INTERSECTtiene la misma estructura que los conjuntos originales.

### Ejemplo
select nombreCliente,telefono 
from Clientes
intersect 
select nombreProveedor,telefono 
from Proveedor

## Except
EXCEPT devuelve la diferencia (resta) de dos o más conjuntos de resultados. El conjunto obtenido como resultado de EXCEPTtiene la misma estructura que los conjuntos originales.

### Ejemplo
select nombreCliente,nit, direccion, idMunicipio,telefono 
from Clientes
except
select nombreProveedor,nit, direccion, idMunicipio,telefono 
from Proveedor

## combinación multi tablas
Con las variantes INNER, LEFT, RIGHT y FULL de consults multi.tabla somos capaces de obtener registros relacionados y los registros relacionados + los registros no relacionados en uno de los dos lados o en ambos, básicamente estas combinaciones de los datos de dos tablas:

### Ejemplos de INNER JOIN, CROSS JOIN, LEFT, RIGHT UNION ALL Y FULL

----join (right, left full outer)-----

select bodega.nombreBodega as bodega, Productos.nombre as nombre
from Productos	full outer join bodega on Productos.idBodega=bodega.idBodega
group by bodega.nombreBodega, Productos.nombre

---cross join----

select * from Productos cross join bodega

------uso de union all-------

select nombreCliente, direccion,telefono 
from Clientes
union all
select nombreProveedor, direccion,telefono 
from Proveedor
