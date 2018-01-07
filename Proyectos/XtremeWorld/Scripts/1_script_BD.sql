create database XtremeWorld;

use XtremeWorld;

create table FormatoIdPersona (
	id int primary key not null identity,
	descripcion varchar(20) not null unique
);	

create table Genero (
	id int primary key not null identity,
	descripcion varchar(20) not null unique
);


create table Dia (
	id int primary key not null,
	descripcion varchar(30) not null unique
);


create table Pais (
	id int primary key not null identity,
	nombre varchar(50) not null unique
);

create table Departamento (
	id int primary key not null identity,
	nombre varchar(50) not null unique,
	id_pais int not null,
	constraint fk_paisDepartamento foreign key (id_pais) references Pais(id)
);

create table Area (
	id int primary key not null identity,
	nombre varchar(30) not null unique
);

create table FormaPago (
	id int primary key not null identity,
	descripcion varchar(40) not null unique
);

create table Categoria (
	id int primary key not null identity,
	descripcion varchar(30) not null unique
);

create table Cargo (
	id int primary key not null identity,
	descripcion varchar(50) not null unique
);

create table TipoRegistro (
	id int primary key not null identity,
	descripcion varchar(20) not null unique
);

create table TipoSalario (
	id int primary key not null identity,
	descripcion varchar(30) not null unique
);

create table Persona (
	id int primary key not null identity,
	id_personal varchar(20) unique not null,
	formato_idPersonal int not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	fecha_nac date not null,
	genero int not null,
	constraint fk_formatoIdPersonal foreign key (formato_idPersonal) references FormatoIdPersona(id),
	constraint fk_generoPersona foreign key (genero) references Genero(id)
);


create table Direccion (
	id_persona int not null unique,
	id_departamento int not null,  
	descripcion varchar(50),
	constraint fk_direccionPersona foreign key (id_persona) references Persona(id),
	constraint fk_departamentoPersona foreign key (id_departamento) references Departamento(id)
);



create table Ubicacion( 
	id int primary key not null identity,
	id_area int not null,
	apartado varchar(20) not null,
	constraint fk_areaUbicacion foreign key (id_area) references Area(id)
);


create table Cliente (
	id int primary key not null identity,
	nit varchar(15) unique not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	direccion varchar(50) 
);

create table Kiosko (
 id int primary key not null identity,
 nombre varchar(50) not null unique,
 id_ubicacion int not null,
 constraint fk_ubicacionKiosko foreign key (id_ubicacion) references Ubicacion(id)
);

create table Factura (
	id int primary key not null identity,
	id_cliente int not null,
	id_kiosko int not null,
	id_formaPago int not null,
	fecha date default getDate(),
	constraint fk_clienteFactura foreign key (id_cliente) references Cliente(id),
	constraint fk_kioskoFactura foreign key (id_kiosko) references Kiosko(id),
	constraint fk_formaPagoFactura foreign key (id_formaPago) references FormaPago(id)
);

create table Ingreso (
	id_persona int not null,
	id_factura int not null unique,
	constraint fk_personaIngreso foreign key (id_persona) references Persona(id),
	constraint fk_ventaIngreso foreign key (id_factura) references Factura(id)
);


create table Producto (
	id int primary key not null identity,
	descripcion varchar(50) not null,
	precio float not null check(precio > 0), 
);


create table VentaProducto (
	id int primary key not null identity,
	id_producto int not null,
	cantidad int not null check (cantidad > 0),
	precio float not null check (precio > 0),
	id_factura int not null,
	subtotal float not null check (subtotal > 0),
	constraint fk_productoVenta foreign key (id_producto) references Producto(id),
	constraint fk_facturaVenta foreign key (id_factura) references Factura(id)
);


create table Servicio (
	id int primary key not null identity,
	descripcion varchar(50) not null unique
);


create table UbicacionServicio (
	id int not null primary key identity,
	id_servicio int not null,
	id_ubicacion int not null,
	constraint fk_servicioUbicacion foreign key (id_servicio) references Servicio(id),
	constraint fk_ubicacionServicio foreign key (id_ubicacion) references Ubicacion(id)
);


create table Calificacion (
	id int primary key not null identity,
	n_estrellas int not null,
	comentario text,
	id_servicio int not null,
	fecha date not null,
	constraint fk_servicioCalificacion foreign key (id_servicio) references Servicio(id)
);


create table ServicioProducto (
	id int primary key not null identity,
	id_producto int not null,
	id_servicio int not null,
	constraint fk_productoCredito foreign key (id_producto) references Producto(id),
	constraint fk_servicioCredito foreign key (id_servicio) references Servicio(id)
);

create table Recaudado (
	id int primary key not null identity,
	fecha date default getDate(),
	id_servicioProducto int not null,
	constraint fk_menu foreign key (id_servicioProducto) references ServicioProducto(id)
);

create table Artista (
	id int primary key not null identity,
	nombre varchar(50) not null unique,
	id_categoria int not null,
	telefono varchar(15),
	constraint fk_categoriaArtista foreign key (id_categoria) references Categoria(id)
);

create table Funcion (
	id int primary key not null identity,
	descripcion varchar(50) not null,
	id_artista int not null,
	id_producto int not null,
	hora_inicio time not null,
	hora_fin time not null,
	fecha_funcion date not null,
	id_ubicacion int not null,
	constraint fk_artistaFuncion foreign key (id_artista) references Artista(id),
	constraint fk_productoFuncion foreign key (id_producto) references Producto(id),
	constraint fk_ubicacionFuncion foreign key (id_ubicacion) references Ubicacion(id)
);

 
create table HorarioLaboral (
	id int primary key not null identity,
	id_cargo int not null,
	id_dia int not null,
	hora time not null,
	id_tipoRegistro int not null,
	constraint fk_cargoHorario foreign key (id_cargo) references Cargo(id),
	constraint fk_diaHorario foreign key (id_dia) references Dia(id),
	constraint fk_registroHorario foreign key (id_tipoRegistro) references TipoRegistro(id)
);
 


create table Empleado (
	id int primary key not null identity,
	id_persona int not null,
	id_cargo int not null,
	id_ubicacion int not null,
	telefono varchar(15),
	constraint fk_personaEmpleado foreign key (id_persona) references Persona(id),
	constraint fk_cargoEmpleado foreign key (id_cargo) references Cargo(id),
	constraint fk_ubicacionEmpleado foreign key (id_ubicacion) references Ubicacion(id)
);


create table RegistroEntradaSalida (
	id_empleado int not null,
	fecha date default getDate() not null,
	hora time not null,
	id_tiporegistro int not null,
	constraint fk_empleadoRegistro foreign key (id_empleado) references Empleado(id),
	constraint fk_tipoRegistro foreign key (id_tipoRegistro) references TipoRegistro(id)
);
 
 
create table Planilla (
	id int primary key not null identity,
	id_empleado int not null unique,
	salario float not null check (salario > 0),
	tipo_salario int not null,
	constraint fk_empleadoPlanilla foreign key (id_empleado) references Empleado(id),
	constraint fk_tipoSalario foreign key (tipo_salario) references TipoSalario(id)
);
