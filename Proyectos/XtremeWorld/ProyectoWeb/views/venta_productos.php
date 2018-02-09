<!DOCTYPE html>
<?php 
    include('../config/coneccion.php');
?>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>XtremeWorld</title>
    <link rel="shortcut icon" href="../style/img/logo.png" />
    <link type="text/css" rel="stylesheet" href="../style/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
    <nav class="blue-grey darken-3">
        <div class="nav-wrapper">
          <a class="brand-logo center">XtremeWorld</a>
          <ul id="nav-mobile" class="left hide-on-med-and-down">
              <li class="hoverable"><a href="../index.php">Inicio</a></li>
          </ul>
        </div>
    </nav>

    <div class="container">
       <div class="section">
       <h3 class="center-align">Productos</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Fecha</th>
                  <th>ID Producto</th>
                  <th>Descripción</th>
                  <th>Cantidad Promedio por Venta</th>
                  <th>Monto Total</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select convert(varchar, f.fecha, 103) as Fecha,
                                        vp.id_producto as Id_Producto,
                                       (select descripcion from Producto where id = vp.id_producto) as Producto_Descripcion,
                                       avg(vp.cantidad) as Promedio_Venta,
                                       ('Q. ' + convert(varchar, sum(vp.subtotal))) as TotalVenta
                                from VentaProducto as vp
                                inner join Factura as f on f.id = vp.id_factura
                                where f.fecha between convert(date, dateadd(MONTH, -1, GETDATE()), 111) and  convert(date, getDate(), 111)
                                group by f.fecha, Id_Producto
                                order by f.fecha desc, sum(vp.subtotal) desc, Promedio_Venta desc";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $fecha = $fila['Fecha'];
                            $id_producto = $fila['Id_Producto'];
                            $descripcion = $fila['Producto_Descripcion'];
                            $promedio_venta = $fila['Promedio_Venta'];
                            $total = $fila['TotalVenta'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $id_producto ?></td>
                    <td><?php echo $descripcion ?></td>
                    <td><?php echo $promedio_venta ?></td>
                    <td><?php echo $total ?></td>
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>
