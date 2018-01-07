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
       <h3 class="center-align">Ingreso de Personas</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Fecha</th>
                  <th>Estado</th>
                  <th>DOC</th>
                  <th>ID Personal</th>
                  <th>Nombre</th>
                  <th>Genero</th>
                  <th>Edad</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select convert(varchar,sb.Fecha,103) as Fecha, 
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
                                order by sb.Fecha desc, sb.Tipo_Persona desc";
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $fecha = $fila['Fecha'];
                            $tipo_persona = $fila['Tipo_Persona'];
                            $formato = $fila['Formato'];
                            $id_personal = $fila['Id_Personal'];
                            $nombre = $fila['Nombre_Completo'];
                            $genero = $fila['Genero'];
                            $edad = $fila['Edad'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $fecha ?></td>
                    <td><?php echo $tipo_persona ?></td>
                    <td><?php echo $formato ?></td>
                    <td><?php echo $id_personal ?></td>
                    <td><?php echo $nombre ?></td>
                    <td><?php echo $genero ?></td>
                    <td><?php echo $edad ?></td>
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>