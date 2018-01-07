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
       <h3 class="center-align">Funciones</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Funcion</th>
                  <th>Artista</th>
                  <th>Categoria</th>
                  <th>Precio</th>
                  <th>Fecha</th>
                  <th>Hora de Inicio</th>
                  <th>Hora de Fin</th>
                  <th>Lugar</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select f.descripcion as Funcion,
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
                                order by f.fecha_funcion desc, f.id_ubicacion";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $funcion = $fila['Funcion'];
                            $artista = $fila['Artista'];
                            $categoria = $fila['Categoria'];
                            $precio = $fila['Precio'];
                            $fecha = $fila['Fecha'];
                            $hora_inicio = $fila['Hora_Inicio'];
                            $hora_fin = $fila['Hora_Fin'];
                            $lugar = $fila['Lugar'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $funcion ?></td>
                    <td><?php echo $artista ?></td>
                    <td><?php echo $categoria ?></td>
                    <td><?php echo $precio ?></td>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $hora_inicio ?></td>
                    <td><?php echo $hora_fin ?></td>
                    <td><?php echo $lugar ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>