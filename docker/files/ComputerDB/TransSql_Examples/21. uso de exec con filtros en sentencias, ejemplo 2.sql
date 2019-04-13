use computerDB
declare @consulta varchar(1000)
declare @codigos varchar(20), @codigosColor varchar(20)
select @codigosColor='3,6', @codigos='0'
set @consulta='select * from productos '
set @consulta=concat(@consulta,' where ( ( ''',@codigos,'''=''0'') or (id in (',@codigos,') ) )')
set @consulta=concat(@consulta,' and ( ( ''',@codigosColor,'''=''0'') or (idColor in (',@codigosColor,') ) )')

print @consulta
exec(@consulta)

if (len(@codigos)>0) begin
	print 'entro al if'
	print concat(' where id in (',@codigos,')')
	set @consulta=concat(@consulta,' where id in (',@codigos,')')
end

print @consulta
exec(@consulta)





