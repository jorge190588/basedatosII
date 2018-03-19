select fecha,year(fecha) año, month(fecha) mes,day(fecha) dia,
	datepart(wk,fecha) semanaAño,datename(dw,fecha) diaNombre,
	datename(MM,fecha) mesNombre,
	DATEPART(qq,fecha) trimestre,datepart(ww,getDate()) semanaAño,
	datepart(dy,'01/03/2017') diaAño,datepart(yy,'01/03/2017') año ,
	datediff(month,fecha,getDate()) diffMeses
	from salida
select	datediff(month,'10/10/2017','10/11/2017') mesDiff,
		datediff(day,'10/10/2017','10/11/2017') diasDiff,
		datediff(month,'01/01/2017',getDate()) mesNowDiff,
		datediff(day,'01/01/2017',getDate()) diasNowDiff,
		getdate() fechaActual
select	dateadd(day,10,getdate()) [dia+10],
		dateadd(month,-1,getdate()) [mes+1],
		dateadd(year,1,getdate()) [año+1]
select convert(varchar(50),getdate(),103),convert(varchar(50),getdate(),111)
