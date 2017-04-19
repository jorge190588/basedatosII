-- =============================================
-- Author:		Eduardo Barrios
-- Create date: 06/04/2017
-- Description:	Example Cursor
-- =============================================

-- EJEMPLO CURSOR
-- declaración del cursor y asignacion de consulta al mismo
declare CursorReporteClientes cursor
	for select P.nombrePais as [País],D.nombreDepartamento as [Departamento],M.nombreMunicipio as [Municipio],
			   C.nombreCliente,C.nit,
			   C.telefono,(select max(fecha) from Salida where idCliente=C.idCliente) as [Fecha de última venta],
			   (select costoTotal from SalidaDetalle where idSalida = S.idSalida) as [Monto],
			   (select cast(avg(costoTotal)as int) from SalidaDetalle SD
				inner join Salida S on S.idSalida=SD.idSalida where S.idCliente = C.idCliente
				group by S.idCliente) as [Promedio en Efectivo],
				(select avg(SD.cantidad)
				from SalidaDetalle SD
				inner join Salida S on S.idSalida=SD.idSalida where S.idCliente = C.idCliente
				group by S.idCliente) as[Promedio Por Cantidad de Productos]
		from Clientes C
		inner join Municipio M on C.idMunicipio = M.idMunicipio
		inner join Departamento D on M.idDepartamento = D.idDepartamento
		inner join Pais P on M.idPais = P.idPais
		inner join Salida S on S.idCliente = C.idCliente
		where S.fecha = (select max(fecha) from Salida where idCliente = C.idCliente) --and S.idCliente = 15
		order by S.fecha desc

-- abrimos el cursor
open CursorReporteClientes

-- obtenemos el registro almacenado en el cursor
fetch next from CursorReporteClientes

-- cerramos el cursor
close CursorReporteClientes


-- liberamos de memoria el cursor
deallocate CursorReporteClientes
