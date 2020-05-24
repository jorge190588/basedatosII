use ComputerDB

declare @total int,@indice int
declare @minimo int, @maximo int,@Random int

select @total=20, @indice=11
SET @minimo = 1
select @maximo=max(idcliente)  from Clientes

while(@indice <= @total)
begin
	SELECT @Random = ROUND(((@maximo - @minimo -1) * RAND() + @minimo), 0)
	insert into salida (fecha, idcliente, documento) values (getdate(),@Random,@indice)
	
	print @indice
	set @indice = @indice+1
end
select * from salida
 


	


