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
       <h3 class="center-align">Facturas de Entrada</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Fecha</th>
                  <th>Entradas Promedio de Adultos</th>
                  <th>Entradas Promedio de Niños</th>
                  <th>Entradas Promedio General</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "
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
        order by sb.Fecha desc";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $fecha = $fila['Fecha'];
                            $adultos = $fila['Promedio_Adultos'];
                            $ninhos = $fila['Promedio_Ninhos'];
                            $general = $fila['Promedio_General'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $adultos ?></td>
                    <td><?php echo $ninhos ?></td>
                    <td><?php echo $general ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>