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
       <h3 class="center-align">Horarios Laborales</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Dia</th>
                  <th>Puesto</th>
                  <th>Horario de Entrada</th>
                  <th>Horario de Salida</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select sb.Dia as Dia, sb.Puesto as Puesto, sb.Entrada as Entrada, sb.Salida as Salida
                                    from (
                                            select distinct d.descripcion as Dia,
                                                    hl.id_dia as N_Dia,
                                                   c.descripcion as Puesto,
                                                   (select convert(varchar, hora, 108) from HorarioLaboral as sb_hl 
                                                    where sb_hl.id_cargo = hl.id_cargo
                                                    and sb_hl.id_dia = hl.id_dia
                                                    and sb_hl.id_tipoRegistro = 1) as Entrada,
                                                    (select convert(varchar, hora, 108) from HorarioLaboral as sb_hl 
                                                    where sb_hl.id_cargo = hl.id_cargo
                                                    and sb_hl.id_dia = hl.id_dia
                                                    and sb_hl.id_tipoRegistro = 2) as Salida
                                            from HorarioLaboral as hl
                                            inner join Cargo as c on c.id = hl.id_cargo
                                            inner join Dia as d on d.id = hl.id_dia) as sb
                                            order by sb.N_Dia, sb.Puesto";
                    $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $dia = $fila['Dia'];
                            $puesto = $fila['Puesto'];
                            $entrada = $fila['Entrada'];
                            $salida = $fila['Salida'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $dia ?></td>
                    <td><?php echo $puesto ?></td>
                    <td><?php echo $entrada ?></td>
                    <td><?php echo $salida ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>