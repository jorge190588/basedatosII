--comprobacion de Producto con menor venta

use ComputerDB


select sd.idProducto as producto, count(SD.cantidad) as cantidadVendida, sd.costoTotal as precio, count(sd.idSalida) as Ventas
from SalidaDetalle SD
where sd.idProducto=6
group by sd.idProducto, sd.cantidad,sd.costoTotal

select  P.precio
from Productos P
where p.id=5