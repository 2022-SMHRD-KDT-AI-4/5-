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

select * from Invite;
ALTER TABLE Invite  ADD (p_id varchar2(20));
      
alter table Invite add foreign key(p_id) references Party(p_id);

select * from invselitm where v_id = 3;

delete InvSelItm;
delete InvSel;
delete INVITE;

select * from MEMBER;
select * from Invite;
select * from PartyTyp;
select * from Party;
select * from ItemTyp;
select * from Item;
select * from PartyItem;
select * from InvSel;
select * from InvSelItm;


select a.v_id as v_id, a.m_id as m_id, a.v_name as v_name, to_char(a.v_date, 'yyyy-mm-dd') as v_date,
a.v_adr as v_adr, a.v_cont as v_cont, a.p_id as p_id, b.p_img as p_img
from Invite a, Party b 
where a.p_id = b.p_id 
and a.m_id = 'test1';


select a.v_id as v_id, a.i_id as i_id, a.sel_g as sel_g, a.sel_h as sel_h, b.i_name as i_name, b.i_cont as i_cont  
from InvSelItm a, Item b 
where a.i_id = b.i_id and v_id=3;

select to_char(v_date, 'yyyy-mm-dd') as v_date from Invite;


update InvSelItm set sel_g = sel_g + 1
where v_id=10
<<<<<<< HEAD
and i_id='cake2';
=======
and i_id='cake2';

select * from InvSelItm a, item b
where a.i_id = b.i_id
and sel_h>0
and v_id=12;


select * from(
		select row_number() over (order by p_id asc) as num, p_id, pt_id, p_name, p_cont, p_img, p_view  
		from party
		where pt_id = 'xmas')
		where num = 1;
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-AI-4/5micron.git
