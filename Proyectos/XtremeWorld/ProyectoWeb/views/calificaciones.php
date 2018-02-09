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
       <h3 class="center-align">Calificaciones de Servicios</h3>
        <table class="highlight">
            <thead>
              <tr>
                  <th>Año</th>
                  <th>Mes</th>
                  <th>Servicio</th>
                  <th>Estrellas Promedio</th>
                  <th>Total de Estrellas</th>
              </tr>
            </thead>
            <tbody>
                <?php
                    $consulta = "select sub.Anho, sub.Mes, sub.Servicio, sub.Promedio_Estrellas, sub.Total_Estrellas 
                                from (
                                    select sb.Anho as Anho,
                                           sb.Id_mes as Id_Mes,
                                           sb.Mes as Mes,
                                           sb.Servicio as Servicio,
                                           avg(sb.N_Estrellas) as Promedio_Estrellas,
                                           sum(sb.N_Estrellas) as Total_Estrellas
                                    from (
                                        select (case when month(c.fecha) = 1 then 'Enero' else 
                                                case when month(c.fecha) = 2 then 'Febrero' else 
                                                    case when month(c.fecha) = 3 then 'Marzo' else 
                                                        case when month(c.fecha) = 4 then 'Abril' else 
                                                            case when month(c.fecha) = 5 then 'Mayo' else 
                                                                case when month(c.fecha) = 6 then 'Junio' 
                                                                END 
                                                            END 
                                                        END 
                                                    END 
                                                END 
                                               END) as Mes,
                                               month(c.fecha) as Id_mes,
                                               year(c.fecha) as Anho,
                                               (s.descripcion) as Servicio,
                                               c.n_estrellas as N_Estrellas
                                        from Servicio as s
                                        left join Calificacion as c on s.id = c.id_servicio
                                        where c.fecha between convert(date, dateadd(MONTH, -2, GETDATE()), 111) and  convert(date, getDate(), 111)
                                        and datepart(qq, c.fecha) in (1, 2)
                                        ) as sb
                                    group by sb.Mes, sb.Id_mes, sb.Anho, sb.Servicio

                                    union all

                                    select sb.Anho as Anho,
                                           sb.Id_mes as Id_Mes,
                                           sb.Mes as Mes,
                                           sb.Servicio as Servicio,
                                           avg(sb.N_Estrellas) as Promedio_Estrellas,
                                           sum(sb.N_Estrellas) as Total_Estrellas
                                    from (
                                        select (case when month(c.fecha) = 7 then 'Julio' else 
                                                case when month(c.fecha) = 8 then 'Agosto' else 
                                                    case when month(c.fecha) = 9 then 'Septiembre' else 
                                                        case when month(c.fecha) = 10 then 'Octubre' else 
                                                            case when month(c.fecha) = 11 then 'Noviembre' else 
                                                                case when month(c.fecha) = 12 then 'Diciembre' 
                                                                END 
                                                            END 
                                                        END 
                                                    END 
                                                END 
                                               END) as Mes,
                                               month(c.fecha) as Id_mes,
                                               year(c.fecha) as Anho,
                                               (s.descripcion) as Servicio,
                                               c.n_estrellas as N_Estrellas
                                        from Servicio as s
                                        left join Calificacion as c on s.id = c.id_servicio
                                        where c.fecha between convert(date, dateadd(MONTH, -2, GETDATE()), 111) and  convert(date, getDate(), 111)
                                        and datepart(qq, c.fecha) in (3, 4)
                                        ) as sb
                                    group by sb.Mes, sb.Id_mes, sb.Anho, sb.Servicio
                                ) as sub
                                order by sub.Anho desc, sub.Id_mes desc, sub.Promedio_Estrellas desc, sub.Total_Estrellas desc, sub.Servicio";
                
                $ejecutar = sqlsrv_query($conn, $consulta);
                        $i = 0;
                        while($fila = sqlsrv_fetch_array($ejecutar)) {
                            $anho = $fila['Anho'];
                            $mes = $fila['Mes'];
                            $servicio = $fila['Servicio'];
                            $promedio_estrellas = $fila['Promedio_Estrellas'];
                            $total_estrellas = $fila['Total_Estrellas'];
                            $i++;
                ?>
                <tr>
                    <td><?php echo $anho ?></td>
                    <td><?php echo $mes ?></td>
                    <td><?php echo $servicio ?></td>
                    <td><?php echo $promedio_estrellas ?></td>
                    <td><?php echo $total_estrellas ?></td>
                </tr>
                 
                <?php
                    }
                ?>
            </tbody>
        </table>
      </div>
    </div>
    
</body>