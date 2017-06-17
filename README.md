# basedatosII
El proyecto contiene un script de la base de datos de un giro de negocio de ventas.   Los movimientos registrados deben de ser sobre productos de computadoras

## Grupos

### 1. Salidas

* Eduardo Barrios, Gabriel Rodriguez, Angel Gonzales, Denis Rosales y Luis Castillo
  
### 2. Entradas
* Elvin Morales, Pedro Lol, Eddy Delgado, Abel Hidalgo, Zelik Ramirez y Julio Gil
  
### 3. Inventarios.
  

## Alumnos
Deben aportan en el proyecto por medio de commits, actualizando el script de la base de datos e ingresando como minimo 500,000 registros en las transacciones principales que son movimientos de compras y ventas.

## Tablas de la base de datos y sus atributos
A partir del listado de tablas con atributos minimos deben incrementar la estructura de la base de datos.  

1. Productos (id, nombre, descripcion, precio, costos, existencia, idmarca, iddimension, idcolor)
2. Clientes (id, nombre, nit, direccion, idmunicipio, telefono, idformapago)
3. Marca (id, nombre)
4. Color (id, nombre)
5. Dimensiones  (id, nombre, alto, ancho)
6. Forma de pago (id, nombre) -> Efectivo, tarjeta, transaferencia, cheque, entre otros.
7. Clasificacion de cliente (id, nombre, venta minima, venta maxima) -> Se clasifican los clientes segun las ventas A,B,C
8. Pais (id,nombre)
9. Departamento (id, nombre, idpais)
10. Municipio (id, nombre, iddepartamento)
11. Proveedor (id, nombre, nit, telefono, direccion, idmunicipio, idformapago)
12. Salida (id,fecha,documento,idcliente)
13. Salidadetalle(id,idsalida,idproducto,cantidad,precio,costo)
14. Entrada (id,fecha,documento,idproveedor)
15. Entradadetalle(id,identrada,idproducto,cantidad,precio,costo)

## Reglas de negocio.
En esta seccion se proporcionan casos de uso sobre la estructura de la base de datos, como por ejemplo el funcionamiento de la clasificacion de clientes.

## Software
Las herramientas utilizadas para hacer los ejercicios son>

1. Sql server 2012 (Sistema Gestos de base de datos)
2. Jmeter (Estresar servicios)
3. Github (control de versiones)
4. Cmder (consola para ejecutar comandos)
5. SourceTree (Resolver conflictos de merge)
6. Jennkins (backup y recuperacion)
7. Docker (microservicios)
8. Gherkin (requerimientos)


## Requerimientos 
Utilizando Gherkin se describen los requermientos para la extraccion de informacion.  Se debe justificar con datos cuantificables cada respuesta, es decir debe realizar como minimo pruebas con diferente sintaxis sql (SQL,join y TransSQL)

## Contenido
1. Transacciones
2. Prodecimientos almacenados (sin parametros, con parametros y con TVP)
3. Try Catch 
4. Sql y TransSql
5. [Indices Clustered y Non-clustered](http://www.ticout.com/blog/2012/08/29/sql-server-diferencias-entre-clustered-index-y-non-clustered-index/)
6. Cache
7. Formatos de resultado (Tabla, Json y xml)
8. Cursores.
9. Pruebas unitarias.
10. [SQL Server y Amazon](https://www.youtube.com/watch?v=K8gSaS_E4JM)


### Analisis Multidimensional

1. [Analisis multidimensional (cubos olap)](https://www.youtube.com/watch?v=PDqmZY1msZs)
2. [Ejemplo de cubo de salidas](https://youtu.be/zlJNtwXBq4k)

### Mineria de datos
1. [Documentacion de Microsoft sobre mineria de datos](https://msdn.microsoft.com/es-es/library/ms175595.aspx)
2. [Factores](https://miblogtecnico.wordpress.com/2014/03/18/mineria-de-datos-en-sql-server-2012/)
3. [Mineria de datos](https://www.youtube.com/watch?v=hbiRtv2WxDY)
  * Asociacion de patrones
  * Clustering
  * Arboles de desicion [Ejemplo 1](https://www.youtube.com/watch?v=ss1_BehIU1g),[Ejemplo 2](https://www.youtube.com/watch?v=aXY-T3ohrdE)
  * Regresion lineal
  * Regresion logistica
  * Teorema de Bayes [Ejemplo 1](https://youtu.be/Jsma-k6b2eM)
  * Reres neuronales.
  * Secuencia de clustering
  * Series de tiempo [Ejemplo 1](https://www.youtube.com/watch?v=eVcJ6AKWsdM&t=33s)



