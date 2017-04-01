--ssh-keygen -t rsa -b 4096 -C guayoswing@gmail.com"
create database ComputerDB
use ComputerDB
go
-- creación de tablas independientes

-- Tabla Marca, la tabla productos depende de esta
create table Marca(
idMarca int primary key not null identity,
nombreMarca varchar(50)
);
go
-- Tabla Color, la tabla productos depende de esta
create table Color(
idColor int primary key not null identity,
nombreColor varchar(50)
);
go
-- Tabla Dimensión, la tabla productos depende de esta
create table Dimension(
idDimension int primary key not null identity,
nombreDimension varchar(50),
alto float,
ancho float 
);
go

-- Tabla Productos, en esta tabla hay referencias a las tablas anteriores
create table Productos(
idProducto int primary key not null identity,
nombreProducto varchar(100),
descripcionProducto varchar(255),
precio float,
costo float,
existencia int,
idMarca int,
idDimension int,
idColor int,
constraint fk_marca foreign key(idMarca) references Marca(idMarca),
constraint fk_dimension foreign key(idDimension) references Dimension(idDimension),
constraint fk_color foreign key(idColor) references Color(idColor)
);
go


-- Tablas Pais, Departamento y Municipio
create table Pais(
	idPais int not null primary key identity,
	nombrePais varchar(100)
);
go

create table Departamento(
	idDepartamento int not null primary key identity,
	nombreDepartamento varchar(100),
	idPais int,
	constraint fk_pais foreign key (idPais) references Pais(idPais)
);
go 

create table Municipio(
	idMunicipio int not null primary key identity,
	nombreMunicipio varchar(100),
	idDepartamento int,
	idPais int,
	constraint fk_departamento foreign key(idDepartamento) references Departamento(idDepartamento),
	constraint fk_pais2 foreign key (idPais) references pais(idPais)
);
go

-- Tabla Forma de Pago
create table FormaDePago(
idFormaPago int not null primary key identity,
nombre varchar(100)
);
go

--Tabla Clientes 
create table Clientes(
idCliente int not null primary key identity,
nombreCliente varchar(100),
nit varchar(10),
direccion varchar(255),
idMunicipio int,
telefono int,
idFormaPago int,
constraint fk_Municipio foreign key(idMunicipio)references Municipio(idMunicipio),
constraint fk_formaPago foreign key(idFormaPago)references FormaDePago(idFormaPago)
);
go

-- Tabla Proveedor
create table Proveedor(
idProveedor int not null primary key identity,
nombreProveedor varchar(100),
nit varchar(10),
telefono int,
direccion varchar(255),
idMunicipio int,
idFormaPago int,
constraint fk_idMunicipio foreign key(idMunicipio)references Municipio(idMunicipio),
constraint fk_formaDePago foreign key(idFormaPago)references FormaDePago(idFormaPago)
);
go

-- Tabla Clasificación de Cliente
-- Se clasificacn los clientes segun las ventas A,B,C, etc
create table ClasificacionCliente(
idClasificacion int not null primary key identity,
nombreClasificacion varchar(10),
ventaMinima float,
ventaMaxima float
);
go

-- Tablas Salida y SalidaDetalle
create table Salida(
idSalida int not null primary key identity,
fecha date,
documento varchar(20),
idCliente int,
constraint fk_Cliente foreign key(idCliente)references Clientes(idCliente)
);

-- Tabla SalidaDetalle
create table SalidaDetalle(
idSalidaDetalle int not null primary key identity,
idSalida int,
idProducto int,
cantidad int,
precio float,
costo float
constraint fk_idSalida foreign key(idSalida)references Salida(idSalida)
);
go

-- Tablas Entrada y EntradaDetalle
create table Entrada(
idEntrada int not null primary key identity,
fecha date,
documento varchar(20),
idProveedor int,
constraint fk_Proveedor foreign key(idProveedor)references Proveedor(idProveedor)
);

-- Tabla EntradaDetalle
create table EntradaDetalle(
idEntradaDetalle int not null primary key identity,
idEntrada int,
idProducto int,
cantidad int,
precio float,
costo float
constraint fk_idEntrada foreign key(idEntrada)references Entrada(idEntrada)
);
go

