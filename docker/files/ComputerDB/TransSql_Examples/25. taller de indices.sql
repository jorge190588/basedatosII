use computerDB;

create table persona(
	id int,
	nombre varchar(50),
	nit varchar(20),
	fechaNacimiento datetime,
	direccion varchar(100)
)

create table alumno (
	id int,
	persona int,
	esActivo bit,
	establecimiento int
)


DECLARE @cantidadRegistros INT, @id int;
SET @cantidadRegistros = 0;
select @id = max(id) from persona;

WHILE @cantidadRegistros <= 20000
BEGIN
	SET @cantidadRegistros = @cantidadRegistros + 1;
	set @id=@id+1
	insert into persona
	select @id id,  dbo.fnCustomPass(15,'CN') nombre, dbo.fnCustomPass(6,'N') nit,
		dbo.getRandomDate('01/01/1980','01/05/2019') fechaNacimiento,
		'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N') direccion
END;


DECLARE @cantidadRegistros INT, @id int;
SET @cantidadRegistros = 0;
select @id = max(id) from alumno;

WHILE @cantidadRegistros <= 20000
BEGIN
   SET @cantidadRegistros = @cantidadRegistros + 1;
	set @id=@id+1
	insert into alumno
	select @id id,  @id persona,0, dbo.fnCustomPass(1,'N')
END;


