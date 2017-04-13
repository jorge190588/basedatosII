use master;

if db_id('ComputerDB') is not null begin
   print 'db exists'
   drop database ComputerDB;
end

create database ComputerDB;
use ComputerDB;

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
direccion varchar(255),
idMunicipio int,
telefono int,
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

create table Cliente_categoria(
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

select * from clientes


