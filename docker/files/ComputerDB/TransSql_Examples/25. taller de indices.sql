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

create table establecimiento (
	id int,
	nombre  varchaR(50),
	direccion varchaR(50),
	nit varchaR(50)
)


insert into establecimiento
select 1,'A', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 2,'B', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 3,'C', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 4,'D', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 5,'E', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 6,'F', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 7,'G', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 8,'H', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')
UNION
select 9,'I', 'zona '+dbo.fnCustomPass(2,'N')+', calle '+dbo.fnCustomPass(1,'N'),dbo.fnCustomPass(8,'N')

update alumno set establecimiento=dbo.fnCustomPass(1,'N')

DECLARE @cantidadRegistros INT, @id int;
SET @cantidadRegistros = 0;
select @id = max(id) from persona;

WHILE @cantidadRegistros <= 50000
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

WHILE @cantidadRegistros <= 50000
BEGIN
   SET @cantidadRegistros = @cantidadRegistros + 1;
	set @id=@id+1
	insert into alumno
	select @id id,  @id persona,0, dbo.fnCustomPass(1,'N')
END;

select count(id) contador, Activo from (
	select p.id, p.nombre nombrePersona, p.nit nitPersona, p.fechaNacimiento, 
			day(p.fechaNacimiento) diaNacimiento,month(p.fechaNacimiento) mesNacimiento, 
			year(p.fechaNacimiento) anoNacimiento,
			a.id idAlumno, case when a.esActivo=1 then 'activo' else 'no activo' end activo,
			e.id idEstablecimiento, e.nombre nombreEstablecimiento, e.direccion, e.nit nitEstablecimiento
	from persona p
	inner join alumno a on p.id=a.persona
	inner join establecimiento e on a.establecimiento=e.id
) as datos
group by datos.Activo

select * from alumno a where a.persona in 
	(	select p.id from persona p, alumno a  
		where a.persona=p.id and  a.esactivo=0 and a.establecimiento in
				(select id from establecimiento) )
