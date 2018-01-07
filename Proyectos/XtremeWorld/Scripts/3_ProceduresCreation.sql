use XtremeWorld;

-- PROCEDIMIENTO ALMACENADO PARA REGISTRAR RECAUDACIONES
go
create procedure sp_InsertarRecaudacion
	@producto int,
	@cantidad int,
	@fecha date
	as
begin
	declare @random_servicioProducto int
	declare @maxIdServicioProducto int
	declare @minIdServicioProducto int
	declare @x int
	
	select @maxIdServicioProducto = max(id) from ServicioProducto where id_producto = @producto
	select @minIdServicioProducto = min(id) from ServicioProducto where id_producto = @producto
	
	set @x = 0
	while(@x < @cantidad)
	begin
		if(@maxIdServicioProducto = @minIdServicioProducto)
		begin
			set @random_servicioProducto = @maxIdServicioProducto
		end

		if(@maxIdServicioProducto != @minIdServicioProducto)
		begin
			select @random_servicioProducto = ROUND(((@maxIdServicioProducto - @minIdServicioProducto) * RAND() + @minIdServicioProducto), 0)
		end

		insert into Recaudado (id_servicioProducto, fecha)
		values (@random_servicioProducto, @fecha)

		set @x = @x + 1
	end
end


------------------------------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO PARA REGISTRO DE FUNCIONES
go
create procedure sp_InsertarFuncionesMasivo
	as
begin
	declare @fecha_inicial date
	declare @fecha_hoy date

	declare @n_funciones int 
	
	select @n_funciones = count(*) from Funcion
	
	if(@n_funciones < 1)
	begin 
		set @fecha_inicial = '2017-01-01'
	end
	
	if(@n_funciones > 0)
	begin 
		select @fecha_inicial = max(fecha_funcion) from Funcion
		set @fecha_inicial = DATEADD(day, 1, @fecha_inicial)
	end
	
	select @fecha_hoy = convert(date, getdate(), 111)

	
	while(@fecha_inicial <= @fecha_hoy)
	begin
		if(datepart(dw, @fecha_inicial) != 5)
		begin
			insert into dbo.Funcion(descripcion, id_artista, id_producto, hora_inicio, hora_fin, fecha_funcion, id_ubicacion)
			values ('Funcion 1', 1, 11, '10:00:00', '11:00:00', @fecha_inicial, 13),
				   ('Funcion 2', 2, 12, '10:00:00', '11:00:00', @fecha_inicial, 14),
				   ('Funcion 3', 3, 13, '11:00:00', '12:00:00', @fecha_inicial, 13),
				   ('Funcion 4', 4, 14, '11:00:00', '12:00:00', @fecha_inicial, 14),
				   ('Funcion 5', 5, 15, '14:00:00', '15:00:00', @fecha_inicial, 13),
				   ('Funcion 6', 6, 16, '14:00:00', '15:00:00', @fecha_inicial, 14),
				   ('Funcion 7', 7, 17, '15:00:00', '16:00:00', @fecha_inicial, 13),
				   ('Funcion 8', 8, 18, '15:00:00', '16:00:00', @fecha_inicial, 14)
		end

		set @fecha_inicial = dateadd(day, 1, @fecha_inicial)
	end
end
go


-- PROCEDIMIENTO ALMACENADO PARA REGISTRO DE ENTRADAS
go
create procedure sp_InsertarRegistroIOMasivo 
	as
begin
	---- Creacion de la variable
	declare @fecha_inicial date
	declare @fecha_hoy date

	declare @n_diaSemanal int 
	declare @n_registros int
	declare @n_empleados int
	declare @id_empleado int

	declare @hora_IO time 
	declare @minutos int

	select @n_registros = count(*) from RegistroEntradaSalida
	select @n_empleados = count(*) from dbo.Empleado

	if(@n_registros < 1)
	begin 
		set @fecha_inicial = '2017-01-01'
	end
	if(@n_registros > 0)
	begin
		select @fecha_inicial = max(fecha) from RegistroEntradaSalida
		set @fecha_inicial = DATEADD(day, 1, @fecha_inicial)
	end

	select @fecha_hoy = convert(date, getdate(), 111)

	while(@fecha_inicial <= @fecha_hoy)
	begin
		-- AQUI
		set @n_diaSemanal = datepart(dw, @fecha_inicial)
		
		if(@n_diaSemanal != 5)
		begin
			set @id_empleado = 1
			while(@id_empleado <= @n_empleados)
			begin	
				--- ENTRADA
				select @hora_IO =  hora from HorarioLaboral as hl
										where hl.id_cargo = (
														  select id_cargo from Empleado
														  where id_persona = @id_empleado)
										and @n_diaSemanal = hl.id_dia
										and hl.id_tipoRegistro = 1
			    
				select @minutos = ROUND(((20 - (-20)) * RAND() + (-20)), 0)

				select @hora_IO = DATEADD(minute, @minutos, @hora_IO)

				insert into dbo.RegistroEntradaSalida(id_empleado, fecha, hora, id_tiporegistro)
				values (@id_empleado, @fecha_inicial, @hora_IO, 1)

				-- SALIDA
				select @hora_IO =  hora from HorarioLaboral as hl
										where hl.id_cargo = (
														  select id_cargo from Empleado
														  where id_persona = @id_empleado)
										and @n_diaSemanal = hl.id_dia
										and hl.id_tipoRegistro = 2
			
				select @minutos = ROUND(((20 - (-20)) * RAND() + (-20)), 0)

				select @hora_IO = DATEADD(minute, @minutos, @hora_IO)

				insert into dbo.RegistroEntradaSalida(id_empleado, fecha, hora, id_tiporegistro)
				values (@id_empleado, @fecha_inicial, @hora_IO, 2)


				set @id_empleado = @id_empleado + 1
			end	
		end

		set @fecha_inicial = dateadd(day, 1, @fecha_inicial)
	end
end

  
-----------------------------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO PARA REGISTRO DE FACTURAS Y VENTAS
go
create procedure sp_InsertarVentasMasivo 
	as
begin
	declare @n_facturaMaxAlDia int
	declare @n_facturaMinAlDia int

	declare @i int
	declare @j int 
	declare @k int
	declare @x int

	declare @id_factura int

	declare @n_facturas int 
	declare @n_clientes int
	declare @n_personas int
	declare @n_ticketsMaxPorProducto int
	declare @n_comprasPorCliente int
	declare @n_productosPorCompra int
	declare @n_cantidadPorProducto int
	declare @n_formasPago int
	declare @n_productos int
	declare @n_kioskos int

	declare @id_ticketAdulto int
	declare @id_ticketPeque int
	declare @id_kiosko int 
	declare @id_servicioProducto int

	declare @random_nFactura int
	declare @random_cliente int 
	declare @random_persona int
	declare @random_tickets int
	declare @random_formaPago int
	declare @random_nComprasPorCliente int
	declare @random_nProductosPorCompra int
	declare @random_cantidadPorProducto int
	declare @random_kiosko int
	declare @random_producto int

	declare @f_inicial date
	declare @f_hoy date

	declare @precio_producto float
	declare @subtotal float

	select @n_facturas = count(*) from Factura
	select @n_clientes = count(*) from Cliente
	select @n_personas = count(*) from Persona
	select @n_formasPago = count(*) from FormaPago
	select @n_productos = count(*) from Producto
	select @n_kioskos = count(*) from Kiosko

	set @n_facturaMaxAlDia = 100
	set @n_facturaMinAlDia = 30
	set @n_ticketsMaxPorProducto = 30
	set @n_comprasPorCliente = 5
	set @n_productosPorCompra = 4
	set @n_cantidadPorProducto = 4

	set @id_ticketAdulto = 1
	set @id_ticketPeque = 2
	set @id_kiosko = 1


	if(@n_facturas < 1)
	begin 
		set @f_inicial = '2017-01-01'
	end
	if(@n_facturas > 0)
	begin
		select @f_inicial = max(fecha) from Factura 
		set @f_inicial = DATEADD(day, 1, @f_inicial)
	end

	select @f_hoy = convert(date, getdate(), 111)

	while(@f_inicial <= @f_hoy)
	begin
		if(datepart(dw, @f_inicial) != 5)
		begin 
			select @random_nFactura = ROUND(((@n_facturaMaxAlDia - @n_facturaMinAlDia) * RAND() + @n_facturaMinAlDia), 0)
			select @j = 1

			while(@j <= @random_nFactura)
			begin 
				-- se realiza la factura de la venta de entradas

				select @random_cliente = ROUND(((@n_clientes - 1) * RAND() + 1), 0)
				select @random_formaPago = ROUND(((@n_formasPago - 1) * RAND() + 1), 0)

				insert into dbo.Factura (id_cliente, id_kiosko, id_formaPago, fecha)
				values (@random_cliente, @id_kiosko, @random_formaPago, @f_inicial)
				
				-- vincula la persona con la factura
				select @id_factura = max(id) from Factura
				select @random_persona = ROUND(((@n_personas - 35) * RAND() + 35), 0)

				insert into Ingreso (id_persona, id_factura)
				values (@random_persona, @id_factura)

				-- insercion aleatoria de tickets para adultos
				select @random_tickets = ROUND(((@n_ticketsMaxPorProducto - 1) * RAND() + 1), 0)
				select @precio_producto = precio from Producto where Producto.id = @id_ticketAdulto
				set @subtotal = @precio_producto * @random_tickets
			
				insert into dbo.VentaProducto (id_factura, id_producto, precio, cantidad, subtotal)
				values (@id_factura, @id_ticketAdulto, @precio_producto, @random_tickets, @subtotal)
				
						-- hacer el apunte de lo recaudado en tickets
						execute sp_InsertarRecaudacion @id_ticketAdulto, @random_tickets, @f_inicial 

				-- insercion aleatoria de tickets para niños
				select @random_tickets = ROUND(((@n_ticketsMaxPorProducto - 0) * RAND() + 0), 0)

				if(@random_tickets > 0)
				begin
					select @precio_producto = precio from Producto where Producto.id = @id_ticketPeque
					set @subtotal = @precio_producto * @random_tickets

					insert into dbo.VentaProducto (id_factura, id_producto, precio, cantidad, subtotal)
					values (@id_factura, @id_ticketPeque, @precio_producto, @random_tickets, @subtotal)

							-- hacer el apunte de lo recaudado en tickets
							execute sp_InsertarRecaudacion @id_ticketPeque, @random_tickets, @f_inicial 
				end
				
				-- INSERTAR COMPRAS DEL CLIENTE
				select @random_nComprasPorCliente = ROUND(((@n_comprasPorCliente - 0) * RAND() + 0), 0)
				set @i = 0

				while(@i < @random_nComprasPorCliente)
				begin
					select @random_formaPago = ROUND(((@n_formasPago - 1) * RAND() + 1), 0)
					select @random_kiosko = ROUND(((@n_kioskos - 2) * RAND() + 2), 0)

					insert into dbo.Factura (id_cliente, id_kiosko, id_formaPago, fecha)
					values (@random_cliente, @random_kiosko, @random_formaPago, @f_inicial)

					-- ..........
					select @id_factura = max(id) from Factura

					select @random_nProductosPorCompra = ROUND(((@n_productosPorCompra - 1) * RAND() + 1), 0)
					set @k = 0

					while(@k < @random_nProductosPorCompra)
					begin
						select @random_producto = ROUND(((@n_productos - 3) * RAND() + 3), 0)
						select @random_cantidadPorProducto = ROUND(((@n_cantidadPorProducto - 1) * RAND() + 1), 0)
						select @precio_producto = precio from Producto where Producto.id = @random_producto
						set @subtotal = @precio_producto * @random_cantidadPorProducto

						insert into dbo.VentaProducto (id_factura, id_producto, precio, cantidad, subtotal)
						values (@id_factura, @random_producto, @precio_producto, @random_cantidadPorProducto, @subtotal)
						
						-- insertar lo recaudado
						execute sp_InsertarRecaudacion @random_producto, @random_cantidadPorProducto, @f_inicial
						
						set @k = @k + 1
					end

					set @i = @i + 1
				end

				set @j = @j + 1
			end 
		end
		set @f_inicial = dateadd(day, 1, @f_inicial)
	end
end


-----------------------------------------------------------------------------



go
create procedure sp_InsertarCalificacionesMasivo 
	as
begin
	declare @f_inicial date
	declare @f_hoy date

	declare @n_servicios int
	declare @n_calificaciones int

	declare @random_nEstrellas int
	declare @random_servicio int
	declare @random_nComentariosPorFecha int

	declare @x int

	select @n_servicios = count(*) from Servicio
	select @n_calificaciones = count(*) from Calificacion

	if(@n_calificaciones < 1)
	begin
		set @f_inicial = '2017-01-01'
	end
	if(@n_calificaciones > 0)
	begin
		select @f_inicial = max(fecha) from Calificacion
		set @f_inicial = DATEADD(day, 1, @f_inicial)
	end

	select @f_hoy = convert(date, getdate(), 111)

	while(@f_inicial <= @f_hoy)
	begin
		select @random_nComentariosPorFecha = ROUND(((30 - 0) * RAND() + 0), 0)
		set @x = 0

		while(@x < @random_nComentariosPorFecha) 
		begin

			select @random_servicio = ROUND(((@n_servicios - 1) * RAND() + 1), 0)
			select @random_nEstrellas =  ROUND(((5 - 1) * RAND() + 1), 0)

			insert into Calificacion (n_estrellas, id_servicio, fecha)
			values (@random_nEstrellas, @random_servicio, @f_inicial)
			
			set @x = @x + 1
		end
		set @f_inicial = dateadd(day, 1, @f_inicial)
	end
end
