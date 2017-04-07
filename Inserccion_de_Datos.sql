use ComputerDB

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
insert into Municipio (nombreMunicipio,idDepartamento,idPais)
 values ('Flores',1,1),
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


-- Volcado de datos Tabla formaPago
insert into FormaDePago(nombre)
values('Efectivo'),('Tarjeta de Crédito'),('Tarjeta de Débito'),('Transferencia Bancaria'),('Cheque'),('Otro')
go

-- Volcado de Datos a la Tabla Clientes
insert into Clientes(nombreCliente,nit,direccion,idMunicipio,telefono,idFormaPago)
	values('Eduardo Barrios','1416539-2','7ma calle 9-42 Zona 1',50,54441004,1),
		  ('Cesar Cancinos','543667-7','9na avenida Zona 4',2,58646984,2),
		  ('Jorge Chávez','324432-1','Cantón las Victorias',4,77714140,4),
		  ('Cecilia Leal','12345-7','Llanos del Pinal',5,54563321,6),
		  ('María Herrera','444444-1','Cantón la chula zona 4',8,76884532,5),
		  ('Junior Dosantos','7654324-9','Las Picositas de San Luis',10,54326690,3),
		  ('Fabricio Werdrum','6789445-1','Kilometro 94.5 frente a pasarela',43,79886548,6),
		  ('Jhony Bravo','000000-2','Cantón Dolores Zona 4',22,77710432,2),
		  ('Fernande Perez','1111111-2','5ta calle 6-55 zona 2',25,53356743,5),
		  ('Sara Aguilar','6539808-6','Zona 3',6,45345564,4),
		  ('Felipe Dominguez','5467325-2','Colonia Trinidad zona 5',49,77715127,4),
		  ('Akasio Martinez','5643243-7','Hacienda San Joaquín Zona 4',30,56753476,2),
		  ('Miguel Quintanilla','1223436-3','Frente al Cementerio Zona 3',44,77713245,5),
		  ('Jose Luis López','2133879-1','Zona 4',42,77719452,3),
		  ('Canario Ortíz','8754332-8','Colonia Mendizabal Zona 2',35,41793176,6)
go		 


-- Volcado de Datos Tabla Proveedor
insert into Proveedor(nombreProveedor,nit,direccion,idMunicipio,telefono,idFormaPago)
	values('Mateo Fernandez','1416539-2','7ma calle 9-42 Zona 1',50,54441004,1),
		  ('Silvia Rosales','543667-7','9na avenida Zona 4',2,58646984,2),
		  ('Juan Pablo García','324432-1','Cantón las Victorias',4,77714140,4),
		  ('Carlos López','12345-7','Llanos del Pinal',5,54563321,6),
		  ('Dani Dinael','444444-1','Cantón la chula zona 4',8,76884532,5),
		  ('Elmer del Cid','7654324-9','Las Picositas de San Luis',10,54326690,3),
		  ('Pedro Rivas','6789445-1','Kilometro 94.5 frente a pasarela',43,79886548,6),
		  ('Jorge Mario Vidal','000000-2','Cantón Dolores Zona 4',22,77710432,2),
		  ('Mario Castillo','1111111-2','5ta calle 6-55 zona 2',25,53356743,5),
		  ('Rafael Hernandez','6539808-6','Zona 3',6,45345564,4),
		  ('Juan José Grajeda','5467325-2','Colonia Trinidad zona 5',49,77715127,4),
		  ('Karla Arenas','5643243-7','Hacienda San Joaquín Zona 4',30,56753476,2),
		  ('Dina Arroyo','1223436-3','Frente al Cementerio Zona 3',44,77713245,5),
		  ('Marlon Mejía','2133879-1','Zona 4',42,77719452,3),
		  ('Freddy Herrera','8754332-8','Colonia Mendizabal Zona 2',35,41793176,6)
go		 



-- altere el campo documento de la Tabla Salida lo converti a int para poder
-- ingresar datos mas rapido, si usted no ha creado la base de datos con base a este script
-- no se preocupe el script de creación de la base de datos ha sido modificado
-- pero si usted ya tiene los campos documento de las tablas Entrada y Salida como varchar utilice las siguientes lineas
alter table dbo.Entrada alter column documento int;
alter table dbo.Salida alter column documento int;



-- Volcado de Datos Tabla Salida
-- se recomienda usar el sp creado para esta insercción masiva dentro de un bucle while
-- ojo lo unico que no es dinamico es la fecha 
-- con el siguiente codigo se insertaran 1000 registros tomar en cuenta la creación del sp
declare @documento int
set @documento=1
--select @variable as [Variable]
while(@documento <= 1000)
begin
	execute sp_InsertarSalidaMasivo '2015-08-10',@documento 
	set @documento = @documento+1
end



-- ejecutar esta linea para cambiar el nombre a la columna costo ya que es ambigua
-- si crea la bd por primera vez no es necesario, ya se ha modificado el script de estructura de la base de datos
exec sp_rename 'EntradaDetalle.costo','costoTotal'
exec sp_rename 'SalidaDetalle.costo','costoTotal'

-- Volcado de Datos Tabla SalidaDetalle
insert into SalidaDetalle(idSalida,idProducto,cantidad,precio,costo)