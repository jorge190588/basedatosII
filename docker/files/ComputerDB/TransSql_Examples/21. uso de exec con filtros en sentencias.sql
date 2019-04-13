use computerDB
declare @consulta varchar(1000)
declare @codigos varchar(20), @codigosColor varchar(20), @fechaInicio varchar(20),@fechaFin varchar(20)
select @codigosColor='3,6', @codigos='0',@fechaInicio='01/01/2013',@fechaFin='02/01/2013'
set @consulta='select p.nombre,s.fecha from productos p, salidaDetalle sd, salida s '
set @consulta=concat(@consulta,' where p.id=sd.idProducto and sd.idsalida=s.idsalida ')
set @consulta=concat(@consulta,' and ( ( ''',@codigos,'''=''0'') or (p.id in (',@codigos,') ) )')
set @consulta=concat(@consulta,' and ( ( ''',@codigosColor,'''=''0'') or (p.idColor in (',@codigosColor,') ) )')
set @consulta=concat(@consulta,' and s.fecha  between ''',@fechaInicio,''' and ''',@fechaFin,'''')
set @consulta=concat(@consulta,' order by s.fecha')

print @consulta
exec(@consulta)
