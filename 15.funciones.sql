

-- =============================================
--funcion para calcular el iva 
create function IVA (@cantidad money)
returns money 
as 
begin
	declare @resultado money 
	set @resultado = @cantidad * 0.12
	return (@resultado)
end 
---ejecutar la funcion
select nombre,precio, dbo.iva(precio)as iva
from Productos

-- =============================================
--- funcion que devuelve cliente de un determinado idmunicipio 
create function listadopais (@pais varchar (100))
returns table 
as 
return 
(
select idCliente, nombreCliente
,idMunicipio from  clientes where idMunicipio =@pais 

)
---ejecuta la funcion 
select * from dbo.listadopais ('2')

