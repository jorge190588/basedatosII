/*PROCEDIMIENTO ALMANCENADO PARA ELIMINAR DATOS EN UNA TABLA*/

create procedure eliminardatos (@codigo int)
as
delete from clientes where id=@codigo


exec eliminardatos'8'

drop procedure eliminardatos;

select *from clientes

