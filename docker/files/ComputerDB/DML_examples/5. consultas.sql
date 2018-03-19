select * from salida s, SalidaDetalle d, Clientes c, Productos p
where s.idSalida=d.idSalida and s.idCliente=c.idCliente and d.idProducto=p.id


select year(s.fecha) [Año],month(s.fecha) mes,day(s.fecha) dia, s.idSalida,c.nombreCliente,p.nombre producto from salida s, SalidaDetalle d, Clientes c, Productos p
where s.idSalida=d.idSalida and s.idCliente=c.idCliente and d.idProducto=p.id
order by year(s.fecha),month(s.fecha),day(s.fecha)

CREATE NONCLUSTERED INDEX salidadetalle_idcliente_nonclustered on dbo.salida ([idcliente]) include ([idsalida])

select s.idSalida, (select c.nombrecliente from Clientes c where c.idCliente=s.idCliente)  cliente,
(select p.nombre from Productos p where p.id=d.idProducto)  producto
from salida s, SalidaDetalle d
where s.idSalida=d.idSalida 
order by s.idSalida

CREATE NONCLUSTERED INDEX salidadetalle_idproducto_nonclustered on dbo.salidadetalle ([idsalida]) include ([idproducto])

select t1.idSalida,t1.nombreCliente,p.nombre producto from (
	select s.idSalida,c.nombreCliente from (
		select s.idSalida,s.idCliente from Salida s
	) as s, Clientes c
	where s.idCliente=c.idCliente
) as t1, Productos p, SalidaDetalle d
where t1.idSalida=d.idSalida and p.id=d.idProducto
order by t1.idSalida
