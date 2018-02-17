declare @idmunicipios varchar(50)
select @idmunicipios='1,2,3,4,5'
select @idmunicipios as idMunicipios

select * from municipio where idDepartamento=2
select * from departamento where 
where idMunicipio not in (4,5)

select *
from municipio m
where m.iddepartamento =2

select *
from municipio m
where m.idMunicipio in (
	select idmunicipio from Municipio where iddepartamento=2)

select idmunicipio 
from municipio
where idMunicipio in (@idmunicipios)

declare @idmunicipios varchar(500)
declare @consulta varchar(500)
select @idmunicipios='1,2,3,4,5'
select @consulta='select * from Municipio where idMunicipio in ('
+@idmunicipios+')'
print @consulta
exec (@consulta)