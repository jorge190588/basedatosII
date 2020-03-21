
use ComputerDB;

declare @totalDeSalidas int,@totalDeEntradas int
select @totalDeSalidas=10,@totalDeEntradas=10

-- INSERTAR ENCABEZADO DE SALIDAS
declare @idsalida int
set @idsalida=1
--select @variable as [Variable]
while(@idsalida <= @totalDeSalidas)
begin
	execute sp_InsertarSalidaMasivo @idsalida 
	set @idsalida= @idsalida+1
end

------------------------------------------------------------------------------------------
-- INSERTAR DETALLE DE PRODUCTOS

set @idsalida=1 --id de salida inicial
--select @IdSalida as [IDsalida]

while(@idsalida<= @totalDeSalidas) --id de salida maximo
begin
	execute sp_InsertarSalidaDetalleMasivo @idsalida
	set @idsalida= @idsalida+1
end



--------------------------------------------------------------------------------------------

-- INSERTAR ENCABEZADO DE ENTRADAS
declare @idEntrada int
set @idEntrada=1
--select @variable as [Variable]
while(@idEntrada <= @totalDeEntradas)
begin
	execute sp_InsertarEntradaMasivo @idEntrada
	set @idEntrada = @idEntrada+1
end

--------------------------------------------------------------------------------------------

-- INSERTAR DETALLE DE ENTRADAS
set @idEntrada=1
while(@IdEntrada <= @totalDeEntradas)
begin
	execute sp_InsertarEntradaDetalleMasivo @IdEntrada
	set @IdEntrada = @IdEntrada+1
end

