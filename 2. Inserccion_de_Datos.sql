use ComputerDB

-- Volcado de datos Tabla Marca
insert into Marca(nombreMarca) values('Dell'),('Toshiba'),('Compaq'),('Acer'),('Logitech'),
									 ('Hp-Invent'),('Sony'),('Samsumg'),('Asus'),('IBM')
									 go

-- Volcado de datso Tabla Color
insert into Color(nombreColor) values('Negro'),('Gris'),('Blanco'),('Azul'),('Rojo'),('Verde')
go									

-- Volcado de datos Tabla Dimension
insert into Dimension(nombreDimension,alto,ancho) values('Ejemplo',6.5,10.4),
														('Ejemplo2',20,14),
														('Ejemplo3',10,17),
														('Normal',6.2,11.3)
go


-- Volcado de datos Tabla Productos
insert into Productos(nombre,descripcion,precio,costo,existencia,idMarca,idDimension,idColor)
values('Monitor','Monitor para PC',3000,2000,15,1,3,1),('Mouse','Mouse inlámbrico usb',400,150,25,1,3,5),
	  ('Laptop','Computadora Laptop pequeña',6000,5000,12,4,2,5),('Teclado','Teclado inalámbrico usb',250,175,20,2,1,1),
	  ('Memoria USB','Dispositivo de almacenamiento usb de 32gb',150,90,50,8,1,2),('PC Hp','Computadora de Escritorio sin CPU',4000,3400,8,6,3,3),
	  ('Laptop','Laptop con tecládo alfanumerico',6000,4500,22,7,3,2),
	  ('Teclado','Teclado Usb Imexx Pc Computadora Laptop',125,90,100,8,1,2),
	  ('Teclado','Logitech Bluetooth Illuminated Keyboard K810',250,180,100,8,1,1),
	  ('Mouse','M510 Wireless Laser Mouse',80,60,100,5,4,1),
	  ('Mouse','Mouse M100',250,180,100,8,4,3)
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
		  ('Canario Ortíz','8754332-8','Colonia Mendizabal Zona 2',35,41793176,6),
		  ('Elvin Morales','278638-8','Ciudad',1,34064744,1)
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

-- Volcado de Datos Tabla Proveedor

/*

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


*/

-- Agregando mas datos a Tabla Marca
insert into Marca(nombreMarca) values('Epson'),('Canon'),('Xtech'),('Kingston'),('Intel'),
				     ('E-touch'),('Lenovo'),('Eset Nod'),('Avast'),('Durabrand'),
				     ('Aoc'),('Ubiquiti'),('SanDisk'),('Forza'),('Microsoft'),
				     ('APC'),('Aorus'),('HyperX'),('seagate'),('Wacom')
				      go

-- Agregando mas datos Tabla Productos
insert into Productos(nombre,descripcion,precio,costo,existencia,idMarca,idDimension,idColor)
values('Cable','Usb Extension Cable',35,15,15,13,3,1),('Cable','Cable Usb 4 Pines',35,15,25,13,3,5),
      ('Cable','Cable de audio stereo',50,15,15,1,3,1),('Cable','Cable audio 3.5 milimetros',35,15,25,13,3,5),
      ('Cable','Apple LightNigth',200,150,15,13,3,1),('Cable Adaptador','Microsoft Wireless Adapter',200,100,25,3,1),
      ('Espuma Limpiadora','Kit Limpieza',60,22,15,13,3,1),('Limpia Contactos','Kit Limpieza',80,32,25,13,3,2),
      
-- Agregando mas datos Tabla Productos
insert into Productos(nombre,descripcion,precio,costo,existencia,idMarca,idDimension,idColor)
values('Cable','Usb Extension Cable',35,15,15,13,3,1),('Cable','Cable Usb 4 Pines',35,15,25,13,3,5),
      ('Cable','Cable de audio stereo',50,15,15,1,3,1),('Cable','Cable audio 3.5 milimetros',35,15,25,13,3,5),
      ('Cable','Apple LightNigth',200,150,15,13,3,1),('Cable Adaptador','Microsoft Wireless Adapter',200,100,15,25,3,1),
      ('Espuma Limpiadora','Kit Limpieza',60,22,15,13,3,1),('Limpia Contactos','Kit Limpieza',80,32,25,13,3,2),
      ('Pad','Alfombra para mouse',50,20,15,5,3,1),('Aire Comprimido','Kit Limpieza',85,32,25,13,3,2),
      ('Notebook Stan','Ventilador y soporte Laptop',300,100,15,25,3,2),('Adaptador Cargador','regula voltaje 110/220 laptop',250,100,15,24,3,2),
      ('Servidor','Para montar en bastidos',7900,5000,15,1,3,1),('Servidor Dell','Rack-Moutable',10200,7500,15,1,3,2),
      ('Computador Todo en uno','Todo en uno',3500,2000,15,2,3,2),('Computadora','De esccritorio',3750,2000,15,3,3,2),
      ('Adaptador de Corriente','C/A 110/220',250,100,15,3,3,1),('Power Adapter','Adaptador de potencia',250,100,15,24,3,2),
      ('UPS','Para conectar equipos',550,300,15,24,3,1),('Bateria Backup','Distribuidor de voltaje para UPS',500,200,25,13,3,2),
      ('Regulador en Linea','Regulador automatico de Voltaje',750,450,15,20,3,1),('Barebones','MiniOrdenador',900,700,25,1,3,2),
      ('Gabinete','Media Torre para ensamblaje',250,100,15,1,3,2),('Ventilador','Para Gabinete 120 mm',100,45,15,5,3,1),
      ('Sistema Refrigeracion Lìquida','Ventilador para Servidor',450,300,15,5,3,3),('Ventilador de Sistema','Para Prolian 90',600,400,15,6,3,2),
      ('Tarjeta Madre','Placa Base ATX',500,300,15,14,1,1),('Motherboard','Micro ATX',750,500,15,15,1,2),
      ('Placa Base','tarjeta madre modelo MSI A68',300,150,15,14,1,1),('Fuente de Poder','500 wats',250,100,15,1,1,2),
      ('Fuente Alimentacion','Para gabinente 12V',225,100,15,2,1,1),('Fuente Redundante','Para Servidor',450,300,15,14,3,2),
      ('Procesador 8 nucleos','Intel Xenon X5',1200,750,15,15,1,1),('Procesador 10 nucleos','intel Xenon 2.4 GH',1750,1200,25,15,3,2),
      ('Procesador 4 nucleos','Core i5',1100,800,15,15,1,1),('Tarjeta de Video','Radeon R7',500,400,25,28,1,2),
      ('Tarjeta Grafica','GF GT 730',650,450,15,28,3,1),('Adaptador Micro Sd','hasta 32GB',75,25,25,14,1,3),
      ('Tarjeta de Memoria Flash','Estandar SanDisk 16GB',80,45,15,14,1,1),('Memoria MicroSD 8GB','Micro 8GB',85,32,25,13,3,2),
      ('Memoria MicroSD 16GB','Micro 16GB',90,45,15,15,1,1),('Memoria MicroSD 32GB','Micro 32GB',125,75,25,15,1,3),
      ('Lectora CD','Lee y Quema CD/DVD',325,200,15,2,3,1),('Memoria Ram 8GB','DDR3',450,225,25,14,3,3),
      ('Memoria Ram 4GB','DDR4',300,200,15,14,3,1),('Memoria Ram DDR3L','Micro 8GB',450,225,25,14,3,3),
      ('Memoria ValueRam 4GB','FlueRam',300,200,15,14,3,1),('Memoria Ram HyperX','8GB',450,225,25,14,3,3),
      ('Disco Duro Externo','2TB',1000,600,15,14,3,1),('Disco Duro Interno','1TB',850,500,25,14,1,3)
      go
      
