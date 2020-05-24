/*Habilitar grado*/
use studentdata

select gd.id, d.name degree,g.id grade_id, g.name grade,
gd.is_active gradeDegree_is_active, g.is_active grade_is_active
from grade_degree gd, degree d, grade g
where gd.degree_id=d.id and gd.grade_id=g.id


update grade_degree set is_active=1 where id=13;
update grade set is_active=1 where id=13;
update grade_group set is_active=1 where id=3
select * from grade_group