use ComputerDB
select * from Municipio
select * from Departamento
select * from Pais

-- Volcado de datos Tabla Marca
insert into Marca(nombreMarca) values('Dell'),('Toshiba'),('Compaq'),('Acer'),('Logitech'),
									 ('Hp-Invent'),('Sony'),('Samsumg'),('Asus'),('IBM')
									 go

-- Volcado de datso Tabla Color
insert into Color(nombreColor) values('Negro'),('Gris'),('Blanco'),('Azul'),('Rojo'),('Verde')
go									

-- Volcado de datos Tabla Dimension
insert into Dimension(nombreDimension,alto,ancho) values('Ejemplo',6.5,10.4),('Ejemplo2',20,14)
go


-- Volcado de datos Tabla Productos
insert into Productos(nombreProducto,descripcionProducto,precio,costo,existencia,idMarca,idDimension,idColor)
values('Monitor','Monitor para PC',3000,2000,15,1,3,1),('Mouse','Mouse inlámbrico usb',400,150,25,1,3,5),
	  ('Laptop','Computadora Laptop pequeña',6000,5000,12,4,2,5),('Teclado','Teclado inalámbrico usb',250,175,20,2,1,1),
	  ('Memoria USB','Dispositivo de almacenamiento usb de 32gb',150,90,50,8,1,2),('PC Hp','Computadora de Escritorio sin CPU',4000,3400,8,6,3,3),
	  ('Laptop','Laptop con tecládo alfanumerico',6000,4500,22,7,3,2)
go



-- Volcado de datos Tabla Pais
insert into Pais(nombrePais)values('Guatemala'),('México'),('USA'),('Argentina'),('Brasil')
go

-- Volcado de datos Tabla Departamento
insert into Departamento(nombreDepartamento,idPais) 
	values  ('Petén',1),
			('Huehuetenango',1),
			('Quiche',1),
			('Alta Verapaz',1),
			('Izabal',1),
			('San Marcos',1),
			('Quetzaltenango',1),
			('Totonicapán',1),
			('Sololá',1),
			( 'Chimaltenango',1),
			( 'Sacatepéquez',1),
			( 'Guatemala',1),
			( 'Baja Verapaz',1),
			( 'El Progreso',1),
			( 'Jalapa',1),
			( 'Zacapa',1),
			( 'Chiquimula',1),
			( 'Retalhuleu',1),
			( 'Suchitepéquez',1),
			( 'Escuintla',1),
			( 'Santa Rosa',1),
			( 'Jutiapa',1);
go


-- Volcado de datos Tabla Municipio
insert into Municipio (nombreMunicipio,idDepartamento,idPais) values ('Flores',1,1),
																	 ('Dolores',1,1),
																	 ('El chal',1,1),
																	 ('la Libertad',1,1),
																	 ('Las Cruces',1,1),
																	 ('Melchor de Mencos',1,1),
																	 ('Poptún',1,1),
																	 ('San Andres',1,1),
																	 ('San Benito',1,1),
																	 ('San Francisco',1,1),
																	 ('San José',1,1),
																	 ('San Luis',1,1),
																	 ('Santa Ana',1,1),
																	 ('Sayaxché',1,1),
																	 ('Huehuetenango',2,1),
																	 ('Aguacatán',2,1),
																	 ('Chiantla',2,1),
																	 ('Colotenango',2,1),
																	 ('Concepción Huista',2,1),
																	 ('Cuilco',2,1),
																	 ('Jacaltenango',2,1),
																	 ('La libertad',2,1),
																	 ('La democracia',2,1),
																	 ('Malacantancito',2,1),
																	 ('Nentón',2,1),
																	 ('San Antonio Huista',2,1),
																	 ('San Gaspar Ixchil',2,1),
																	 ('San Juan Ixcoy',2,1),
																	 ('San Pedro Necta',2,1),
																	 ('Santa Cruz del Quiché',3,1),
																	 ('Canillá',3,1),
																	 ('Chajul',3,1),
																	 ('Chicamán',3,1),
																	 ('Chiché',3,1),
																	 ('Chichicastenango',3,1),
																	 ('Chinique',3,1),																	 
																	 ('cunén',3,1),
																	 ('Ixcán',3,1),
																	 ('Joyabaj',3,1),
																	 ('Cobán',4,1),
																	 ('Cahál',4,1),
																	 ('Chisec',4,1),
																	 ('Fray Bartolomé de las casas',4,1),
																	 ('Lanquín',4,1),
																	 ('Panzós',4,1),
																	 ('Raxruhá',4,1),
																	 ('San Cristobál Verapaz',4,1),
																	 ('San Juan Chamelco',4,1),
																	 ('San Pedro Carchá',4,1),
																	 ('Puerto Barrios',5,1),
																	 ('El Estór',5,1),
																	 ('Livinstong',5,1),
																	 ('Los amates',5,1),
																	 ('Morales',5,1),
																	 ('Quetzaltenango',7,1),
																	 ('Almolonga',7,1),
																	 ('Cabricán',7,1),
																	 ('Cajolá',7,1),
																	 ('Cantel',7,1),
																	 ('coatepeque',7,1),
																	 ('Colomba Costa Cuca',7,1),
																	 ('Concepción Chiquirichapa',7,1);
go																