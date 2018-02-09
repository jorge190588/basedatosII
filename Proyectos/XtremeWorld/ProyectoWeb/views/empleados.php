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
       <h3 class="center-align">Empleados</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>DPI</th>
                  <th>Empleado</th>
                  <th>Puesto</th>
                  <th>Kiosko</th>
                  <th>Ubicación</th>
                  <th>Salario</th>
                  <th>Tipo de Salario</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select p.id_personal as DPI , 
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
                                order by Puesto, Ubicacion, Empleado";
                    $ejecutar = sqlsrv_query($conn, $consulta);
                    $i = 0;
                    while($fila = sqlsrv_fetch_array($ejecutar)) {
                        $dpi = $fila['DPI'];
                        $empleado = $fila['Empleado'];
                        $puesto = $fila['Puesto'];
                        $kiosko = $fila['Kiosko'];
                        $ubicacion = $fila['Ubicacion'];
                        $salario = $fila['Salario'];
                        $tiposalario = $fila['Tipo_Salario'];
                        $i++;
                  ?>
                <tr>
                    <td><?php echo $dpi ?></td>
                    <td><?php echo $empleado ?></td>
                    <td><?php echo $puesto ?></td>
                    <td><?php echo $kiosko ?></td>
                    <td><?php echo $ubicacion ?></td>
                    <td><?php echo $salario ?></td>
                    <td><?php echo $tiposalario ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>