use master;

-- first step
use master;

-- second step
if db_id('ComputerDB') is not null begin
   print 'db exists'
   alter database ComputerDB set single_user with rollback immediate
   drop database ComputerDB;
end

-- Third step
create database ComputerDB;
go
--four step
use ComputerDB;

-- five step, create tables
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

--tabla tipo bodega(hardware,software)
create table tipoBodega( 
idtipoBodega int not null identity primary key,
nombreTipoBodega varchar(40)
);
go

--tabla estado bodega
create table estadoBodega(
idestadoBodega int not null identity primary key,
estadoBodega varchar(80)
);
go

--tabla bodega a producto
create table bodega(
idBodega int not null identity primary key,
nombreBodega varchar(80),
idtipoBodega int,
idestadoBodega int,
constraint fk_idtipoBodega foreign key(idtipoBodega) references tipoBodega(idtipoBodega),
constraint fk_idestadoBodega foreign key(idestadoBodega) references estadoBodega(idestadoBodega)
);
go

-- Tabla Productos, en esta tabla hay referencias a las tablas anteriores
create table Productos(
id int primary key not null identity,
codigo varchar(50),
nombre varchar(100),
descripcion varchar(255),
precio float,
costo float,
existencia int,
idMarca int,
idDimension int,
idColor int,
idBodega int
constraint fk_marca foreign key(idMarca) references Marca(idMarca),
constraint fk_dimension foreign key(idDimension) references Dimension(idDimension),
constraint fk_color foreign key(idColor) references Color(idColor),
constraint fk_bodega foreign key(idBodega) references bodega(idBodega)
);
go


-- Tablas Pais, Departamento y Municipio
create table Pais(
	idPais int not null primary key identity,
	nombrePais varchar(100)
);
go

--tabla departamento
create table Departamento(
	idDepartamento int not null primary key identity,
	nombreDepartamento varchar(100),
	idPais int,
	constraint fk_pais foreign key (idPais) references Pais(idPais)
);
go 



--tabla municipio
create table Municipio(
	idMunicipio int not null primary key identity,
	nombreMunicipio varchar(100),
	idDepartamento int,
	idPais int,
	constraint fk_departamento foreign key(idDepartamento) references Departamento(idDepartamento),
	constraint fk_pais2 foreign key (idPais) references pais(idPais)
);
go

--tabla sucursal
create table sucursal(
idSucursal int not null identity primary key,
nombreSucursal varchar(80),
idMunicipio int,
constraint municipio_fk foreign key(idMunicipio) references Municipio(idMunicipio)
);
go

--tabla tipo cliente
create table tipoCliente(
idtipoCliente int not null identity primary key,
nombre varchar(80)
);
go

-- Tabla Forma de Pago
create table FormaDePago(
idFormaPago int not null identity primary key,
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
idtipoCliente int,
idFormaPago int,
Clasificacion_ID int,
constraint fk_Municipio foreign key(idMunicipio)references Municipio(idMunicipio),
constraint fk_idtipoCliente foreign key(idtipoCliente) references tipoCliente(idtipoCliente),
constraint fk_formaPago foreign key(idFormaPago)references FormaDePago(idFormaPago)
);
go

--tabla tipo proveedor
create table tipoProveedor(
idtipoProveedor int not null identity primary key,
nombre varchar(80)
);
go


-- Tabla Proveedor
create table Proveedor(
idProveedor int not null primary key identity,
nombreProveedor varchar(100),
nit varchar(10),
direccion varchar(255),
idMunicipio int,
telefono int,
idFormaPago int,
idtipoProveedor int,
constraint fk_idMunicipio foreign key(idMunicipio)references Municipio(idMunicipio),
constraint fk_formaDePago foreign key(idFormaPago)references FormaDePago(idFormaPago),
constraint fk_idtipoProveedor foreign key(idtipoProveedor) references tipoProveedor(idtipoProveedor)
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
constraint fk_Cliente foreign key(idCliente)references Clientes(idCliente),
);
go

-- Tabla SalidaDetalle
create table SalidaDetalle(
idSalidaDetalle int not null primary key identity,
idSalida int,
idProducto int,
cantidad int,
precio float,
costoTotal float
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
go

-- Tabla EntradaDetalle
create table EntradaDetalle(
idEntradaDetalle int not null primary key identity,
idEntrada int,
idProducto int,
cantidad int,
precio float,
costoTotal float
constraint fk_idEntrada foreign key(idEntrada)references Entrada(idEntrada)
);
go

create table clienteCategoria(
	id int primary key not null identity,
	nombre varchar(50),
	montoInicial decimal(18,2),
	montoFinal decimal(18,2)
);
go

use ComputerDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Santos
-- Create date: 01/04/2017
-- Description:	Add comment to column field on table
-- =============================================
create PROCEDURE dbo.table_column_description_insert
	@tableName varchar(100),
	@columnName varchar(50),
	@description varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    EXEC sp_addextendedproperty 
@name = N'MS_Description', @value = @description,
@level0type = N'Schema', @level0name = 'dbo', 
@level1type = N'Table',  @level1name = @tableName, 
@level2type = N'Column', @level2name = @columnName;

END
GO





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jorge Santos
-- Create date: 01/04/2017
-- Description:	Select table comments
-- =============================================
CREATE PROCEDURE dbo.table_column_description_select
	@table varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     select 
        st.name [Table],
        sc.name [Column],
        sep.value [Description]
    from sys.tables st
    inner join sys.columns sc on st.object_id = sc.object_id
    left join sys.extended_properties sep on st.object_id = sep.major_id
                                         and sc.column_id = sep.minor_id
                                         and sep.name = 'MS_Description'
    where st.name = @table
    
END
GO





/*command for select definition table */

-- exec dbo.table_column_description_insert 'Cliente_categoria','montoInicial','Monto inicial en unidades monetarias de ventas la clasificacion ABC de client'
-- exec sp_columns Cliente_categoria
-- EXEC sp_help Cliente_categoria
-- Select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'Cliente_categoria'
-- select @@SERVERNAME

ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Productos]
GO


--tabla del estado del usuario(activo,inactivo)
create table EstadoUsuario(
idEstado int not null identity primary key,
nombreEstado varchar(80)
);
go

--tabla de tipo_usuario es como admin,usuario normal,cajero
create table TipoUsuario(
idTipoUsuario int not null identity primary key,
nombreTipoUsuario varchar(80)
);
go

--tabla de acceso para diferentes modulos como ventas,inventario,compras,etc.
create table AccesoUsuario(
idAcceso int not null identity primary key,
nombreAcceso varchar(80),
);
go

--tabla de usuario depende de tipo_usuario,de estado_usuario, y acceso_usuario
create table Usuarios(
idUsuario int not null identity primary key,
nombreUsuario varchar(80),
apellidoUsuario varchar(80),
nickUsuario varchar(80),
contraseña varchar(20),
idTipoUsuario int,
idEstado int,
idAcceso int,
constraint idTipoUsuario_fk foreign key(idTipoUsuario) references TipoUsuario(idTipoUsuario),
constraint idEstado_fk foreign key(idEstado) references EstadoUsuario(idEstado),
constraint idAcceso_fk foreign key(idAcceso) references AccesoUsuario(idAcceso)
);
go

--se agregaron las 3 tablas solicitadas para salidas 
create table Descuento
(
idDescuento int Identity(1,1) Primary Key,
Descuento int
)
go

create table Promocionales
(
idPromocional int identity(1,1) primary key,
promocional varchar (40)
)
go

create table Rango_Consumo
(
IdRango int identity(1,1) primary key,
Rango varchar (30)
)
go

--se modifico la tabla clasificacioncliente, se agregaron atributos para que los tipos dependiendo de su consumo 
--puedan tomar una clasificacion como clientes VIP, PRIMIUM, ALTO, MEDIANO, BAJO 

create table Clasificacion
(
IdClasificacion int identity(1,1) primary key,
Clasificacion varchar (5),
RangoConsumo_Id int,
Descuento_Id int,
Promocional_Id int,
constraint RangoConsumo_Id foreign key(RangoConsumo_Id) references Rango_Consumo(IdRango),
constraint Descuento_Id foreign key (Descuento_Id) references Descuento(idDescuento),
constraint Promocional_Id foreign key (Promocional_Id) references Promocionales(idPromocional)
)
go

--se altero la tabla clientes para relacinarla con Clasificacion
alter table clientes add constraint Clasificacion_ID_fk foreign key (Clasificacion_ID) 
references Clasificacion(IdClasificacion)

go
--se elimino cliente categoria ya que no estaba relacionada
drop table clienteCategoria

go
-- Corrigiendo Tabla Sucursal
drop table sucursal

go
--tabla sucursal
create table sucursal(
idSucursal int not null identity primary key,
nombreSucursal varchar(80),
idMunicipio int,
idCliente int not null,
constraint municipio_fk foreign key(idMunicipio) references Municipio(idMunicipio),
constraint cliente_fk foreign key(idCliente) references Clientes(idCliente)
);
