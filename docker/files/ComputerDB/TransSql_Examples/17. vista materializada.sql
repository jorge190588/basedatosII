USE [ComputerDB]
GO

/****** Object:  View [dbo].[listadeclientes]    Script Date: 07/04/2018 12:23:26 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter VIEW [dbo].[listadeclientes]
AS
SELECT        row_number() over(ORDER BY idcliente) id,
			idCliente, nombreCliente AS cliente, direccion, nit
FROM            dbo.Clientes where nombreCliente like 'a%' 


GO

select * from listadeclientes where direccion like '%4%'
