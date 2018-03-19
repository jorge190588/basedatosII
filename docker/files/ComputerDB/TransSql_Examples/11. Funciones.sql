Use ComputerDB
go

--Paso 1. crear la funcion
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jorge santos
-- Create date: 06/05/2017
-- Description:	ejemplo de una funcion que calcula el iva
-- =============================================
CREATE FUNCTION dbo.fnIva
(
	@valor decimal(18,5)
)
RETURNS decimal(18,5)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @resultado decimal(18,2)

	select @resultado=@valor*0.12

	-- Return the result of the function
	RETURN @resultado

END
GO

--Paso 2. ejecutar la funcion
select dbo.fnIva(100) iva

