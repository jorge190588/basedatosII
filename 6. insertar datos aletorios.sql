use ComputerDB;

-- INSERTAR ENCABEZADO DE SALIDAS
declare @documento int
set @documento=1
--select @variable as [Variable]
while(@documento <= 100000)
begin
	execute sp_InsertarSalidaMasivo @documento 
	set @documento = @documento+1
end

-- INSERTAR DETALLE DE PRODUCTOS

declare @IdSalida int
set @IdSalida=1 --id de salida inicial
--select @IdSalida as [IDsalida]

while(@IdSalida <= 100000) --id de salida maximo
begin
	execute sp_InsertarSalidaDetalleMasivo @IdSalida
	set @IdSalida = @IdSalida+1
end

--------------------------------------------------------------------------------------------

-- INSERTAR ENCABEZADO DE ENTRADAS
declare @documento int
set @documento=1
--select @variable as [Variable]
while(@documento <= 1000000)
begin
	execute sp_InsertarEntradaMasivo '2017-10-10',@documento 
	set @documento = @documento+1
end

--------------------------------------------------------------------------------------------

-- INSERTAR DETALLE DE ENTRADAS
declare @IdEntrada int
set @idEntrada=1

while(@IdEntrada <= 1000000)
begin
	execute sp_InsertarEntradaDetalleMasivo @IdEntrada
	set @IdEntrada = @IdEntrada+1
end

