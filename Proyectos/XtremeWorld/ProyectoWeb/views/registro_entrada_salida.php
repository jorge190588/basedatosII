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
       <h3 class="center-align">Asistencia</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Fecha</th>
                  <th>Cargo</th>
                  <th>Empleado</th>
                  <th>Entrada Formal</th>
                  <th>Entrada</th>
                  <th>Puntualidad</th>
                  <th>Salida Formal</th>
                  <th>Salida</th>
                  <th>Minutos Extra</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select convert(varchar, sb.Fecha,103) as Fecha, 

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
                        order by sb.Fecha desc, Horario_Formal_Entrada, Cargo, Entrada";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $fecha = $fila['Fecha'];
                            $cargo = $fila['Cargo'];
                            $empleado = $fila['Empleado'];
                            $hfentrada = $fila['Horario_Formal_Entrada'];
                            $entrada = $fila['Entrada'];
                            $puntualidad = $fila['MinutosPuntualidad_Entrada'];
                            $hfsalida = $fila['Horario_Formal_Salida'];
                            $salida = $fila['Salida'];
                            $minextra = $fila['MinutosExtra_Salida'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $cargo ?></td>
                    <td><?php echo $empleado ?></td>
                    <td><?php echo $hfentrada ?></td>
                    <td><?php echo $entrada ?></td>
                    <td><?php echo $puntualidad ?></td>
                    <td><?php echo $hfsalida ?></td>
                    <td><?php echo $salida ?></td>
                    <td><?php echo $minextra ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>
