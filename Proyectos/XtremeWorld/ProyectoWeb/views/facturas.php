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
       <h3 class="center-align">Facturas</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Fecha</th>
                  <th>Nit</th>
                  <th>Cliente</th>
                  <th>Kiosko</th>
                  <th>Forma de Pago</th>
                  <th>Costo Total</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select convert(varchar, f.fecha, 103) as Fecha,
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
                                order by f.fecha desc, (select sum(subtotal) from VentaProducto where id_factura = f.id) desc, fp.id";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $fecha = $fila['Fecha'];
                            $nit = $fila['Nit'];
                            $cliente = $fila['Cliente'];
                            $kiosko = $fila['Kiosko'];
                            $forma_pago = $fila['Forma_Pago'];
                            $costo_total = $fila['Total'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $nit ?></td>
                    <td><?php echo $cliente ?></td>
                    <td><?php echo $kiosko ?></td>
                    <td><?php echo $forma_pago ?></td>
                    <td><?php echo $costo_total ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>