use XtremeWorld

/*
1.	Scenario: Reporte de Empleados
Given: El dueño del negocio requiere conocer a sus empleados
When: requiera la información
Then: el reporte debería mostrar el Documento de Identificacion (DPI), nombre completo, puesto, ubicación, salario y la forma de pago del salario
And: debe estar ordenado alfabeticamente ascendente por puesto, ubicación y apellido respectivamente
*/

select p.id_personal as DPI , 
        (p.apellido + ', ' + p.nombre) as Empleado, 
        c.descripcion as Puesto,
		k.nombre as Kiosko,
        (a.nombre + ' - ' + u.apartado) as Ubicacion,
        ('Q. ' + convert(varchar,pl.salario)) as Salario,
        ts.descripcion as Tipo_Salario
from Empleado as e 
inner join Persona as p on p.id = e.id
inner join Cargo as c on c.id = e.id_cargo
inner join Kiosko as k on k.id_ubicacion = e.id_ubicacion
inner join Ubicacion as u on u.id = e.id_ubicacion
inner join Area as a on a.id = u.id_area
inner join Planilla as pl on pl.id_empleado = e.id
inner join TipoSalario as ts on ts.id = pl.tipo_salario
order by Puesto, Ubicacion, Empleado

select * from Kiosko

/*
2.	Scenario: Reporte de Horarios Laborales
Given: El dueño del negocio requiere conocer a el horario laboral de cada puesto
When: requiera la información
Then: el reporte debería mostrar el nombre del día de la semana, puesto, hora de entrada y hora de salida
And: debe estar ordenado ascendentemente por día y puesto 
*/
select sb.Dia as Dia, sb.Puesto as Puesto, sb.Entrada as Entrada, sb.Salida as Salida
from (
        select distinct d.descripcion as Dia,
                hl.id_dia as N_Dia,
                c.descripcion as Puesto,
                (select convert(varchar, hora, 108) from HorarioLaboral as sb_hl 
                where sb_hl.id_cargo = hl.id_cargo
                and sb_hl.id_dia = hl.id_dia
                and sb_hl.id_tipoRegistro = 1) as Entrada,
                (select convert(varchar, hora, 108) from HorarioLaboral as sb_hl 
                where sb_hl.id_cargo = hl.id_cargo
                and sb_hl.id_dia = hl.id_dia
                and sb_hl.id_tipoRegistro = 2) as Salida
        from HorarioLaboral as hl
        inner join Cargo as c on c.id = hl.id_cargo
        inner join Dia as d on d.id = hl.id_dia) as sb
        order by sb.N_Dia, sb.Puesto




/*
3.	Scenario: Reporte de los registros de entrada y salida de los empleados
Given: El dueño del negocio requiere conocer el registro de entrada y salida de los empleados
When: requiera la información
Then: el reporte debería mostrar la fecha, cargo, nombre completo del empleado, horario formal de entrada, registro de entrada, 
      registro de puntualidad (en minutos), horario formal de salida, registro de salida, registro de minutos extras
And: debe estar ordenado por fecha la fecha más reciente, y ascendentemente por hora de entrada formal, cargo y registro de entrada
*/
select convert(varchar, sb.Fecha,103) as Fecha, 

        (select descripcion from Cargo where id = sb.Puesto) as Cargo,

        (select nombre + ' ' + apellido from Persona 
        where id = (select Empleado.id_persona from Empleado where sb.Empleado = Empleado.id)) as Empleado,

        convert(varchar,(select hora from HorarioLaboral 
        where sb.Puesto = id_cargo
        and datepart(dw, sb.Fecha) = id_dia
        and id_tipoRegistro = 1),108) as Horario_Formal_Entrada,

        convert(varchar,(select hora from RegistroEntradaSalida
            where sb.Empleado = id_empleado
            and sb.Fecha = fecha
            and id_tiporegistro = 1),108) as Entrada,

        (convert(varchar, datediff(minute, (select hora from RegistroEntradaSalida
            where sb.Empleado = id_empleado
            and sb.Fecha = fecha
            and id_tiporegistro = 1), (select hora from HorarioLaboral 
        where sb.Puesto = id_cargo
        and datepart(dw, sb.Fecha) = id_dia
        and id_tipoRegistro = 1))) + ' min') as MinutosPuntualidad_Entrada,

            convert(varchar,(select hora from HorarioLaboral 
            where sb.Puesto = id_cargo
            and datepart(dw, sb.Fecha) = id_dia
            and id_tipoRegistro = 2),108) as Horario_Formal_Salida,

        convert(varchar,(select hora from RegistroEntradaSalida
            where sb.Empleado = id_empleado
            and sb.Fecha = fecha
            and id_tiporegistro = 2),108) as Salida,

            (convert(varchar, datediff(minute, (select hora from HorarioLaboral 
            where sb.Puesto = id_cargo
            and datepart(dw, sb.Fecha) = id_dia
            and id_tipoRegistro = 2), (select hora from RegistroEntradaSalida
            where sb.Empleado = id_empleado
            and sb.Fecha = fecha
            and id_tiporegistro = 2))) + ' min') as MinutosExtra_Salida
from (
        select distinct res.fecha as Fecha,
                res.id_empleado as Empleado,
                e.id_cargo as Puesto
        from RegistroEntradaSalida as res
        inner join Empleado as e on e.id = res.id_empleado) sb
        where sb.Fecha = convert(date, getDate(), 111)
order by sb.Fecha desc, Horario_Formal_Entrada, Cargo, Entrada
		
		
/*
4.	Scenario: Reporte de las calificaciones acerca de los servicios
Given: El dueño del negocio requiere las calificaciones que los clientes tienen acerca de los servicios
When: requiera la información
Then: el reporte debería mostrar el año, mes, servicio, promedio de estrellas recibidas en el mes y la suma de todas las estrellas
	  obtenidas por servicio 
And: debe estar ordenado por fecha la fecha más reciente, y por promedio y suma de estrellas más alto respectivamente
*/
select sub.Anho, sub.Mes, sub.Servicio, sub.Promedio_Estrellas, sub.Total_Estrellas 
from (
    select sb.Anho as Anho,
            sb.Id_mes as Id_Mes,
            sb.Mes as Mes,
            sb.Servicio as Servicio,
            avg(sb.N_Estrellas) as Promedio_Estrellas,
            sum(sb.N_Estrellas) as Total_Estrellas
    from (
        select (case when month(c.fecha) = 1 then 'Enero' else 
                case when month(c.fecha) = 2 then 'Febrero' else 
                    case when month(c.fecha) = 3 then 'Marzo' else 
                        case when month(c.fecha) = 4 then 'Abril' else 
                            case when month(c.fecha) = 5 then 'Mayo' else 
                                case when month(c.fecha) = 6 then 'Junio' 
                                END 
                            END 
                        END 
                    END 
                END 
                END) as Mes,
                month(c.fecha) as Id_mes,
                year(c.fecha) as Anho,
                (s.descripcion) as Servicio,
                c.n_estrellas as N_Estrellas
        from Servicio as s
        left join Calificacion as c on s.id = c.id_servicio
        where c.fecha between convert(date, dateadd(MONTH, -2, GETDATE()), 111) and  convert(date, getDate(), 111)
        and datepart(qq, c.fecha) in (1, 2)
        ) as sb
    group by sb.Mes, sb.Id_mes, sb.Anho, sb.Servicio

    union all

    select sb.Anho as Anho,
            sb.Id_mes as Id_Mes,
            sb.Mes as Mes,
            sb.Servicio as Servicio,
            avg(sb.N_Estrellas) as Promedio_Estrellas,
            sum(sb.N_Estrellas) as Total_Estrellas
    from (
        select (case when month(c.fecha) = 7 then 'Julio' else 
                case when month(c.fecha) = 8 then 'Agosto' else 
                    case when month(c.fecha) = 9 then 'Septiembre' else 
                        case when month(c.fecha) = 10 then 'Octubre' else 
                            case when month(c.fecha) = 11 then 'Noviembre' else 
                                case when month(c.fecha) = 12 then 'Diciembre' 
                                END 
                            END 
                        END 
                    END 
                END 
                END) as Mes,
                month(c.fecha) as Id_mes,
                year(c.fecha) as Anho,
                (s.descripcion) as Servicio,
                c.n_estrellas as N_Estrellas
        from Servicio as s
        left join Calificacion as c on s.id = c.id_servicio
        where c.fecha between convert(date, dateadd(MONTH, -2, GETDATE()), 111) and  convert(date, getDate(), 111)
        and datepart(qq, c.fecha) in (3, 4)
        ) as sb
    group by sb.Mes, sb.Id_mes, sb.Anho, sb.Servicio
) as sub
order by sub.Anho desc, sub.Id_mes desc, sub.Promedio_Estrellas desc, sub.Total_Estrellas desc, sub.Servicio







/*
5.	Scenario: Reporte del total recaudado por factura
Given: El dueño del negocio requiere la informacion de lo recaudado por factura
When: requiera la información
Then: el reporte debería mostrar la fecha, el nit del cliente, nombre del cliente, ubicacion en donde se despachó la factura,
      la forma en que se pagó la factura y la cantidad monetaria total recaudada
	  obtenidas por servicio 
And: debe estar ordenado por fecha la fecha más reciente
And: por la cantidad monetaria más alta en la factura
And: por la forma de pago
*/
select convert(varchar, f.fecha, 103) as Fecha,
        c.nit as Nit,
        (c.nombre + ' ' + c.apellido) as Cliente,
        k.nombre as Kiosko,
        fp.descripcion as Forma_Pago,
        ('Q. ' + convert(varchar,(select sum(subtotal) from VentaProducto where id_factura = f.id))) as Total
from Factura as f
inner join Cliente as c on c.id = f.id_cliente
inner join Kiosko as k on k.id = f.id_kiosko
inner join FormaPago as fp on fp.id = f.id_formaPago
where f.fecha between convert(date, dateadd(WEEK, -1, GETDATE()), 111) and  convert(date, getDate(), 111)
order by f.fecha desc, (select sum(subtotal) from VentaProducto where id_factura = f.id) desc, fp.id


/*
6.	Scenario: Reporte de la venta de productos por dia
Given: El dueño del negocio requiere la informacion del promedio en ventas de los productos por dia
When: requiera la información
Then: el reporte debería mostrar la fecha, producto, promedio de venta por día y el monto total recaudado del producto por día
And: debe estar ordenado por fecha la fecha más reciente, por el mayor monto total recaudado y por el promedio en ventas del producto
*/
select convert(varchar, f.fecha, 103) as Fecha,
        vp.id_producto as Id_Producto,
        (select descripcion from Producto where id = vp.id_producto) as Producto_Descripcion,
        avg(vp.cantidad) as Promedio_Venta,
        ('Q. ' + convert(varchar, sum(vp.subtotal))) as TotalVenta
from VentaProducto as vp
inner join Factura as f on f.id = vp.id_factura
where f.fecha between convert(date, dateadd(MONTH, -1, GETDATE()), 111) and  convert(date, getDate(), 111)
group by f.fecha, Id_Producto
order by f.fecha desc, sum(vp.subtotal) desc, Promedio_Venta desc




/*
7.	Scenario: Reporte de funciones por día
Given: El dueño del negocio requiere la informacion de las funciones por día que se han hecho
When: requiera la información
Then: el reporte debería mostrar el nombre de función, artista, categoria, precio, fecha, hora de inicio, hora de finalización y la ubicación
And: debe estar ordenado por fecha la fecha más reciente y por el lugar de la función
*/
select f.descripcion as Funcion,
        a.nombre as Artista,
        c.descripcion as Categoria,
        ('Q. ' + convert(varchar, p.precio)) as Precio,
        convert(varchar, f.fecha_funcion, 103) as Fecha,
        convert(varchar, f.hora_inicio, 108) as Hora_Inicio,
        convert(varchar, f.hora_fin, 108) as Hora_Fin,
        (ar.nombre + ' ' + u.apartado) as Lugar
from Funcion as f
inner join Artista as a on a.id = f.id_artista
inner join Categoria as c on c.id = a.id_categoria
inner join Producto as p on p.id = f.id_producto
inner join Ubicacion as u on u.id = f.id_ubicacion
inner join Area as ar on ar.id = u.id_area
where DATEPART(WEEK,f.fecha_funcion) = DATEPART(WEEK, getDate())
and DATEPART(YEAR, GETDATE()) = DATEPART(YEAR, f.fecha_funcion)
order by f.fecha_funcion desc, f.id_ubicacion




/*
8.	Scenario: Reporte de los productos y servicios ofrecidos por día
Given: El dueño del negocio requiere la informacion de los productos y servicios que se han ofrecido en el día
When: requiera la información
Then: el reporte debería mostrar el nombre del producto, servicio, cantidad de veces recaudadas y la fecha
And: debe estar ordenado por fecha la fecha más reciente, por la máxima cantidad recaudada y por el nombre
*/
select p.descripcion as Producto,
        s.descripcion as Servicio,
        count(*) as Cantidad_Recaudada,
        convert(varchar, r.fecha, 103) as Fecha
from Recaudado as r
inner join ServicioProducto as sp on sp.id = r.id_servicioProducto
inner join Producto as p on p.id = sp.id_producto
inner join Servicio as s on s.id = sp.id_servicio
where r.fecha between convert(date, dateadd(MONTH, -1, GETDATE()), 111) and  convert(date, getDate(), 111)
group by r.fecha, p.descripcion, s.descripcion, r.id_servicioProducto
order by r.fecha desc, Cantidad_Recaudada desc, r.id_servicioProducto



/*
9.	Scenario: Reporte de la información de todas las personas que entran al parque
Given: El dueño del negocio requiere la informacion de todas las personas que entran al parque
When: requiera la información
Then: el reporte debería mostrar la fecha, tipo de persona, formato de identificacion, identificación personal, nombre completo, género y edad
And: debe estar ordenado por fecha la fecha más reciente y por el tipo de persona
*/
select convert(varchar,sb.Fecha,103) as Fecha, 
        sb.Tipo_Persona, 
        sb.Formato, 
        sb.Id_Personal, 
        sb.Nombre_Completo, 
        sb.Genero, 
        sb.Edad
from (
    select 'Civil' as Tipo_Persona,
            f.fecha as Fecha,
            fip.descripcion as Formato,
            p.id_personal as Id_Personal ,
            (p.nombre + ' ' + p.apellido) as Nombre_Completo,
            g.descripcion as Genero,
            datediff(year, p.fecha_nac, getDate()) as Edad
    from Ingreso as i
    inner join Persona as p on p.id = i.id_persona
    inner join FormatoIdPersona as fip on fip.id = p.formato_idPersonal
    inner join Genero as g on g.id = p.genero
    inner join Factura as f on f.id = i.id_factura
    where f.fecha = convert(date, GETDATE(), 103)
    union all
    select distinct 'Empleado' as Tipo_Persona,
                    res.fecha as Fecha,
                    fip.descripcion as Formato,
                    p.id_personal as Id_Personal,
                    (p.nombre + ' ' + p.apellido) as Nombre_Completo,
                    g.descripcion as Genero,
                    datediff(year, p.fecha_nac, getDate()) as Edad
    from RegistroEntradaSalida as res
    inner join Empleado as e on e.id = res.id_empleado
    inner join Persona as p on p.id = e.id_persona
    inner join FormatoIdPersona as fip on fip.id = p.formato_idPersonal
    inner join Genero as g on g.id = p.genero
    where res.fecha = convert(date, GETDATE(), 103)
) as sb
order by sb.Fecha desc, sb.Tipo_Persona desc


/*
10.	Scenario: Reporte de la cantidad promedio de personas que entran al día al parque (no empleados)
Given: El dueño del negocio requiere la informacion de la cantidad promedio de las personas que entran al parque por día
When: requiera la información
Then: el reporte debería mostrar la fecha, cantidad promedio de adultos, de niños y en general
And: debe estar ordenado por fecha la fecha más reciente
*/

select convert(varchar,sb.Fecha,103) as Fecha, avg(sb.Adultos) as Promedio_Adultos, avg(sb.Ninhos) as Promedio_Ninhos, avg(sb.General) as Promedio_General
from (
select distinct f.id as Id,
                f.fecha as Fecha, 
                (select cantidad from VentaProducto as sb_vp where  sb_vp.id_factura = f.id and sb_vp.id_producto = 1) as Adultos,
                (select cantidad from VentaProducto as sb_vp where  sb_vp.id_factura = f.id and sb_vp.id_producto = 2) as Ninhos,
                ((select cantidad from VentaProducto as sb_vp where  sb_vp.id_factura = f.id and sb_vp.id_producto = 1) +
                (select cantidad from VentaProducto as sb_vp where  sb_vp.id_factura = f.id and sb_vp.id_producto = 2)) as General
from Factura as f
inner join VentaProducto as vp on f.id = vp.id_factura
where vp.id_producto in (1, 2)
) as sb
group by sb.Fecha
order by sb.Fecha desc



