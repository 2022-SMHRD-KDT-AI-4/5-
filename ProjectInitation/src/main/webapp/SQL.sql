SELECT * FROM all_tables where owner = 'CGI_6_0418_4'
select * from MEMBER;
select * from Invite;
select * from PartyTyp;
select * from Party;
select * from ItemTyp;
select * from Item;
select * from PartyItem;
select * from InvSel;
select * from InvSelItm;

DROP TABLE InvSelItm;
DROP TABLE InvSel;
DROP TABLE PartyItem;
DROP TABLE Item;
DROP TABLE ItemTyp;
DROP TABLE Party;
DROP TABLE PartyTyp;
DROP TABLE Invite;
DROP TABLE MEMBER5;


--회원정보테이블
create table Member(
m_id varchar2(20),
m_pw varchar2(20) not null,
m_name varchar2(50) not null,

constraint member_m_id_pk primary key(m_id)
);

--초대장작성테이블
create table Invite(
v_id number(20),
m_id varchar2(20),
v_name varchar2(100) not null,
v_date date,
v_adr varchar2(1000),
v_cont varchar2(1000),

constraint invite_v_id_pk primary key(v_id),
constraint invite_m_id_fk foreign key(m_id) references Member5(m_id)
);

--파티분류 테이블
create table PartyTyp(
pt_id varchar2(20),
pt_name varchar2(100) not null,
pt_cont varchar2(1000),

constraint partytyp_pt_id_pk primary key(pt_id)
);

--파티 테이블
create table Party(
p_id varchar2(20),
pt_id varchar2(20),
p_name varchar2(100) not null,
p_cont varchar2(1000),
p_img varchar2(100),
p_view number(20) not null,

constraint party_p_id_pk primary key(p_id),
constraint party_pt_id_fk foreign key(pt_id) references PartyTyp(pt_id)
);

--아이템 분류 테이블
create table ItemTyp(
it_id varchar2(20),
it_name varchar2(100) not null,

constraint itemtyp_it_id_pk primary key(it_id)
);

--아이템 테이블
create table Item(
i_id varchar2(20),
it_id varchar2(20),
i_name varchar2(100) not null,
i_cont varchar2(1000),

constraint item_i_id_pk primary key(i_id),
constraint item_it_id_fk foreign key(it_id) references ItemTyp(it_id)
);

--파티별 아이템
create table PartyItem(
p_id varchar2(20),
i_id varchar2(20),

constraint partyitem_p_id_fk foreign key(p_id) references Party(p_id),
constraint partyitem_i_id_fk foreign key(i_id) references Item(i_id)
);

--초대장별 아이템 추출 및 설문
create table InvSel(
v_id number(20),
p_id varchar2(20),

constraint invsel_v_id_fk foreign key(v_id) references Invite(v_id),
constraint invsel_p_id_fk foreign key(p_id) references Party(p_id)
);

create table InvSelItm(
v_id number(20),
i_id varchar2(20),
sel_g number(3),
sel_h number(3),

constraint invselitm_v_id_fk foreign key(v_id) references Invite(v_id),
constraint invseltim_i_id_fk foreign key(i_id) references Item(i_id)
);

--시퀸스 작성
create sequence inv_num_seq
	start with 1
	increment by 1
	maxvalue 99999999999999999999
	nocycle
	nocache
	
drop sequence inv_num_seq;
	
	
	

--입력테스트
insert into Member5 values('test1', 'test1', 'test');
select * from MEMBER5

insert into ItemTyp values('it01', '소주');
insert into ItemTyp values('it02', '양주');

insert into Item values('i01', 'it01', '참이슬', '참이슬임');
insert into Item values('i02', 'it01', '처음처럼', '소주임');
insert into Item values('i03', 'it01', '잎새주', '잎새주임');
insert into Item values('i04', 'it01', '카스','');
insert into Item values('i05', 'it01', '하이트', '');
insert into Item values('i06', 'it01', '오비', '');

insert into PartyTyp values('birth', '생일파티', '생일파티임');
insert into PartyTyp values('xmas', '크리스마스파티', '크리스마스파티임');

insert into Party values('birth1', 'birth', '신나는생파', '신나게 즐기는 생일파티', 'img', 1);
insert into Party values('birth2', 'birth', '즐거운생파', '즐겁게 즐기는 생일파티', 'img', 1);
insert into Party values('xmas1', 'xmas', '산타크리스마스파티', '산타가 쳐들어오는 파티', 'img', 1);
insert into Party values('xmas2', 'xmas', '루돌프 파티', '루돌프 3관 기념', 'img', 1);

insert into PartyItem values('birth1', 'i01');
insert into PartyItem values('birth1', 'i02');
insert into PartyItem values('birth1', 'i03');
insert into PartyItem values('birth1', 'i05');

insert into PartyItem values('birth2', 'i01');
insert into PartyItem values('birth2', 'i02');
insert into PartyItem values('birth2', 'i06');
insert into PartyItem values('xmas1', 'i03');
insert into PartyItem values('xmas2', 'i02');



insert into Invite values(0, 'test1','초대장1',sysdate, sysdate,'우리존재화이팅');
insert into Invite values(inv_num_seq.nextval, 'test1','초대장1',sysdate, sysdate,'우리존재화이팅');
select * from Invite;

insert into InvSel values(1, 'birth1','i01',null,null);
insert into InvSel values(1, 'birth1','i02',null,null);
insert into InvSel values(1, 'birth1','i03',null,null);

--조건 찾아서 맞는 열을 생성

insert into InvSel (p_id, i_id)
select p_id, i_id 
from PartyItem
where p_id = 'birth2';

--널값을 지정값으로 변경

update InvSel set v_id = 1
where v_id is null;

select * from InvSel;

delete from invsel where v_id is null;


--시퀸스 마지막 번호 가져오기
select LAST_NUMBER from USER_SEQUENCES where SEQUENCE_NAME = 'INV_NUM_SEQ';

		
		
--테스트
insert into Invite
values(inv_num_seq.nextval, 'test1', 'aaa', sysdate, sysdate, 'aaaa');
select * from Invite;


--다시만들기

delete Invite;
drop sequence inv_num_seq;
--초대장작성테이블

create sequence inv_num_seq
	start with 1
	increment by 1
	maxvalue 99999999999999999999
	nocycle
	nocache;
	
select LAST_NUMBER from USER_SEQUENCES where SEQUENCE_NAME = 'INV_NUM_SEQ';

select * from Invite;
select * from Invsel;
select * from InvselItm;

select DISTINCT b.i_id from Invsel a, PartyItem b
where a.v_id = 4 
and a.p_id = b.p_id;

delete InvSelItm;
drop table InvselItm;
drop table Invsel;
drop table Invite;

insert into InvSelItm (v_id, i_id, sel_h, sel_g)
select DISTINCT 4, b.i_id ,0, 0 from Invsel a, PartyItem b
where a.v_id = 4 
and a.p_id = b.p_id;

select a.p_id as p_id, b.i_id as i_id, b.it_id as it_it, b.i_name as i_name, b.i_cont as i_cont 
from PARTYITEM a, ITEM b
where a.i_id = b.i_id
and a.p_id='birth2';