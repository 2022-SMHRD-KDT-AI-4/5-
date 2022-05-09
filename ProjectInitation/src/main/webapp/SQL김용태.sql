select * 
from party
where pt_id='birth';

select * from party;
select * from PartyTyp;

select * from(
select row_number() over (order by p_id asc) as num, p_id, pt_id, p_name, p_cont, p_img, p_view  from party
where pt_id = 'birth')
where num = 2;

select * from party;

select * from Party	where p_id='xmas1';