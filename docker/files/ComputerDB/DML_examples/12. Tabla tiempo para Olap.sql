select fecha,año,semestre,trimestre,mes,semana,dia, 
diaNombre,mesNombre1+mesNombre2 as mesNombre, idsalida 
from(	top 10	SELECT  
	fecha, YEAR(fecha) AS año, 
	case when month(fecha) between 1 and  6 then 1 
	else 2 end semestre,
	DATEPART (qq, fecha)   trimestre,
	MONTH(fecha) AS mes, 
	DATEPART (wk, fecha)   semana,
	DAY(fecha) AS dia, 
	DATENAME(dw, fecha) diaNombre,
	case when MONTH(fecha)= 1 then 'Enero' else 
	case when MONTH(fecha)= 2 then 'Febrero' else 
	case when MONTH(fecha)= 3 then 'Marzo' else 
	case when MONTH(fecha)= 4 then 'Abril' else 
	case when MONTH(fecha)= 5 then 'Mayo' else 
	case when MONTH(fecha)= 6 then 'Junio' else '' 
	end end end end end end as mesNombre1,
	case when MONTH(fecha)= 7 then 'Julio' else 
	case when MONTH(fecha)= 8 then 'Agosto' else 
	case when MONTH(fecha)= 9 then 'Septiembre' else 
	case when MONTH(fecha)= 10 then 'Octubre' else 
	case when MONTH(fecha)= 11 then 'Noviembre' else 
	case when MONTH(fecha)= 12 then 'Diciembre' else '' 
	end end end end end end as mesNombre2,
	idSalida AS idsalida
	FROM Salida	) as t



