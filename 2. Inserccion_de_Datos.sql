use ComputerDB

-- Volcado de datos Tabla Marca
insert into Marca(nombreMarca) values('Dell'),('Toshiba'),('Compaq'),('Acer'),('Logitech'),
									 ('Hp-Invent'),('Sony'),('Samsumg'),('Asus'),('IBM'),('HP'),('Epson'),
									 ('Canon'),('Kingston'),('Apple'),('Sony'),('Microsoft'),('Nokia'),('Intel'),
									 ('LG'),('Adobe'),('Lenovo'),('Oracle'),('Nikon'),('Kodak'),('Huawei'),
									 ('Alcatel'),('BlackBerry'),('AT&T'),('Fujitsu'),('HTC'),('Ebay'),
									 ('ZTE'),('Panasonic'),('Philips'),('Cisco')

									 go

insert into Color(nombreColor) values('Negro'),('Gris'),('Blanco'),('Azul'),('Rojo'),('Verde'),('Amarillo'),('Rosado'),('Marron'),('Celeste'),('Purpura')
go									

-- Volcado de datos Tabla Dimension
insert into Dimension(nombreDimension,alto,ancho) values('Clase A',6.5,10.4),
														('Clase B',20,14),
														('Clase C',10,17),
														('Clase D',6.2,11.3),
														('Clase E',8,15),
														('Clase F',10,20),
														('Clase G',6.2,11.3)
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
	  ('Mouse','Mouse M100',23,20,100,8,4,3),
	  ('Mouse','Mouse NSD2',50,40,100,8,4,3),
	  ('Mouse','Mouse M123',25,20,100,8,4,3),
	  ('Mouse','Mouse M88',20,10,100,8,4,3),
	  ('Teclado','Teclado Verde',50,30,100,8,4,6),
	  ('Teclado','Teclado Inalambrico',125,80,100,3,4,1),
	  ('Monitor','Monitor Touch',122,100,100,6,4,4),
	  ('Monitor','Monitor LCD',120,110,100,8,4,3),
	  ('Memoria','USB 8gb',200,180,100,8,4,3),
	  ('Memoria','usb 16gb kingston',220,190,100,14,1,4),
	  ('Memoria','usb 32gb kingston',250,180,100,14,2,4),
	  ('Memoria','usb 64gb kingston',280,220,100,14,1,4),
	  ('Memoria','ram ddr 2gb',800,600,100,5,4,6),
	  ('Memoria','ram ddr 4gb',840,780,100,5,4,6),
	  ('Memoria','ram ddr2 6gb',1020,980,100,6,4,6),
	  ('Memoria','ram ddr2 8gb',1250,1000,100,6,4,6),
	  ('Memoria','ram ddr2 2gb',1150,950,100,6,4,6),
	  ('Memoria','ram ddr3 2gb',1500,1200,100,6,4,6),
	  ('Memoria','ram ddr3 4gb',1600,1250,100,6,4,6),
	  ('Memoria','ram ddr3 6gb',2000,1800,100,6,4,6),
	  ('Memoria','ram ddr3 8gb',2500,2000,100,6,4,6),
	  ('Memoria','ram ddr3 16gb',2800,2450,100,6,4,6),
	  ('Cable','utp',250,180,100,1,4,3),
	  ('Cable','vga',10,2,100,1,1,5),
	  ('Cable','hdmi',23,15,100,1,4,2),
	  ('Cable','usb',12,5,100,1,4,3),
	  ('Cable','Para Bocinas',5,2,100,8,4,3),
	  ('Cable','Profesional para microfono',45,35,100,6,4,3),
	  ('Conector','rj45',1,0.5,100,8,4,3),
	  ('Conector','Keystone hembra',45,30,100,8,4,6),
	  ('Conector','Mono Plug',20,10,100,8,4,3),
	  ('Conector','Estereo a Jack',20,12,100,2,4,6),
	  ('Conector','XLR 3 pines hembra',75,55,100,2,4,6),
	  ('Conector','XLR 3 pines macho',75,55,100,2,4,6),
	  ('Adaptador','Serial a Paralelo',30,25,100,2,4,6),
	  ('Adaptador','Paralelo a Centronics',35,25,100,2,4,6),
	  ('Adaptador','DB9 hembra a DB25 macho',12,8,100,2,4,6),
	  ('Adaptador','IEEE 1394 6F/4M',34,23,100,7,4,3),
	  ('Adaptador','IEEE 1394 6M/4F',123,42,100,7,4,7),
	  ('Adaptador','USB 2.0 a RJ45 Ethernet',42,23,100,7,4,7),
	  ('Adaptador','Armable DB15 (DA15) F/RJ45',45,37,100,7,4,2),
	  ('Adaptador','Antena Wi-Fi de alta ganancia omnidireccional RP-SMA',475,335,100,7,4,5),
	  ('Adaptador','Armable DB25 F/RJ45',24,14,100,7,4,3),
	  ('Adaptador','Armable DB25 M/RJ45',25,13,100,11,4,3),
	  ('Conector','Keystone Cat 5e para RJ45',33,24,100,11,4,2),
	  ('Conector','Keystone Cat 6 para RJ45',37,25,100,3,4,2),
	  ('Conector','keystone RCA hembra/hembra',40,35,100,3,4,2),
	  ('Conector','keystone tipo F hembra/hembra',41,32,100,3,4,3),
	  ('Conector','keystone USB hembra/hembra',45,37,100,3,4,3),
	  ('Conector','RJ45 Cat 5e blindado',64,55,100,3,4,3),
	  ('Conector','RJ45 Cat 5e no blindado',55,48,100,3,4,2),
	  ('Adaptador','DVI-I a VGA',32,22,100,8,4,3),
	  ('Adaptador','MHL a HDMI',17,14,100,8,4,3),
	  ('Adaptador','MHL a VGA',27,18,100,8,4,3),
	  ('Adaptador','VGA angulado 90 grados',110,99,100,5,4,3),
	  ('Conector','coaxial F-type RG6 macho twist on',78,57,100,6,4,3),
	  ('Conector','HDMI angulado 270 grados',12,7,100,8,4,3),
	  ('Conector','HDMI angulado Lateral derecha 270 grados',16,6,100,7,4,5),
	  ('Conector','VGA a RJ45',26,21,100,3,4,3),
	  ('Conector','Keystone HDMI hembra/hembra',33,17,100,3,4,3),
	  ('Adaptador','Splitter HDMI 1 entrada, 2 salidas',20,15,100,3,4,1),
	  ('Adaptador','Splitter VGA 1 entrada, 2 salidas',20,15,100,3,4,1),
	  ('Adaptador','Unión S-Video Hembra/Hembra',60,50,100,3,4,1),
	  ('Convertidor','Video balun borneras a BNC',20,18,100,6,4,1),
	  ('Teclado','USB K3',125,120,100,6,4,1),
	  ('Teclado','flexible ultra delgado',299,150,100,4,4,1),
	  ('Conectores','Hub USB 2.0 de 4 Puertos',35,25,100,4,4,3),
	  ('Conectores','Hub USB 2.0 de 7 Puertos con Adaptador de Corriente',45,35,100,8,4,1),
	  ('Teclado','Gamer',345,230,100,8,4,3),
	  ('Teclado','Gamer Multimedia',405,360,100,8,4,1),
	  ('Teclado','Gamer Multimedia Iluminado Marvo',415,387,100,8,4,2),
	  ('Mouse','Gamer',170,150,100,8,4,2),
	  ('Mouse','Gamer Multimedia',195,180,100,8,4,4),
	  ('Mouse','Inalambrico Microsoft Designer Bluetooth',175,145,100,4,4,7),
	  ('Bocinas','Back-UPS APC BX800L-LM De 800 VA',245,205,100,6,4,3),
	  ('Bocinas','Bocina Inalambrica Bluetooth Recargable',225,210,100,6,4,3),
	  ('Bocinas','Bocinas Multimedia 2.1 Estereo Subwoofer',275,215,100,6,4,5),
	  ('Bocinas','Bocinas Perfect Choice Koln Pc-112068',280,250,100,9,4,5),
	  ('Bocinas','Bocinas True Basix 2.0 Tb-02005',240,180,100,9,4,5),
	  ('Bocinas','Bocinas Logitech Z623 de 2.1 Canales 200 watts',235,200,100,12,4,3),
	  ('Bocinas','Bocina Portátil Recargable Logitech X50',345,245,100,12,4,3),
	  ('Teclado','Bluetooth teclado inalambrico para iPad',250,180,100,12,4,5),
	  ('Bateria','Bateria Dell Inspiron 1410, Vostro A840',899,730,100,12,4,5),
	  ('Ventilador','Ventilador Extractor De Aire Enfriador',300,280,100,12,4,3),
	  ('Audifonos','Diadema 201 Alta Fidelidad Con Microfono',120,80,100,12,4,5),
	  ('Mouse','Mouse Ratón Inalámbrico ópticos 2.4Ghz',250,180,100,12,4,3),
	  ('Teclado','EAGLE WARRIOR',435,355,100,11,4,3),
	  ('Adaptador','Adaptador Usb Ethernet Red Lan Ethernet rj45 a usb 2.0',75,65,100,9,4,3),
	  ('Audifonos','Audífonos Tipo Apple Earpods para Iphone',345,280,100,9,4,5),
	  ('Bateria','Bateria Toshiba C600 C645 C650 C655 C645',900,760,100,9,4,3),
	  ('Audifonos','Audifonos Sound Folding Wireless Bluetooth',250,180,100,9,4,3),
	  ('Tarjeta','Tarjeta De Video GB GV-R725OC-2GI AMD',450,380,100,9,4,3),
	  ('Audifonos','Audifonos Headphone Bluedio H-Turbine',250,180,100,9,4,3),
	  ('Audifonos','Audífonos Gamer Tipo Diadema Con Micrófono Marvo',225,180,100,9,4,3),
	  ('Mouse','Mouse Hp inalámbrico X3000',125,115,100,10,4,3),
	  ('Impresora','Impresora Láser HP LaserJet Pro M402dw',780,590,100,13,4,1),
	  ('Impresora','Multifuncional Canon PIXMA G2100',930,850,100,13,4,3),
	  ('Impresora','Multifuncional De Inyección Brother DCP-T300',1500,1350,100,13,4,3),
	  ('Impresora','Impresora De Inyección De Tinta A Color HP',1200,1100,100,13,4,3),
	  ('Impresora','Impresora Epson L120 con Sistema de Tinta Continua',755,550,100,13,4,1),
	  ('Impresora','Multifuncional de Tinta Inyectable',890,490,100,13,4,1),
	  ('Impresora','EPSON Impresora L310 33PPM Tinta Continua',1200,760,100,13,4,3),
	  ('Discos Rigidos','HD 100GB FUJITSU NOTEBOOK',500,270,4,2,6,5),
	  ('Disco Duro','DISCO DURO 80GB IDE ULTRA DMA 7200RPM',420,380,7,4,1,6),
	  ('Disco Duro','DISCO DURO 80GB IDE UDMA 7200RPM SAMSUNG 3 A¥OS GAR.',600,570,10,4,3,5),
          ('Disco Duro','DISCO DURO 160GB IDE ULTRA DMA 7200RPM',400,380,5,4,1,2),
          ('Disco Duro','DISCO DURO 160GB IDE UDMA 7200RPM SAMSUNG 3 A¥OS GAR.',430,390,7,4,4,1),
          ('Disco Duro','DISCO DURO 250GB IDE ULTRA DMA 7200RPM',410,380,5,1,4,3),
          ('Disco Duro','DISCO DURO 80GB SERIAL ATA 7200RPM',510,470,6,1,4,7),
          ('Disco Duro','DISCO DURO 160GB SERIAL ATA 7200RPM',530,500,7,4,1,5),
          ('Disco Duro','DISCO DURO 250GB SERIAL ATA 7200RPM',600,505,2,3,4,1),
          ('Disco Duro','DISCO DURO 300GB SERIAL ATA 7200RPM',500,405,3,4,2,8),
          ('Disco Duro','DISCO DURO 160GB SERIAL ATA II 300MB/SEG 7200RPM',530,470,2,1,2,9),
          ('Disco Duro','DISCO DURO 250GB SERIAL ATA II 300MB/SEG 7200RPM',500,482,7,4,1,7),
          ('Disco Duro','DISCO DURO 320GB SERIAL ATA II 300MB/SEG 7200RPM',510,450,3,3,1,5),
          ('Disco Duro','DISCO DURO 500GB SERIAL ATA II 500MB/SEG 7200RPM',440,370,7,4,1,9),
          ('Disco Duro','DISCO DURO 2.5" 80GB IDE 4200RPM',500,440,7,4,1,5),
          ('Disco Duro','DISCO DURO 2.5" 120GB IDE 4200RPM',520,495,1,6,2,3),
	  ('Disco Duro','DISCO DURO SEAGATE PORTATIL 160GB EXTERNO USB 2.0',400,370,4,4,1,2),
	  ('Disco Duro','DISCO DURO EXT. SEAGATE 250GB USB 2.0',600,570,2,1,2,4),
	  ('Disco Duro','DISCO DURO SEAGATE 320GB EXTERNO USB 2.0 /eSATA ',400,370,7,4,1,5),
	  ('Disco Duro','DISCO DURO EXT. 2.5" IOMEGA 100GB USB 2.0"',600,590,2,4,5,5),
	  ('Disco Duro','DISCO DURO IOMEGA EGO PORTATIL 160GB USB 2.0 ',620,600,8,4,1,5),
	  ('Disco Duro','DISCO DURO EXT. IOMEGA 250GB USB 2.0 ',600,580,7,2,4,6),
	  ('Disco Duro','DISCO DURO EXT. IOMEGA 1 TB USB 2.0',690,450,7,4,1,5),
	  ('Disco Duro','DISCO DURO EXT. IOMEGA 1 TB USB 2.0 FIREWIRE / ULTRAMAX',700,570,7,4,1,5),
	  ('Disco Duro','DISCO DURO EXT. MAXTOR 300GB USB 2.0',400,450,4,4,4,3),
	  ('Pantalla','PANTALLA LCD AOC 17"',300,270,3,2,1,2),
	  ('Pantalla','PANTALLA LCD AOC 19" WIDE',330,260,1,3,4,9),
	  ('Pantalla','PANTALLA LCD AOC 22" WIDE',430,330,7,4,1,2),
	  ('Pantalla','PANTALLA LCD SAMSUNG 17" 710N',230,210,4,4,5,1),
	  ('Pantalla','PANTALLA LCD SAMSUNG 17" WIDE',250,210,7,4,1,5),
	  ('Pantalla','PANTALLA LCD SAMSUNG 19" WIDE 940NW',430,360,1,3,2,5),
	  ('Pantalla','PANTALLA LCD 17" LG',430,320,1,2,1,5),
	  ('Pantalla','PANTALLA LCD 19" LG WIDE',380,260,2,1,2,7),
	  ('Pantalla','PANTALLA LCD 15" VE510s VIEWSONIC',430,290,1,4,1,1),
	  ('Pantalla','PANTALLA LCD 17" VIEWSONIC',340,290,7,4,4,6),
	  ('Pantalla','PANTALLA LCD 17" VA1703wb VIEWSONIC',420,380,3,2,1,2),
	  ('Pantalla','PANTALLA LCD 19" WIDE VIEWSONIC / optiquest',330,290,2,4,1,9),
	  ('Pantalla','PANTALLA LCD 20" WIDE OPTIQUEST By VIEWSONIC',420,325,1,2,5,5),
	  ('Pantalla','PANTALLA LCD 20" WIDE VIEWSONIC',430,260,1,3,3,4),
	  ('Pantalla','PANTALLA LCD/TV 19" AOC TV TUNNER',510,460,3,1,3,3),
	  ('Pantalla','PANTALLA LCD/TV 32" AOC TV TUNNER',440,320,7,4,1,5),
	  ('Pantalla','PANTALLA LCD tV 32" VIEWSONIC 1368*768 HDTV N3251/60W',330,260,7,4,1,9),
	  ('Pantalla','PANTALLA LCD/TV 32" SAMSUNG BORDEAUX HD LN32S81BDX',480,420,1,4,1,5),
	  ('Pantalla','PANTALLA LCD/TV 32" TOSHIBA REGZA 32HL86',590,560,1,2,1,7),
	  ('Pantalla','PANTALLA LCD/TV 44" PHILIPS',700,700,1,2,1,7)
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
		  ('Elvin Morales','278638-8','Ciudad',1,34064744,1),
		  ('Zelik Ramirez','912201-3','8va avenida calle 4-05 Zona 1',2,49500324,1),
		  ('Hamilton Lopez','57768-2','7ma avenida Zona 1',1,52534588,2),
		  ('Nicolas Hagen','435647-6','8va avenida calle 2-01 Zona 8',4,46102241,3),
		  ('Mauro Portillo','64356-7','2da avenida calle 7-09 Zona 10',10,54675465,4),
		  ('Agustin Herrera','456754-1','8ra avenida calle 5-05 Zona 3',6,46563452,1),
		  ('Bryan Ordoñez','763224-9','9na avenida calle 4-05 Zona 1',7,54235468,5),
		  ('Carlos Ruiz','672143-1','7ma avenida calle 6-05 Zona 2',13,31246578,2),
		  ('Guillermo Alvarez','2134567-2','5ta avenida calle 2-03 Zona 4',22,56789832,1),
		  ('Cristian Sanchez','678542-2','5ta avenida calle 7-05 Zona 2',25,54678765,5),
		  ('Gaston Puerari','653208-6','6ta avenida calle 9-03 Zona 1',9,42312345,2),
		  ('Paulo Mota','5443525-2','4ta avenida calle 4-05 Zona 1',19,32457687,3),
		  ('Darwin Oliva','554243-7','8va avenida calle 2-04 Zona 4',20,54555445,4),
		  ('Carlos Kamiani','654387-3','7ma avenida calle 9-25 Zona 3',24,77543457,1),
		  ('Osman Lopez','324567-1','3ra avenida calle 8-15 Zona 8',42,43657843,1),
		  ('Luis suarez','534121-8','5ta avenida calle 2-05 Zona 2',25,44032881,1),
		  ('Pedro Altan','564321-7','9na avenida calle 3-05 Zona 4',30,31498790,3),
		  ('Jaime Alas','762346-3','8va avenida calle 4-05 Zona 1',14,49163929,1),
		  ('Danilo Guerra','413389-1','6ta avenida calle 3-07 Zona 2',22,45388396,1),
		  ('John Mendez','475432-9','9na avenida calle 2-07 Zona 1',45,30182131,1),
		  ('Ricardo Foster','7865432-3','4ta avenida calle 4-05 Zona 3',24,50000908,1),
		  ('Dennis Laparra','458321-1','9na avenida calle 1-05 Zona 2',32,44678798,3),
		  ('Dario Flores','974653-8','8va avenida calle 4-05 Zona 1',15,41793175,1),
		  ('Jefri Payeras','8634503-8','9na avenida calle 3-05 Zona 4',10,59753476,1),
		  ('Cristian Jimenez','543678-2','5ta avenida calle 7-05 Zona 2',44,71713245,2),
		  ('Alexis Matta','876543-9','2da avenida calle 7-09 Zona 10',22,54194562,4),
		  ('Gustavo Machain','87532-1','7ma avenida calle 6-05 Zona 2',32,49793176,2),
		  ('Jonatan Lopez','434567-1','7ma avenida calle 6-05 Zona 9',27,54657843,1),
		  ('Israel Silva','3234121-8','8va avenida calle 4-05 Zona 1',26,56032881,1),
		  ('Kevin Arreola','824321-7','9na avenida calle 3-05 Zona 4',40,51498790,3),
		  ('Fernando Paterson','212346-3','6ta avenida calle 9-03 Zona 1',29,74163929,1),
		  ('Jonny Cubero','513389-1','6ta avenida calle 3-07 Zona 2',42,55388396,1),
		  ('Milton Sanchez','375432-9','9na avenida calle 2-07 Zona 1',35,50182131,1),
		  ('Tyson Nuñez','2865432-3','5ta avenida calle 2-03 Zona 4',44,30000908,1),
		  ('Edison Escobar','658321-1','9na avenida calle 1-05 Zona 2',42,34678798,3),
		  ('Rudy Diaz','774653-8','8va avenida calle 4-05 Zona 1',35,41793175,1),
		  ('Rocio Rodas','9634503-8','9na avenida calle 3-05 Zona 4',30,56789832,1),
		  ('Glandys Samayoa','843678-2','5ta avenida calle 7-05 Zona 2',21,41713245,2),
		  ('William Reyes','476543-9','2da avenida calle 7-09 Zona 10',41,44194562,4),
		  ('Daniela Ramirez','37532-1','7ma avenida calle 6-05 Zona 2',35,59793176,2),
		  ('Vicenta Sanchez','8738-1','8va avenida calle 2-2 Zona 3',35,38482333,2),
		  ('Tuti Reyes','92893-2','la calle 1',35,78672344,1),
		  ('Mario Casas','29891-9','en la esquina',35,89293992,2),
		  ('Armando Casas','783648-1','calle principal',35,27392922,2),
		  ('Leonel Messi','37532-1','zona 1',35,27382782,2),
		  ('Maria De Leon','199988-2','7ma avenida',35,29839912,2),
		  ('Salvador Casas','288288-1','calle 6-05 Zona 5',35,59793176,2),
		  ('Rosario Castañeda','636363-1','Zona 2',35,27382888,2),
		  ('Ricardo Arjona','372773-3','circunvalacion',35,98297922,2),
		  ('Elisandro Mendoza','321232-1','calzada las palmas',35,87268373,2),
		  ('Ana Garcia','68688-1','7ma avenida calle 6-05 Zona 2',35,23564533,2),
		  ('Ana Paula','37532-1','la trinidad',35,59793176,2),
		  ('Paola Mendez','98799-4','san luis',35,39279893,2),
		  ('Sergio Alegria','98233-1','las mariposas',35,73823844,2),
		  ('Daniel Catalan','666637-1','el cruce',35,77738422,2),
		  ('Daniela Catalan','1923-2','la cuchilla',35,78288733,2),
		  ('Frans Perez','22636-1','cuatro caminos',35,27838782,2),
		  ('Juan Garcia','37532-1','canton san luis',35,34344331,2),
		  ('Juan Diego','234333-1','canton vela',35,27676333,2),
		  ('Brian Reyes','37532-1','canton ocosito',35,27387278,2),
		  ('Pedro Ulises','788888-2','las lagunas',35,27838282,2),
		  ('Marco de Tropoya','37532-1','la vecindad',35,27838233,2),
		  ('Gamaiel Montesino','998839-2','la tortuga',35,78287382,2),
		  ('Rebeca Arduino','878787-1','las cruces',35,37828212,2),
		  ('Roberta Aquino','7828783-1','la estacion',35,27878728,2),
		  ('Daniela Romulo','238721-2','el cementerio',35,87234565,2),
		  ('Gloria Moyo','378842-1','zona 5',35,59793176,2),
		  ('Marile Moyo','2873887-1','villa del mar',35,23434334,2),
		  ('Heidy Santay','23432-1','monterrey',35,23434433,2),
		  ('Yolanda Casas','23453311-1','las lomas',35,23425533,2),
		  ('America Acero','554346-3','lo mas bajo',35,87838833,2),
		  ('Salvador Mans','342344-1','7ma avenida calle 6-05 Zona 2',35,59793176,2),
		  ('Margarita Garcia','299938-1','las reformas',35,77398444,2),
		  ('Lucia Casanova','1239992-2','las casas',35,59793176,2),
		  ('Carla Wins','23431-3','las vegas',35,82893212,2),
		  ('Willian Mendoza','34323-1','las flores',35,37848734,2),
		  ('Betty Flores','89899-1','champerico',35,27387878,2),
		  ('Remigio Chanique','89989-1','ciudad modelo',35,77676734,2),
		  ('John Cena','56455-1','7ma avenida calle 6-05 Zona 2',35,59793176,2),
		  ('Juan Gabriel','54556-1','el retiro',35,63722833,2),
		  ('Daniel Romo','87238-1','sector la villa',35,67637443,2),
		  ('Marisela Smith','23424-6','sector 7',35,37834423,2),
		  ('Yolanda Centauro','98998-7','ana lucia',35,72873483,2),
		  ('Maria Cirena','234423-1','canton peru',35,59793176,2),
		  ('Jesus Gonzales','637647-1','14 de obtubre canton peru',35,34355344,2),
		  ('Luis Flores','42343-4','la ratonera',35,67776763,2),
		  ('Efrain Gomez','888902-1','la terminal',35,33878787,2),
		  ('Eloisa Casas','788667-1','el mercadito',35,78823444,2),
		  ('Edgardo del Villar','98374-1','la vueltesita',35,77887733,2),
		  ('Edith Gomez','783878-1','Zona 2',35,59793176,2),
		  ('Rut Reyes','82882-8','Zona 12',35,4888787,2),
		  ('Rubi Comejen','234343-1','el barrio',35,27838233,2),
		  ('Elena Clean','829982-1','el bulevard',35,78834233,2),
		  ('Eleonor Vens','878299-1','los patos',35,87288334,2),
		  ('Elsa Chirmol','72887-1','las delicias',35,34342233,2),
		  ('Emilio De León','233444-1','vista hermosa',35,334442233,2),
		  ('Enrique Griego','333445-6','xula',35,34342221,2),
		  ('Erico Gomez','2222123-1','el porvenir',35,34893834,2),
		  ('Erick Villatoro','7819922-1','la riviera',35,59793176,2),
		  ('Erika Dom','373432-1','el chasis',35,73742334,2),
		  ('Luis De Leon','788782-1','el centenario',35,77883843,2),
		  ('Ernesto Pepito','24442-1','las gaviotas',35,37883843,2),
		  ('Estela Santay','472783-2','canto el recuerdo',35,59793176,2),
		  ('Elias Maldonado','74883-1','zona 13',35,78887322,2),
		  ('Elias Campano','343432-1','7ma avenida calle 6-05 Zona 2',35,23434523,2),
		  ('Gari Gutierrez','53323-1','Barsovia',35,78823423,2),
		  ('Florentino Chavez','33334-1','el olivo',35,34317664,2),
		  ('Eloina Pluton','342434-1','la villa',35,73828732,2),
		  ('Ezequiel Ranch','737723-4','los volcanes',35,28399231,2),
		  ('John Rambo','19787-1','las flores',35,34788737,2),
		  ('Margarito Margot','88989-1','las vegas',35,73887834,2),
		  ('Laura Laurin','889939-3','las delicias',35,89293821,2),
		  ('Luz Maria','172782-1','las vegitas',35,27878731,2),
		  ('Hugo Chavez','12783-1','el tractorcito',35,27384872,2),
		  ('Daniel Laruso','2344-1','la maquina',35,27878873,2),
		  ('Samuel Miyagi','3134-5','caballo blanco',35,23432344,2),
		  ('Sara Gallo','342423-1','la guitarra',35,79898983,2),
		  ('Liz Uz','2342333-1','el guitarron',35,37887423,2),
		  ('Rigoberta Menchu','899982-1','la vueltecita',35,23423442,2),
		  ('Eufemia Flores','88787-1','ciudad modelo',35,89991233,2),
		  ('Ruben Morales','787865-1','camino la verde',35,12358922,2),
		  ('Cindy De Leon','34343-1','el puca',35,77879122,2),
		  ('Marcelo Calvo','22323-1','canton recuerdo',35,78781234,2),
		  ('Domini Uz','999987-1','el rincon',35,88981234,2),
		  ('Tommy Vargas','43424-1','Zona 2',35,78872432,2),
		  ('Luis Casas','78684-1','7ma avenida calle 6-05 Zona 2',35,98923456,2),
		  ('Mario Casas','8976654-1','canton dolores',35,71828322,2),
		  ('Carmen Vicente','342432-1','la esquinita',35,76677121,2),
		  ('Mirian Hernandez','67576-5','la villa',35,26565312,2),
		  ('Sara Vicente','8987987-1','la cuarta',35,98876623,2),
		  ('Orfa Maldonado','21233-1','monterrey',35,12347823,2),
		  ('Lorenza Flores','3223123-1','canton peru',35,66267723,2),
		  ('Lucero Guerra','566565-6','la cuchilla',35,16277355,2),
		  ('Mayra Gutierrez','76576-1','la guitarra',35,87623156,2),
		  ('Cautemo Blanco','9989879-8','zona 18',35,73884245,2),
		  ('Hugo Castro','8978778-8','el barrio',35,78788234,2),
		  ('Barbara Bermudo','89995-7','canton san luis',35,15278734,2),
		  ('Pamela Silva','9845354-4','barrio san luis',35,78872342,2),
		  ('Tony Andrade','432489-1','vista hermosa',35,78871234,2),
		  ('Flora Peluche','76534-1','tableros',35,77676238,2),
		  ('Helmer Puac','26173-2','la guitarra',35,77714272,1),
		  ('Juan Sanic','87459-0','el manchon',35,77714282,1),
		  ('Maylin Chochon','34552-2','el retiro',35,77714292,1),
		  ('Edith Chum','97645-4','las pilas',35,77714202,1),
		  ('Sindy Casta','23454-0','las flores',35,77714262,1),
		  ('Emerson Quiej','96462-2','las delicias',35,77714252,1),
		  ('Jaqueline Guadarrama','74853-1','texococo',35,77714242,1),
		  ('Jennifer Arellano','83462-9','5ta avenida 1ra. calle zona 1',35,77714232,1),
		  ('Gaby Graciel','34701-5','canton peru',35,77714222,1)
      
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
		  ('Freddy Herrera','8754332-8','Colonia Mendizabal Zona 2',35,41793176,6),
		  ('David Espinoza','1416539-2','7ma avenida calle 6-05 Zona 2',9,59793176,1),
		  ('Selvin Gudiel','543667-7','2da avenida calle 7-09 Zona 10',3,44194562,2),
		  ('Kevin Carreto','324432-1','5ta avenida calle 7-05 Zona 2',7,34678798,4),
		  ('Alvaro Ticuru','12345-7','9na avenida calle 3-05 Zona 4',11,54563321,6),
		  ('David Guerra','444444-1','8va avenida calle 4-05 Zona 1',12,34678798,5),
		  ('Jorge Izazola','7654324-9','2da avenida calle 7-09 Zona 10',13,54326690,3),
		  ('Pablo Silva','6789445-1','6ta avenida calle 9-03 Zona 1',14,50182131,6),
		  ('Jorge Mario ','000000-2','5ta avenida calle 7-05 Zona 2',15,78710432,2),
		  ('Juan Paredes','1111111-2','4ta avenida calle 4-05 Zona 3',16,51356743,5),
		  ('Diego Orozco','6539808-6','8va avenida calle 4-05 Zona 1',6,48345564,4),
		  ('Jimmy Moraes','5467325-2','2da avenida calle 7-09 Zona 10',19,47715127,4),
		  ('Dayana Morales','5643243-7','5ta avenida calle 7-05 Zona 2',20,50753476,2),
		  ('Jorge Ortiz','1223436-3','5ta avenida calle 7-05 Zona 5',4,37713245,5),
		  ('Marlon Negrete','2133879-1','4ta avenida calle 4-05 Zona 6',2,41194562,3),
		  ('Fredy Orellana','8754332-8','8va avenida calle 4-05 Zona 1',15,42793176,6)
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
      ('Cable','Apple LightNigth',200,150,15,13,3,1),('Cable Adaptador','Microsoft Wireless Adapter',200,100,25,3,1,4),
      ('Espuma Limpiadora','Kit Limpieza',60,22,15,13,3,1),('Limpia Contactos','Kit Limpieza',80,32,25,13,3,2)
      
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
      
use ComputerDB

insert into Pais(nombrePais) values('Guatemala'),
									('Mexico')
go

insert into Departamento(nombreDepartamento,idPais) values ('Retalhuleu',1),
													('mazatenango',1),
													('Quetzaltenango',1),
													('Solola',1),
													('San Marcos',1),
													('Huehuetenango',1)
go

insert into Municipio(nombreMunicipio,idDepartamento,idPais) values('san felipe',1,1),
															('san Carlos',1,1),
															('san Martin',1,1),
															('Mulua',1,1),
															('Champerico',1,1)
go

--Esta insercion de sucursal ya no funciona
--insert into sucursal(nombreSucursal,idMunicipio) values('la bendicion',1),
--													('la pudricion',1),
--													('las joyas',1),
--													('las putas',1),
--													('los sexy lady',1)
--go

--Esta insercion es la correcta para sucursal
insert into sucursal values ('La Soledad',1,2);
insert into sucursal values ('La Trinidad',1,1);
insert into sucursal values ('La Esperanza',1,1);
insert into sucursal values ('Matamoros',1,2);
insert into sucursal values ('El centro',2,3);
insert into sucursal values ('El universo',3,3);
insert into sucursal values ('La Campana',4,3);
insert into sucursal values ('El parque',5,3);
insert into sucursal values ('Nueva Luna',6,3);
insert into sucursal values ('Nueva Linda',7,3);
insert into sucursal values ('El palmar',8,3);
insert into sucursal values ('Florista',9,3);
insert into sucursal values ('Loma linda',10,3);
insert into sucursal values ('Intcomex',11,3);
insert into sucursal values ('El punto',2,3);
insert into sucursal values ('Bodeguitas',1,4);
insert into sucursal values ('Las Palmas',1,4);
insert into sucursal values ('San Carlos',1,4);
insert into sucursal values ('Parcelas',1,4);
insert into sucursal values ('Nuevo Amanecer',2,4);
insert into sucursal values ('El Tunel',3,4);
insert into sucursal values ('Sercom',4,4);
insert into sucursal values ('Access',5,4);
insert into sucursal values ('La sirena',6,4);
insert into sucursal values ('La Patrona',7,4);
insert into sucursal values ('El Gallo',8,4);
insert into sucursal values ('La Blanca',9,4);
insert into sucursal values ('Educom',10,4);
insert into sucursal values ('Guateexx',11,4);
insert into sucursal values ('Zona Verde',2,4);
insert into sucursal values ('La Soledad II',1,5);
insert into sucursal values ('La Trinidad II',1,5);
insert into sucursal values ('La Esperanza II',1,5);
insert into sucursal values ('Matamoros II',1,5);
insert into sucursal values ('El centro II',2,5);
insert into sucursal values ('El universo II',3,6);
insert into sucursal values ('La Campana II',4,6);
insert into sucursal values ('El parque II',5,6);
insert into sucursal values ('Nueva Luna II',6,6);
insert into sucursal values ('Nueva Linda II',7,6);
insert into sucursal values ('El palmar II',8,6);
insert into sucursal values ('Florista II',9,6);
insert into sucursal values ('Loma linda II',10,7);
insert into sucursal values ('Intcomex II',11,7);
insert into sucursal values ('El punto II',2,7);
insert into sucursal values ('Bodeguitas II',1,7);
insert into sucursal values ('Las Palmas II',1,7);
insert into sucursal values ('San Carlos II',1,7);
insert into sucursal values ('Parcelas II',1,7);
insert into sucursal values ('Nuevo Amanecer II',2,7);
insert into sucursal values ('El Tunel II',3,7);
insert into sucursal values ('Sercom II',4,8);
insert into sucursal values ('Access II',5,8);
insert into sucursal values ('La sirena II',6,8);
insert into sucursal values ('La Patrona II',7,8);
insert into sucursal values ('El Gallo II',8,8);
insert into sucursal values ('La Blanca II',9,8);
insert into sucursal values ('Educom II',10,8);
insert into sucursal values ('Guateexx II',11,8);
insert into sucursal values ('Zona Verde II',2,8);


