SELECT * FROM all_tables where owner like 'CGI%';
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

insert into PartyTyp
values('bridal', '����̴�����',null);

insert into PartyTyp
values('xmas', 'ũ��������', null);

insert into PartyTyp
values('baby', '���̺����', null);

insert into PartyTyp
values('birth', '������Ƽ', null);

insert into PartyTyp
values('halloween', '�ҷ���', null);

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

insert into Party
values('bridal1', 'bridal', '����̴�����1', null, 'bridal3.jpg', 0 );

insert into Party
values('bridal2', 'bridal', '����̴�����2', null, 'bridal44.jpg', 0 );

insert into Party
values('bridal3', 'bridal', '����̴�����3', null, 'bridal5.jpg', 0 );

insert into Party
values('bridal4', 'bridal', '����̴�����4', null, 'bridal6.jpg', 0 );

insert into Party
values('bridal5', 'bridal', '����̴�����5', null, 'bridal7.jpg', 0 );

insert into Party
values('bridal6', 'bridal', '����̴�����6', null, 'bridal8.jpg', 0 );

insert into Party
values('bridal7', 'bridal', '����̴�����7', null, 'bridal9.jpg', 0 );

insert into Party
values('bridal8', 'bridal', '����̴�����8', null, 'bridal10.jpg', 0 );

insert into Party
values('bridal9', 'bridal', '����̴�����9', null, 'bridal11.jpg', 0 );

insert into Party
values('bridal10', 'bridal', '����̴�����10', null, 'bridal12.jpg', 0 );

insert into Party
values('bridal11', 'bridal', '����̴�����11', null, 'bridal13.jpg', 0 );

insert into Party
values('bridal12', 'bridal', '����̴�����12', null, 'bridal14.jpg', 0 );

insert into Party
values('bridal13', 'bridal', '����̴�����13', null, 'bridal15.jpg', 0 );

insert into Party
values('xmas1', 'xmas', 'ũ��������1', null, 'christmas1.jpg', 0 );

insert into Party
values('xmas2', 'xmas', 'ũ��������2', null, 'christmas2.png', 0 );

insert into Party
values('xmas3', 'xmas', 'ũ��������3', null, 'christmas4.jpg', 0 );

insert into Party
values('xmas4', 'xmas', 'ũ��������4', null, 'christmas5.jpg', 0 );

insert into Party
values('xmas5', 'xmas', 'ũ��������5', null, 'christmas6.jpg', 0 );

insert into Party
values('xmas6', 'xmas', 'ũ��������6', null, 'christmas7.jpg', 0 );

insert into Party
values('xmas7', 'xmas', 'ũ��������7', null, 'christmas8.jpg', 0 );

insert into Party
values('xmas8', 'xmas', 'ũ��������8', null, 'christmas9.jpg', 0 );

insert into Party
values('xmas9', 'xmas', 'ũ��������9', null, 'christmas10.jpg', 0 );

insert into Party
values('xmas10', 'xmas', 'ũ��������10', null, 'christmas11.jpg', 0 );

insert into Party
values('xmas11', 'xmas', 'ũ��������11', null, 'christmas12.jpg', 0 );

insert into Party
values('halloween1', 'halloween', '�ҷ���1', null, 'halloween1.png', 0 );

insert into Party
values('halloween2', 'halloween', '�ҷ���2', null, 'halloween2.png', 0 );

insert into Party
values('halloween3', 'halloween', '�ҷ���3', null, 'halloween3.png', 0 );

insert into Party
values('halloween4', 'halloween', '�ҷ���4', null, 'halloween4.png', 0 );

insert into Party
values('halloween5', 'halloween', '�ҷ���5', null, 'halloween5.png', 0 );

insert into Party
values('halloween6', 'halloween', '�ҷ���6', null, 'halloween6.png', 0 );

insert into Party
values('halloween7', 'halloween', '�ҷ���7', null, 'halloween7.png', 0 );

insert into Party
values('halloween8', 'halloween', '�ҷ���8', null, 'halloween8.png', 0 );

insert into Party
values('baby1', 'baby', '���̺����1', null, 'baby1.png', 0 );

insert into Party
values('baby2', 'baby', '���̺����2', null, 'baby2.png', 0 );

insert into Party
values('baby3', 'baby', '���̺����3', null, 'baby3.png', 0 );

insert into Party
values('baby4', 'baby', '���̺����4', null, 'baby4.png', 0 );

insert into Party
values('baby5', 'baby', '���̺����5', null, 'baby5.png', 0 );

insert into Party
values('baby6', 'baby', '���̺����6', null, 'baby6.png', 0 );

insert into Party
values('baby7', 'baby', '���̺����7', null, 'baby7.png', 0 );

insert into Party
values('baby8', 'baby', '���̺����8', null, 'baby8.png', 0 );

insert into Party
values('baby9', 'baby', '���̺����9', null, 'baby9.png', 0 );

insert into Party
values('baby10', 'baby', '���̺����10', null, 'baby10.png', 0 );

insert into Party
values('birth1', 'birth', '������Ƽ1', null, 'birthday1.png', 0 );

insert into Party
values('birth2', 'birth', '������Ƽ2', null, 'birthday2.png', 0 );

insert into Party
values('birth3', 'birth', '������Ƽ3', null, 'birthday3.png', 0 );

insert into Party
values('birth4', 'birth', '������Ƽ4', null, 'birthday4.png', 0 );

insert into Party
values('birth5', 'birth', '������Ƽ5', null, 'birthday5.png', 0 );

insert into Party
values('birth6', 'birth', '������Ƽ6', null, 'birthday6.png', 0 );

insert into Party
values('birth7', 'birth', '������Ƽ7', null, 'birthday7.png', 0 );

insert into Party
values('birth8', 'birth', '������Ƽ8', null, 'birthday8.png', 0 );

insert into Party
values('birth9', 'birth', '������Ƽ9', null, 'birthday9.png', 0 );

insert into Party
values('birth10', 'birth', '������Ƽ10', null, 'birthday10.png', 0 );

insert into Party
values('birth11', 'birth', '������Ƽ11', null, 'birthday11.png', 0 );

insert into Party
values('birth12', 'birth', '������Ƽ12', null, 'birthday12.png', 0 );


--������ �з� ���̺�
create table ItemTyp(
it_id varchar2(20),
it_name varchar2(100) not null,

constraint itemtyp_it_id_pk primary key(it_id)
);

insert into ItemTyp
values('deco', '����');

insert into ItemTyp
values('dessert', '����Ʈ');

insert into ItemTyp
values('drink', '����');

insert into ItemTyp
values('food', '����');

insert into ItemTyp
values('acc', '�Ǽ�����');

--������ ���̺�
create table Item(
i_id varchar2(20),
it_id varchar2(20),
i_name varchar2(100) not null,
i_cont varchar2(1000),

constraint item_i_id_pk primary key(i_id),
constraint item_it_id_fk foreign key(it_id) references ItemTyp(it_id)
);


insert into Item
values('afternoontea','dessert','�����ʹ�Ƽ��Ʈ',null);

insert into Item
values('artificialflower','deco','��ȭ',null);

insert into Item
values('baguette','food','�ٰ�Ʈ',null);

insert into Item
values('balloon','deco','�Ź��ٸ��ǳ��',null);

insert into Item
values('balloon2','deco','�ɸ��ǳ��',null);

insert into Item
values('balloon3','deco','����ǳ��',null);

insert into Item
values('balloon4','deco','����׸�ǳ��',null);

insert into Item
values('balloon5','deco','���ָ��ǳ��',null);

insert into Item
values('balloon6','deco','������ǳ��',null);

insert into Item
values('balloon7','deco','�������ǳ��',null);

insert into Item
values('balloon8','deco','�����ǳ��',null);

insert into Item
values('balloon9','deco','����ǳ��',null);

insert into Item
values('balloon10','deco','������ǳ��',null);

insert into Item
values('balloon11','deco','������ǳ��',null);

insert into Item
values('balloon12','deco','�Ʊ�����ǳ��',null);

insert into Item
values('balloon13','deco','����ǳ��',null);

insert into Item
values('balloon14','deco','���ɸ��ǳ��',null);

insert into Item
values('balloon15','deco','���������ǳ��',null);

insert into Item
values('balloon16','deco','��ǥ���ǳ��',null);

insert into Item
values('balloon17','deco','������ǳ��',null);

insert into Item
values('balloon18','deco','��Ʈ���ǳ��',null);

insert into Item
values('balloon19','deco','ȣ�ڸ��ǳ��',null);

insert into Item
values('balloon20','deco','����ǳ��',null);

insert into Item
values('balloon21','deco','�ذ���ǳ��',null);

insert into Item
values('balloonbox','deco','ǳ������',null);

insert into Item
values('balloonset','deco','ǳ����Ʈ',null);

insert into Item
values('barbecue','food','�ٺ�ť ����',null);

insert into Item
values('batprops','deco','�����ǰ',null);

insert into Item
values('batsticker','deco','���㽺ƼĿ',null);

insert into Item
values('beef','food','�Ұ��',null);

insert into Item
values('beer','drink','����',null);

insert into Item
values('bossam','food','����',null);

insert into Item
values('bracelet','acc','������',null);

insert into Item
values('bread','food','��',null);

insert into Item
values('bulb','deco','����',null);

insert into Item
values('bulgogi','food','�Ұ��',null);

insert into Item
values('cake1','food','��������ũ',null);

insert into Item
values('cake2','food','��ũ������ũ',null);

insert into Item
values('cake3','food','���ݸ�����ũ',null);

insert into Item
values('cake4','food','ġ������ũ',null);

insert into Item
values('cake5','food','����ũ',null);

insert into Item
values('cake6','food','������ũ',null);

insert into Item
values('california','food','Ķ�����Ͼ� ��',null);

insert into Item
values('canape','food','ī����',null);

insert into Item
values('candle','deco','����',null);

insert into Item
values('champagne','drink','������',null);

insert into Item
values('choco','dessert','���ں����',null);

insert into Item
values('cider','drink','���̴�',null);

insert into Item
values('clam','food','������ ��䱸��',null);

insert into Item
values('cockle','food','����',null);

insert into Item
values('conehat','deco','������',null);

insert into Item
values('cookie','dessert','��Ű',null);

insert into Item
values('cracker','dessert','����',null);

insert into Item
values('cup','deco','��',null);

insert into Item
values('doll','deco','����',null);

insert into Item
values('donut','dessert','����',null);

insert into Item
values('minidonut','dessert','��ġŲ', null);

insert into Item
values('dumpling','food','����',null);

insert into Item
values('electricchicken','food','���ⱸ�����',null);

insert into Item
values('flower','deco','��',null);

insert into Item
values('fruit1','dessert','����',null);

insert into Item
values('fruit2','dessert','����',null);

insert into Item
values('fruit3','dessert','����',null);

insert into Item
values('fruit4','dessert','���θӽ�Ĺ',null);

insert into Item
values('fruit5','dessert','���ø���',null);

insert into Item
values('gambas','food','���ٽ� �� ������',null);

insert into Item
values('garland','deco','������',null);

insert into Item
values('gimbap','food','���',null);

insert into Item
values('glasses','deco','�Ȱ�',null);

insert into Item
values('grilledvege','food','��ä����',null);

insert into Item
values('guobaorou','food','��ٷο�',null);

insert into Item
values('hamburger','food','�ܹ���',null);

insert into Item
values('icecream','dessert','���̽�ũ��',null);

insert into Item
values('invitationcard','deco','�ʴ���',null);

insert into Item
values('grapefruitjuice','drink','�ڸ��ֽ�',null);

insert into Item
values('japchae','food','��ä',null);

insert into Item
values('lamp','deco','����',null);

insert into Item
values('lemonsparkling','drink','���� ����Ŭ��',null);

insert into Item
values('letteringballoon','deco','���͸�ǳ��',null);

insert into Item
values('lunchbox','food','���ö�',null);

insert into Item
values('macaron','dessert','��ī��',null);

insert into Item
values('montshell','dessert','����',null);

insert into Item
values('mood','deco','�����',null);

insert into Item
values('muffin','dessert','����',null);

insert into Item
values('nabe','food','��ǣ������',null);

insert into Item
values('nacho','food','����',null);

insert into Item
values('nutella','dessert','���ڶ� ��',null);

insert into Item
values('net','deco','�׹�',null);

insert into Item
values('orangejuice','drink','�������ֽ�',null);

insert into Item
values('orangesparkling','drink','������ ����Ŭ��',null);

insert into Item
values('oyster','food','��ȭ��',null);

insert into Item
values('pancake','food','��ħ��',null);

insert into Item
values('papercup','deco','������',null);

insert into Item
values('pizza','food','����',null);

insert into Item
values('pollen','deco','�ɰ���',null);

insert into Item
values('potato','food','����Ƣ��',null);

insert into Item
values('pretzel','dessert','����ÿ',null);

insert into Item
values('pumpkincup','deco','ȣ�ڸ����',null);

insert into Item
values('pumpkinprops','deco','ȣ�ڼ�ǰ',null);

insert into Item
values('rabbitdoll','deco','�䳢����',null);

insert into Item
values('redwine','drink','�������',null);

insert into Item
values('ricecake','dessert','��',null);

insert into Item
values('salad1','food','����Ÿġ�������',null);

insert into Item
values('salad2','food','�߰����������',null);

insert into Item
values('salad3','food','�ƺ�ī��������',null);

insert into Item
values('salad4','food','������',null);

insert into Item
values('sausage','food','�����ҽ���',null);

insert into Item
values('shrimp','food','���챸��',null);

insert into Item
values('sparklingwine','drink','����Ŭ������',null);

insert into Item
values('squid','food','���¡���',null);

insert into Item
values('stake','food','������ũ',null);

insert into Item
values('sushi1','food','�����ʹ�',null);

insert into Item
values('sushi2','food','�ʹ�',null);

insert into Item
values('sweetpotato','dessert','����',null);

insert into Item
values('teddybear','deco','����������',null);

insert into Item
values('vine','deco','����',null);

insert into Item
values('vongole','food','�����Ľ�Ÿ',null);

insert into Item
values('waffle1','dessert','�������',null);

insert into Item
values('waffle2','dessert','����',null);

insert into Item
values('wedge','food','��������',null);

insert into Item
values('whitewine','drink','ȭ��Ʈ����',null);

insert into Item
values('wine','drink','����',null);

insert into Item
values('xmastree','deco','ũ��������Ʈ��',null);

insert into Item
values('yusanseul','food','���꽽',null);

insert into Item
values('chicken', 'food', 'ġŲ', null);

--��Ƽ�� ������
create table PartyItem(
p_id varchar2(20),
i_id varchar2(20),

constraint partyitem_p_id_fk foreign key(p_id) references Party(p_id),
constraint partyitem_i_id_fk foreign key(i_id) references Item(i_id)
);

insert into PartyItem
values('baby1','artificialflower');

insert into PartyItem
values('baby1','letteringballoon');

insert into PartyItem
values('baby1','teddybear');

insert into PartyItem
values('baby1','balloonset');

insert into PartyItem
values('baby2','artificialflower');

insert into PartyItem
values('baby2','balloon12');

insert into PartyItem
values('baby2','balloonset');

insert into PartyItem
values('baby2','bread');

insert into PartyItem
values('baby2','cake5');

insert into PartyItem
values('baby2','fruit1');

insert into PartyItem
values('baby2','letteringballoon');

insert into PartyItem
values('baby3','artificialflower');

insert into PartyItem
values('baby3','balloon12');

insert into PartyItem
values('baby3','cake5');

insert into PartyItem
values('baby3','cracker');

insert into PartyItem
values('baby3','fruit2');

insert into PartyItem
values('baby3','fruit3');

insert into PartyItem
values('baby3','letteringballoon');

insert into PartyItem
values('baby3','macaron');

insert into PartyItem
values('baby3','montshell');

insert into PartyItem
values('baby3','muffin');

insert into PartyItem
values('baby4','artificialflower');

insert into PartyItem
values('baby4','balloonset');

insert into PartyItem
values('baby4','cake5');

insert into PartyItem
values('baby4','invitationcard');

insert into PartyItem
values('baby4','letteringballoon');

insert into PartyItem
values('baby5','balloon12');

insert into PartyItem
values('baby5','balloonset');

insert into PartyItem
values('baby5','cake5');

insert into PartyItem
values('baby5','letteringballoon');

insert into PartyItem
values('baby5','macaron');

insert into PartyItem
values('baby6','artificialflower');

insert into PartyItem
values('baby6','balloon12');

insert into PartyItem
values('baby6','balloonset');

insert into PartyItem
values('baby6','candle');

insert into PartyItem
values('baby6','letteringballoon');

insert into PartyItem
values('baby7','cake5');

insert into PartyItem
values('baby7','cracker');

insert into PartyItem
values('baby7','fruit1');

insert into PartyItem
values('baby7','letteringballoon');

insert into PartyItem
values('baby7','lunchbox');

insert into PartyItem
values('baby8','balloon12');

insert into PartyItem
values('baby8','balloonbox');

insert into PartyItem
values('baby8','balloonset');

insert into PartyItem
values('baby8','doll');

insert into PartyItem
values('baby8','letteringballoon');

insert into PartyItem
values('baby9','balloon12');

insert into PartyItem
values('baby9','balloonset');

insert into PartyItem
values('baby9','letteringballoon');

insert into PartyItem
values('baby10','balloon15');

insert into PartyItem
values('baby10','balloonset');

insert into PartyItem
values('baby10','cake5');

insert into PartyItem
values('baby10','conehat');

insert into PartyItem
values('baby10','letteringballoon');

insert into PartyItem
values('baby10','nabe');

insert into PartyItem
values('baby10','pancake');

insert into PartyItem
values('baby10','salad2');

insert into PartyItem
values('baby10','yusanseul');

insert into PartyItem
values('bridal1','bracelet');

insert into PartyItem
values('bridal1','cake2');

insert into PartyItem
values('bridal1','champagne');

insert into PartyItem
values('bridal1','donut');

insert into PartyItem
values('bridal1','minidonut');

insert into PartyItem
values('bridal1','muffin');

insert into PartyItem
values('bridal2','afternoontea');

insert into PartyItem
values('bridal2','balloon10');

insert into PartyItem
values('bridal2','balloonset');

insert into PartyItem
values('bridal2','champagne');

insert into PartyItem
values('bridal2','letteringballoon');

insert into PartyItem
values('bridal2','nacho');

insert into PartyItem
values('bridal2','potato');

insert into PartyItem
values('bridal2','pretzel');

insert into PartyItem
values('bridal2','redwine');

insert into PartyItem
values('bridal3','cake2');

insert into PartyItem
values('bridal3','garland');

insert into PartyItem
values('bridal3','grapefruitjuice');

insert into PartyItem
values('bridal3','letteringballoon');

insert into PartyItem
values('bridal3','macaron');

insert into PartyItem
values('bridal3','wine');

insert into PartyItem
values('bridal4','balloon7');

insert into PartyItem
values('bridal4','balloon10');

insert into PartyItem
values('bridal4','balloonset');

insert into PartyItem
values('bridal4','beer');

insert into PartyItem
values('bridal4','bracelet');

insert into PartyItem
values('bridal4','letteringballoon');

insert into PartyItem
values('bridal4','wine');

insert into PartyItem
values('bridal5','artificialflower');

insert into PartyItem
values('bridal5','cake2');

insert into PartyItem
values('bridal5','chicken');

insert into PartyItem
values('bridal5','fruit1');

insert into PartyItem
values('bridal5','garland');

insert into PartyItem
values('bridal5','pizza');

insert into PartyItem
values('bridal5','potato');

insert into PartyItem
values('bridal5','wine');

insert into PartyItem
values('bridal6','afternoontea');

insert into PartyItem
values('bridal6','balloon7');

insert into PartyItem
values('bridal6','balloonset');

insert into PartyItem
values('bridal6','cake4');

insert into PartyItem
values('bridal6','champagne');

insert into PartyItem
values('bridal6','letteringballoon');

insert into PartyItem
values('bridal6','wine');

insert into PartyItem
values('bridal7','afternoontea');

insert into PartyItem
values('bridal7','balloonset');

insert into PartyItem
values('bridal7','cake4');

insert into PartyItem
values('bridal7','candle');

insert into PartyItem
values('bridal8','balloonset');

insert into PartyItem
values('bridal8','cake2');

insert into PartyItem
values('bridal8','fruit1');

insert into PartyItem
values('bridal8','garland');

insert into PartyItem
values('bridal8','grapefruitjuice');

insert into PartyItem
values('bridal8','macaron');

insert into PartyItem
values('bridal8','sushi2');

insert into PartyItem
values('bridal8','wine');

insert into PartyItem
values('bridal9','balloonset');

insert into PartyItem
values('bridal9','cake1');

insert into PartyItem
values('bridal9','cider');

insert into PartyItem
values('bridal9','fruit5');

insert into PartyItem
values('bridal9','guobaorou');

insert into PartyItem
values('bridal9','letteringballoon');

insert into PartyItem
values('bridal9','orangejuice');

insert into PartyItem
values('bridal9','pretzel');

insert into PartyItem
values('bridal9','salad1');

insert into PartyItem
values('bridal9','sausage');

insert into PartyItem
values('bridal10','afternoontea');

insert into PartyItem
values('bridal10','balloonset');

insert into PartyItem
values('bridal10','cake2');

insert into PartyItem
values('bridal10','garland');

insert into PartyItem
values('bridal10','whitewine');

insert into PartyItem
values('bridal11','balloon7');

insert into PartyItem
values('bridal11','balloon10');

insert into PartyItem
values('bridal11','balloonset');

insert into PartyItem
values('bridal11','cake1');

insert into PartyItem
values('bridal11','california');

insert into PartyItem
values('bridal11','letteringballoon');

insert into PartyItem
values('bridal11','redwine');

insert into PartyItem
values('bridal11','salad4');

insert into PartyItem
values('bridal11','sparklingwine');

insert into PartyItem
values('bridal11','sushi1');

insert into PartyItem
values('bridal11','waffle2');

insert into PartyItem
values('bridal11','whitewine');

insert into PartyItem
values('bridal12','cake4');

insert into PartyItem
values('bridal12','canape');

insert into PartyItem
values('bridal12','fruit4');

insert into PartyItem
values('bridal12','lemonsparkling');

insert into PartyItem
values('bridal12','letteringballoon');

insert into PartyItem
values('bridal12','orangesparkling');

insert into PartyItem
values('bridal12','salad1');

insert into PartyItem
values('bridal13','balloon7');

insert into PartyItem
values('bridal13','balloonset');

insert into PartyItem
values('bridal13','cake2');

insert into PartyItem
values('bridal13','candle');

insert into PartyItem
values('bridal13','fruit1');

insert into PartyItem
values('bridal13','letteringballoon');

insert into PartyItem
values('birth1','balloon11');

insert into PartyItem
values('birth1','conehat');

insert into PartyItem
values('birth1','papercup');

insert into PartyItem
values('birth2','balloon19');

insert into PartyItem
values('birth2','balloonset');

insert into PartyItem
values('birth2','letteringballoon');

insert into PartyItem
values('birth3','balloon5');

insert into PartyItem
values('birth3','balloon8');

insert into PartyItem
values('birth3','balloonset');

insert into PartyItem
values('birth3','letteringballoon');

insert into PartyItem
values('birth4','balloonset');

insert into PartyItem
values('birth4','cake5');

insert into PartyItem
values('birth4','conehat');

insert into PartyItem
values('birth4','glasses');

insert into PartyItem
values('birth4','pollen');

insert into PartyItem
values('birth4','rabbitdoll');

insert into PartyItem
values('birth4','teddybear');

insert into PartyItem
values('birth5','balloonset');

insert into PartyItem
values('birth5','flower');

insert into PartyItem
values('birth5','letteringballoon');

insert into PartyItem
values('birth6','balloon8');

insert into PartyItem
values('birth6','balloon9');

insert into PartyItem
values('birth6','balloon13');

insert into PartyItem
values('birth6','balloon16');

insert into PartyItem
values('birth6','balloonset');

insert into PartyItem
values('birth7','balloon7');

insert into PartyItem
values('birth7','balloon18');

insert into PartyItem
values('birth7','letteringballoon');

insert into PartyItem
values('birth7','vine');

insert into PartyItem
values('birth8','artificialflower');

insert into PartyItem
values('birth8','balloon18');

insert into PartyItem
values('birth8','balloonset');

insert into PartyItem
values('birth8','cake5');

insert into PartyItem
values('birth8','candle');

insert into PartyItem
values('birth8','cup');

insert into PartyItem
values('birth8','japchae');

insert into PartyItem
values('birth8','letteringballoon');

insert into PartyItem
values('birth9','balloon2');

insert into PartyItem
values('birth9','balloonset');

insert into PartyItem
values('birth9','cake5');

insert into PartyItem
values('birth9','doll');

insert into PartyItem
values('birth9','garland');

insert into PartyItem
values('birth9','icecream');

insert into PartyItem
values('birth10','balloonset');

insert into PartyItem
values('birth10','dumpling');

insert into PartyItem
values('birth10','fruit2');

insert into PartyItem
values('birth10','garland');

insert into PartyItem
values('birth10','ricecake');

insert into PartyItem
values('birth10','sweetpotato');

insert into PartyItem
values('birth10','wine');

insert into PartyItem
values('birth11','bulb');

insert into PartyItem
values('birth11','donut');

insert into PartyItem
values('birth11','gimbap');

insert into PartyItem
values('birth11','hamburger');

insert into PartyItem
values('birth11','letteringballoon');

insert into PartyItem
values('birth11','pizza');

insert into PartyItem
values('birth12','balloonset');

insert into PartyItem
values('birth12','beef');

insert into PartyItem
values('birth12','cockle');

insert into PartyItem
values('birth12','fruit3');

insert into PartyItem
values('birth12','garland');

insert into PartyItem
values('xmas1','cake3');

insert into PartyItem
values('xmas1','electricchicken');

insert into PartyItem
values('xmas1','salad2');

insert into PartyItem
values('xmas1','vongole');

insert into PartyItem
values('xmas1','wedge');

insert into PartyItem
values('xmas2','baguette');

insert into PartyItem
values('xmas2','beer');

insert into PartyItem
values('xmas2','bossam');

insert into PartyItem
values('xmas2','bulgogi');

insert into PartyItem
values('xmas2','cake2');

insert into PartyItem
values('xmas2','cookie');

insert into PartyItem
values('xmas2','gambas');

insert into PartyItem
values('xmas2','macaron');

insert into PartyItem
values('xmas2','wine');

insert into PartyItem
values('xmas3','beer');

insert into PartyItem
values('xmas3','clam');

insert into PartyItem
values('xmas3','grilledvege');

insert into PartyItem
values('xmas3','salad4');

insert into PartyItem
values('xmas3','shrimp');

insert into PartyItem
values('xmas3','stake');

insert into PartyItem
values('xmas4','barbecue');

insert into PartyItem
values('xmas4','chicken');

insert into PartyItem
values('xmas4','nacho');

insert into PartyItem
values('xmas4','squid');

insert into PartyItem
values('xmas5','balloon17');

insert into PartyItem
values('xmas5','cake2');

insert into PartyItem
values('xmas5','grapefruitjuice');

insert into PartyItem
values('xmas5','letteringballoon');

insert into PartyItem
values('xmas5','macaron');

insert into PartyItem
values('xmas5','xmastree');

insert into PartyItem
values('xmas6','cake6');

insert into PartyItem
values('xmas6','candle');

insert into PartyItem
values('xmas6','oyster');

insert into PartyItem
values('xmas6','salad1');

insert into PartyItem
values('xmas6','salad3');

insert into PartyItem
values('xmas6','whitewine');

insert into PartyItem
values('xmas6','xmastree');

insert into PartyItem
values('xmas7','cake4');

insert into PartyItem
values('xmas7','whitewine');

insert into PartyItem
values('xmas7','xmastree');

insert into PartyItem
values('xmas8','cookie');

insert into PartyItem
values('xmas8','stake');

insert into PartyItem
values('xmas8','sushi1');

insert into PartyItem
values('xmas8','vongole');

insert into PartyItem
values('xmas8','wine');

insert into PartyItem
values('xmas8','xmastree');

insert into PartyItem
values('xmas9','cake3');

insert into PartyItem
values('xmas9','cake4');

insert into PartyItem
values('xmas9','choco');

insert into PartyItem
values('xmas9','nutella');

insert into PartyItem
values('xmas9','xmastree');

insert into PartyItem
values('xmas10','cake2');

insert into PartyItem
values('xmas10','california');

insert into PartyItem
values('xmas10','champagne');

insert into PartyItem
values('xmas10','fruit2');

insert into PartyItem
values('xmas10','waffle1');

insert into PartyItem
values('xmas10','wine');

insert into PartyItem
values('xmas11','cake2');

insert into PartyItem
values('xmas11','fruit1');

insert into PartyItem
values('xmas11','mood');

insert into PartyItem
values('xmas11','wine');

insert into PartyItem
values('xmas11','xmastree');

insert into PartyItem
values('halloween1','balloon');

insert into PartyItem
values('halloween1','balloon6');

insert into PartyItem
values('halloween1','balloon19');

insert into PartyItem
values('halloween1','letteringballoon');

insert into PartyItem
values('halloween2','balloon4');

insert into PartyItem
values('halloween2','balloon6');

insert into PartyItem
values('halloween2','balloon14');

insert into PartyItem
values('halloween2','balloonset');

insert into PartyItem
values('halloween2','bulb');

insert into PartyItem
values('halloween2','lamp');

insert into PartyItem
values('halloween3','balloon8');

insert into PartyItem
values('halloween3','balloon19');

insert into PartyItem
values('halloween3','balloon21');

insert into PartyItem
values('halloween3','garland');

insert into PartyItem
values('halloween4','balloon14');

insert into PartyItem
values('halloween4','balloon19');

insert into PartyItem
values('halloween4','garland');

insert into PartyItem
values('halloween5','balloonset');

insert into PartyItem
values('halloween5','doll');

insert into PartyItem
values('halloween5','lamp');

insert into PartyItem
values('halloween5','letteringballoon');

insert into PartyItem
values('halloween6','balloon19');

insert into PartyItem
values('halloween6','balloon20');

insert into PartyItem
values('halloween6','cracker');

insert into PartyItem
values('halloween6','garland');

insert into PartyItem
values('halloween6','letteringballoon');

insert into PartyItem
values('halloween6','net');

insert into PartyItem
values('halloween6','pumpkincup');

insert into PartyItem
values('halloween7','balloon3');

insert into PartyItem
values('halloween7','balloonset');

insert into PartyItem
values('halloween7','batsticker');

insert into PartyItem
values('halloween7','garland');

insert into PartyItem
values('halloween8','balloonset');

insert into PartyItem
values('halloween8','batprops');

insert into PartyItem
values('halloween8','fruit1');

insert into PartyItem
values('halloween8','garland');

insert into PartyItem
values('halloween8','pumpkinprops');






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