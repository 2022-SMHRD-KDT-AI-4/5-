SELECT * FROM all_tables where owner = 'HR'
select * from MEMBER;
select * from Invite;
select * from PartyTyp;
select * from Party;
select * from ItemTyp;
select * from Item;
select * from PartyItem;
select * from InvSel;

DROP TABLE InvSel;
DROP TABLE PartyItem;
DROP TABLE Item;
DROP TABLE ItemTyp;
DROP TABLE Party;
DROP TABLE PartyTyp;
DROP TABLE Invite;
DROP TABLE MEMBER5;


--ȸ���������̺�
create table Member(
m_id varchar2(20),
m_pw varchar2(20) not null,
m_name varchar2(50) not null,

constraint member_m_id_pk primary key(m_id)
);

--�ʴ����ۼ����̺�
create table Invite(
v_id number(20),
m_id varchar2(20),
v_name varchar2(100) not null,
v_wdate date,
v_date date,
v_cont varchar2(1000),

constraint invite_v_id_pk primary key(v_id),
constraint invite_m_id_fk foreign key(m_id) references Member(m_id)
);

--��Ƽ�з� ���̺�
create table PartyTyp(
pt_id varchar2(20),
pt_name varchar2(100) not null,
pt_cont varchar2(1000),

constraint partytyp_pt_id_pk primary key(pt_id)
);

--��Ƽ ���̺�
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

--������ �з� ���̺�
create table ItemTyp(
it_id varchar2(20),
it_name varchar2(100) not null,

constraint itemtyp_it_id_pk primary key(it_id)
);

--������ ���̺�
create table Item(
i_id varchar2(20),
it_id varchar2(20),
i_name varchar2(100) not null,
i_cont varchar2(1000),

constraint item_i_id_pk primary key(i_id),
constraint item_it_id_fk foreign key(it_id) references ItemTyp(it_id)
);

--��Ƽ�� ������
create table PartyItem(
p_id varchar2(20),
i_id varchar2(20),

constraint partyitem_p_id_fk foreign key(p_id) references Party(p_id),
constraint partyitem_i_id_fk foreign key(i_id) references Item(i_id)
);

--�ʴ��庰 ������ ���� �� ����
create table InvSel(
v_id number(20),
p_id varchar2(20),
i_id varchar2(20),
sel_g number(2),
sel_h number(2),

constraint invsel_v_id_fk foreign key(v_id) references Invite(v_id),
constraint invsel_p_id_fk foreign key(p_id) references Party(p_id),
constraint invsel_i_id_fk foreign key(i_id) references Item(i_id)
);

--������ �ۼ�
create sequence inv_num_seq
	start with 1
	increment by 1
	maxvalue 99999999999999999999
	nocycle
	nocache
	
	
	

--�Է��׽�Ʈ
insert into Member5 values('test1', 'test1', 'test');
select * from MEMBER5

insert into ItemTyp values('it01', '����');
insert into ItemTyp values('it02', '����');

insert into Item values('i01', 'it01', '���̽�', '���̽���');
insert into Item values('i02', 'it01', 'ó��ó��', '������');
insert into Item values('i03', 'it01', '�ٻ���', '�ٻ�����');

insert into PartyTyp values('birth', '������Ƽ', '������Ƽ��');
insert into PartyTyp values('xmas', 'ũ����������Ƽ', 'ũ����������Ƽ��');

insert into Party values('birth1', 'birth', '�ų��»���', '�ų��� ���� ������Ƽ', 'img', 1);
insert into Party values('birth2', 'birth', '��ſ����', '��̰� ���� ������Ƽ', 'img', 1);
insert into Party values('xmas1', 'xmas', '��Ÿũ����������Ƽ', '��Ÿ�� �ĵ����� ��Ƽ', 'img', 1);
insert into Party values('xmas2', 'xmas', '�絹�� ��Ƽ', '�絹�� 3�� ���', 'img', 1);

insert into PartyItem values('birth1', 'i01');
insert into PartyItem values('birth1', 'i02');
insert into PartyItem values('birth1', 'i03');

insert into PartyItem values('birth2', 'i01');
insert into PartyItem values('birth2', 'i02');
insert into PartyItem values('xmas1', 'i03');
insert into PartyItem values('xmas2', 'i02');



insert into Invite values(0, 'test1','�ʴ���1',sysdate, sysdate,'�츮����ȭ����');
insert into Invite values(inv_num_seq.nextval, 'test1','�ʴ���1',sysdate, sysdate,'�츮����ȭ����');

insert into InvSel values(1, 'birth1','i01',null,null);
insert into InvSel values(1, 'birth1','i02',null,null);
insert into InvSel values(1, 'birth1','i03',null,null);

--���� ã�Ƽ� �´� ���� ����

insert into InvSel (p_id, i_id)
select p_id, i_id 
from PartyItem
where p_id = 'birth2';

--�ΰ��� ���������� ����

update InvSel set v_id = 1
where v_id is null;

select * from InvSel;

delete from invsel where v_id is null;