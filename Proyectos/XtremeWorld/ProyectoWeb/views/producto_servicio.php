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
       <h3 class="center-align">Productos y Servicios</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Producto</th>
                  <th>Servicio</th>
                  <th>Cantidad Recaudada</th>
                  <th>Fecha</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select p.descripcion as Producto,
                                       s.descripcion as Servicio,
                                       count(*) as Cantidad_Recaudada,
                                       convert(varchar, r.fecha, 103) as Fecha
                                from Recaudado as r
                                inner join ServicioProducto as sp on sp.id = r.id_servicioProducto
                                inner join Producto as p on p.id = sp.id_producto
                                inner join Servicio as s on s.id = sp.id_servicio
                                where r.fecha between convert(date, dateadd(MONTH, -1, GETDATE()), 111) and  convert(date, getDate(), 111)
                                group by r.fecha, p.descripcion, s.descripcion, r.id_servicioProducto
                                order by r.fecha desc, Cantidad_Recaudada desc, r.id_servicioProducto";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $producto = $fila['Producto'];
                            $servicio = $fila['Servicio'];
                            $n_recaudado = $fila['Cantidad_Recaudada'];
                            $fecha = $fila['Fecha'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $producto ?></td>
                    <td><?php echo $servicio ?></td>
                    <td><?php echo $n_recaudado ?></td>
                    <td><?php echo $fecha ?></td>
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>
