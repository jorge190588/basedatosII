use ComputerDB;

select row_number() over(ORDER BY year(fecha),month(fecha)) id,
year(fecha) ano, month(fecha) mes , sum(cantidad*precio) ventas
from salida s, SalidaDetalle d
where s.idSalida=d.idSalida
group by year(fecha),month(fecha)
