# Sentencias basicas DML

# Uso de fechas

# Uso de Strings

## Estadística Descriptiva
create database peliculas;

use peliculas

create table peliculas(
id int primary key not null identity,
nombre varchar(80),
categoria varchar(50), 
idioma varchar(50),
descargas int,
precio float
)
--drop table peliculas

insert into peliculas(nombre, categoria, idioma, descargas, precio) values 
			('La Casa de Cera','terror','español', 150, 200),
			('La Cabaña del Terror', 'terror','español', 523, 300),
			('Forrest Gump', 'comedia','español', 32, 250),
			('Titanic', 'romantica','ingles', 423, 100),
			('El Padrino', 'terror','español', 398, 100),
			('ESO', 'terror', 'español', 700, 230),
			('La llegada','ficcion','ingles',556,125),
			('el viajero','romantica','español',345,123),
			('La vuelta al mundo','ficcion','español',678,167),
			('El viaje mas largo','romantico','español',897,156),
			('Mañana es para siempre','terror','español',1233,123),
			('la tormenta','romantica','ingles',345,123),
			('El carrucel','terror','español',456,122),
			('La laguna azul','romantica','español',989,145),
			('La montaña','terror','español',789,134),
			('El fantasma','terror','ingles',567,122),
			('La casa de a lado','romantica','español',445,211),
			('La playa','comedia','ingles',123,120),
			('El recuerdo','drama','español',567,111),
			('La tragedia','drama','portuges',678,123),
			('El juego final','accion','aleman',789,243),
			('La ruleta','ficcion','ruso',1000,123),
			('La extraña vida','drama','español',1234,234),
			('El conde de montecristo','romantica','portuges',1500,124),
			('Dia de la independencia','fantasia','portuges',908,213),
			('El atentado','drama','aleman',1689,100),
			('La batalla','belico','aleman',1756,345),
			('Don juan','ficcion','portuges',4567,123),
			('El barco','drama','ingles',345,126),
			('El falso espia','comedia','ruso',768,234),
			('Viajar con tigo','romantica','frances',276,345),
			('la guerra','historia','frances',2345,122),
			('El Angel','drama','ruso',789,321),
			('El empleado','accion','español',897,232),
			('La laguna azul','belico','ingles',786,123),
			('Motel','erotica','español',5672,235),
			('El amante','erotica','frances',1234,143),
			('La jaula','drama','frances',345,123),
			('La bruja','terror','ruso',237,100),
			('El vuelo','comedia','español',234,137),
			('El callejon','fantasia','ingles',876,234),
			('EL museo','melodrama','ruso',985,321),
			('La enfermara','suspenso','chino',344,100),
			('Rutas salvajes','melodrama','japones',678,145),
			('El clon','drama','ruso',763,323),
			('El atentado','historia','español',1577,125),
			('Londres','belico','frances',345,100),
			('La isla','terror','japones',567,250),
			('Atraco','melodrama','ingles',457,100),
			('Chips','comedia','chino',656,233),
			('La bestia','terror','chino',867,233),
			('EL manantial','romantica','japones',567,124),
			('El gordo','comedia','español',645,125)
go
