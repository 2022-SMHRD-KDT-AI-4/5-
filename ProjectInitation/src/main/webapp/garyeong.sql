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
v_wdate date,
v_date date,
v_cont varchar2(1000),

constraint invite_v_id_pk primary key(v_id),
constraint invite_m_id_fk foreign key(m_id) references Member(m_id)
);

--파티분류 테이블
create table PartyTyp(
pt_id varchar2(20),
pt_name varchar2(100) not null,
pt_cont varchar2(1000),

constraint partytyp_pt_id_pk primary key(pt_id)
);

insert into PartyTyp
values('bridal', '브라이덜샤워',null);

insert into PartyTyp
values('xmas', '크리스마스', null);

insert into PartyTyp
values('baby', '베이비샤워', null);

insert into PartyTyp
values('birth', '생일파티', null);

insert into PartyTyp
values('halloween', '할로윈', null);

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

insert into Party
values('bridal1', 'bridal', '브라이덜샤워1', null, 'bridal3.jpg', 0 );

insert into Party
values('bridal2', 'bridal', '브라이덜샤워2', null, 'bridal44.jpg', 0 );

insert into Party
values('bridal3', 'bridal', '브라이덜샤워3', null, 'bridal5.jpg', 0 );

insert into Party
values('bridal4', 'bridal', '브라이덜샤워4', null, 'bridal6.jpg', 0 );

insert into Party
values('bridal5', 'bridal', '브라이덜샤워5', null, 'bridal7.jpg', 0 );

insert into Party
values('bridal6', 'bridal', '브라이덜샤워6', null, 'bridal8.jpg', 0 );

insert into Party
values('bridal7', 'bridal', '브라이덜샤워7', null, 'bridal9.jpg', 0 );

insert into Party
values('bridal8', 'bridal', '브라이덜샤워8', null, 'bridal10.jpg', 0 );

insert into Party
values('bridal9', 'bridal', '브라이덜샤워9', null, 'bridal11.jpg', 0 );

insert into Party
values('bridal10', 'bridal', '브라이덜샤워10', null, 'bridal12.jpg', 0 );

insert into Party
values('bridal11', 'bridal', '브라이덜샤워11', null, 'bridal13.jpg', 0 );

insert into Party
values('bridal12', 'bridal', '브라이덜샤워12', null, 'bridal14.jpg', 0 );

insert into Party
values('bridal13', 'bridal', '브라이덜샤워13', null, 'bridal15.jpg', 0 );

insert into Party
values('xmas1', 'xmas', '크리스마스1', null, 'christmas1.jpg', 0 );

insert into Party
values('xmas2', 'xmas', '크리스마스2', null, 'christmas2.png', 0 );

insert into Party
values('xmas3', 'xmas', '크리스마스3', null, 'christmas4.jpg', 0 );

insert into Party
values('xmas4', 'xmas', '크리스마스4', null, 'christmas5.jpg', 0 );

insert into Party
values('xmas5', 'xmas', '크리스마스5', null, 'christmas6.jpg', 0 );

insert into Party
values('xmas6', 'xmas', '크리스마스6', null, 'christmas7.jpg', 0 );

insert into Party
values('xmas7', 'xmas', '크리스마스7', null, 'christmas8.jpg', 0 );

insert into Party
values('xmas8', 'xmas', '크리스마스8', null, 'christmas9.jpg', 0 );

insert into Party
values('xmas9', 'xmas', '크리스마스9', null, 'christmas10.jpg', 0 );

insert into Party
values('xmas10', 'xmas', '크리스마스10', null, 'christmas11.jpg', 0 );

insert into Party
values('xmas11', 'xmas', '크리스마스11', null, 'christmas12.jpg', 0 );

insert into Party
values('halloween1', 'halloween', '할로윈1', null, 'halloween1.png', 0 );

insert into Party
values('halloween2', 'halloween', '할로윈2', null, 'halloween2.png', 0 );

insert into Party
values('halloween3', 'halloween', '할로윈3', null, 'halloween3.png', 0 );

insert into Party
values('halloween4', 'halloween', '할로윈4', null, 'halloween4.png', 0 );

insert into Party
values('halloween5', 'halloween', '할로윈5', null, 'halloween5.png', 0 );

insert into Party
values('halloween6', 'halloween', '할로윈6', null, 'halloween6.png', 0 );

insert into Party
values('halloween7', 'halloween', '할로윈7', null, 'halloween7.png', 0 );

insert into Party
values('halloween8', 'halloween', '할로윈8', null, 'halloween8.png', 0 );

insert into Party
values('baby1', 'baby', '베이비샤워1', null, 'baby1.png', 0 );

insert into Party
values('baby2', 'baby', '베이비샤워2', null, 'baby2.png', 0 );

insert into Party
values('baby3', 'baby', '베이비샤워3', null, 'baby3.png', 0 );

insert into Party
values('baby4', 'baby', '베이비샤워4', null, 'baby4.png', 0 );

insert into Party
values('baby5', 'baby', '베이비샤워5', null, 'baby5.png', 0 );

insert into Party
values('baby6', 'baby', '베이비샤워6', null, 'baby6.png', 0 );

insert into Party
values('baby7', 'baby', '베이비샤워7', null, 'baby7.png', 0 );

insert into Party
values('baby8', 'baby', '베이비샤워8', null, 'baby8.png', 0 );

insert into Party
values('baby9', 'baby', '베이비샤워9', null, 'baby9.png', 0 );

insert into Party
values('baby10', 'baby', '베이비샤워10', null, 'baby10.png', 0 );

insert into Party
values('birth1', 'birth', '생일파티1', null, 'birthday1.png', 0 );

insert into Party
values('birth2', 'birth', '생일파티2', null, 'birthday2.png', 0 );

insert into Party
values('birth3', 'birth', '생일파티3', null, 'birthday3.png', 0 );

insert into Party
values('birth4', 'birth', '생일파티4', null, 'birthday4.png', 0 );

insert into Party
values('birth5', 'birth', '생일파티5', null, 'birthday5.png', 0 );

insert into Party
values('birth6', 'birth', '생일파티6', null, 'birthday6.png', 0 );

insert into Party
values('birth7', 'birth', '생일파티7', null, 'birthday7.png', 0 );

insert into Party
values('birth8', 'birth', '생일파티8', null, 'birthday8.png', 0 );

insert into Party
values('birth9', 'birth', '생일파티9', null, 'birthday9.png', 0 );

insert into Party
values('birth10', 'birth', '생일파티10', null, 'birthday10.png', 0 );

insert into Party
values('birth11', 'birth', '생일파티11', null, 'birthday11.png', 0 );

insert into Party
values('birth12', 'birth', '생일파티12', null, 'birthday12.png', 0 );


--아이템 분류 테이블
create table ItemTyp(
it_id varchar2(20),
it_name varchar2(100) not null,

constraint itemtyp_it_id_pk primary key(it_id)
);

insert into ItemTyp
values('deco', '데코');

insert into ItemTyp
values('dessert', '디저트');

insert into ItemTyp
values('drink', '음료');

insert into ItemTyp
values('food', '음식');

insert into ItemTyp
values('acc', '악세서리');

--아이템 테이블
create table Item(
i_id varchar2(20),
it_id varchar2(20),
i_name varchar2(100) not null,
i_cont varchar2(1000),

constraint item_i_id_pk primary key(i_id),
constraint item_it_id_fk foreign key(it_id) references ItemTyp(it_id)
);


insert into Item
values('afternoontea','dessert','애프터눈티세트',null);

insert into Item
values('artificialflower','deco','조화',null);

insert into Item
values('baguette','food','바게트',null);

insert into Item
values('balloon','deco','거미줄모양풍선',null);

insert into Item
values('balloon2','deco','꽃모양풍선',null);

insert into Item
values('balloon3','deco','눈알풍선',null);

insert into Item
values('balloon4','deco','마녀그림풍선',null);

insert into Item
values('balloon5','deco','맥주모양풍선',null);

insert into Item
values('balloon6','deco','박쥐모양풍선',null);

insert into Item
values('balloon7','deco','반지모양풍선',null);

insert into Item
values('balloon8','deco','별모양풍선',null);

insert into Item
values('balloon9','deco','사탕풍선',null);

insert into Item
values('balloon10','deco','샴페인풍선',null);

insert into Item
values('balloon11','deco','스마일풍선',null);

insert into Item
values('balloon12','deco','아기인형풍선',null);

insert into Item
values('balloon13','deco','오리풍선',null);

insert into Item
values('balloon14','deco','유령모양풍선',null);

insert into Item
values('balloon15','deco','유모차모양풍선',null);

insert into Item
values('balloon16','deco','음표모양풍선',null);

insert into Item
values('balloon17','deco','지팡이풍선',null);

insert into Item
values('balloon18','deco','하트모양풍선',null);

insert into Item
values('balloon19','deco','호박모양풍선',null);

insert into Item
values('balloon20','deco','모자풍선',null);

insert into Item
values('balloon21','deco','해골모양풍선',null);

insert into Item
values('balloonbox','deco','풍선상자',null);

insert into Item
values('balloonset','deco','풍선세트',null);

insert into Item
values('barbecue','food','바베큐 폭립',null);

insert into Item
values('batprops','deco','박쥐소품',null);

insert into Item
values('batsticker','deco','박쥐스티커',null);

insert into Item
values('beef','food','소고기',null);

insert into Item
values('beer','drink','맥주',null);

insert into Item
values('bossam','food','보쌈',null);

insert into Item
values('bracelet','acc','꽃팔찌',null);

insert into Item
values('bread','food','빵',null);

insert into Item
values('bulb','deco','전구',null);

insert into Item
values('bulgogi','food','불고기',null);

insert into Item
values('cake1','food','딸기케이크',null);

insert into Item
values('cake2','food','생크림케이크',null);

insert into Item
values('cake3','food','초콜릿케이크',null);

insert into Item
values('cake4','food','치즈케이크',null);

insert into Item
values('cake5','food','케이크',null);

insert into Item
values('cake6','food','팬케이크',null);

insert into Item
values('california','food','캘리포니아 롤',null);

insert into Item
values('canape','food','카나페',null);

insert into Item
values('candle','deco','양초',null);

insert into Item
values('champagne','drink','샴페인',null);

insert into Item
values('choco','dessert','초코브라우니',null);

insert into Item
values('cider','drink','사이다',null);

insert into Item
values('clam','food','가리비 양념구이',null);

insert into Item
values('cockle','food','꼬막',null);

insert into Item
values('conehat','deco','고깔모자',null);

insert into Item
values('cookie','dessert','쿠키',null);

insert into Item
values('cracker','dessert','과자',null);

insert into Item
values('cup','deco','컵',null);

insert into Item
values('doll','deco','인형',null);

insert into Item
values('donut','dessert','도넛',null);

insert into Item
values('minidonut','dessert','먼치킨', null);

insert into Item
values('dumpling','food','만두',null);

insert into Item
values('electricchicken','food','전기구이통닭',null);

insert into Item
values('flower','deco','꽃',null);

insert into Item
values('fruit1','dessert','과일',null);

insert into Item
values('fruit2','dessert','딸기',null);

insert into Item
values('fruit3','dessert','망고',null);

insert into Item
values('fruit4','dessert','샤인머스캣',null);

insert into Item
values('fruit5','dessert','애플망고',null);

insert into Item
values('gambas','food','감바스 알 아히요',null);

insert into Item
values('garland','deco','가랜드',null);

insert into Item
values('gimbap','food','김밥',null);

insert into Item
values('glasses','deco','안경',null);

insert into Item
values('grilledvege','food','야채구이',null);

insert into Item
values('guobaorou','food','꿔바로우',null);

insert into Item
values('hamburger','food','햄버거',null);

insert into Item
values('icecream','dessert','아이스크림',null);

insert into Item
values('invitationcard','deco','초대장',null);

insert into Item
values('grapefruitjuice','drink','자몽주스',null);

insert into Item
values('japchae','food','잡채',null);

insert into Item
values('lamp','deco','램프',null);

insert into Item
values('lemonsparkling','drink','레몬 스파클링',null);

insert into Item
values('letteringballoon','deco','레터링풍선',null);

insert into Item
values('lunchbox','food','도시락',null);

insert into Item
values('macaron','dessert','마카롱',null);

insert into Item
values('montshell','dessert','몽쉘',null);

insert into Item
values('mood','deco','무드등',null);

insert into Item
values('muffin','dessert','머핀',null);

insert into Item
values('nabe','food','밀푀유나베',null);

insert into Item
values('nacho','food','나초',null);

insert into Item
values('nutella','dessert','누텔라 잼',null);

insert into Item
values('net','deco','그물',null);

insert into Item
values('orangejuice','drink','오렌지주스',null);

insert into Item
values('orangesparkling','drink','오렌지 스파클링',null);

insert into Item
values('oyster','food','석화찜',null);

insert into Item
values('pancake','food','부침개',null);

insert into Item
values('papercup','deco','종이컵',null);

insert into Item
values('pizza','food','피자',null);

insert into Item
values('pollen','deco','꽃가루',null);

insert into Item
values('potato','food','감자튀김',null);

insert into Item
values('pretzel','dessert','프레첼',null);

insert into Item
values('pumpkincup','deco','호박모양컵',null);

insert into Item
values('pumpkinprops','deco','호박소품',null);

insert into Item
values('rabbitdoll','deco','토끼인형',null);

insert into Item
values('redwine','drink','레드와인',null);

insert into Item
values('ricecake','dessert','떡',null);

insert into Item
values('salad1','food','리코타치즈샐러드',null);

insert into Item
values('salad2','food','닭가슴살샐러드',null);

insert into Item
values('salad3','food','아보카도샐러드',null);

insert into Item
values('salad4','food','샐러드',null);

insert into Item
values('sausage','food','수제소시지',null);

insert into Item
values('shrimp','food','새우구이',null);

insert into Item
values('sparklingwine','drink','스파클링와인',null);

insert into Item
values('squid','food','통오징어구이',null);

insert into Item
values('stake','food','스테이크',null);

insert into Item
values('sushi1','food','연어초밥',null);

insert into Item
values('sushi2','food','초밥',null);

insert into Item
values('sweetpotato','dessert','고구마',null);

insert into Item
values('teddybear','deco','곰돌이인형',null);

insert into Item
values('vine','deco','넝쿨',null);

insert into Item
values('vongole','food','봉골레파스타',null);

insert into Item
values('waffle1','dessert','딸기와플',null);

insert into Item
values('waffle2','dessert','와플',null);

insert into Item
values('wedge','food','웨지감자',null);

insert into Item
values('whitewine','drink','화이트와인',null);

insert into Item
values('wine','drink','와인',null);

insert into Item
values('xmastree','deco','크리스마스트리',null);

insert into Item
values('yusanseul','food','유산슬',null);

insert into Item
values('chicken', 'food', '치킨', null);

--파티별 아이템
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






--초대장별 아이템 추출 및 설문
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

--시퀸스 작성
create sequence inv_num_seq
	start with 1
	increment by 1
	maxvalue 99999999999999999999
	nocycle
	nocache
	
	
	

--입력테스트
insert into Member5 values('test1', 'test1', 'test');
select * from MEMBER5

insert into ItemTyp values('it01', '소주');
insert into ItemTyp values('it02', '양주');

insert into Item values('i01', 'it01', '참이슬', '참이슬임');
insert into Item values('i02', 'it01', '처음처럼', '소주임');
insert into Item values('i03', 'it01', '잎새주', '잎새주임');

insert into PartyTyp values('birth', '생일파티', '생일파티임');
insert into PartyTyp values('xmas', '크리스마스파티', '크리스마스파티임');

insert into Party values('birth1', 'birth', '신나는생파', '신나게 즐기는 생일파티', 'img', 1);
insert into Party values('birth2', 'birth', '즐거운생파', '즐겁게 즐기는 생일파티', 'img', 1);
insert into Party values('xmas1', 'xmas', '산타크리스마스파티', '산타가 쳐들어오는 파티', 'img', 1);
insert into Party values('xmas2', 'xmas', '루돌프 파티', '루돌프 3관 기념', 'img', 1);

insert into PartyItem values('birth1', 'i01');
insert into PartyItem values('birth1', 'i02');
insert into PartyItem values('birth1', 'i03');

insert into PartyItem values('birth2', 'i01');
insert into PartyItem values('birth2', 'i02');
insert into PartyItem values('xmas1', 'i03');
insert into PartyItem values('xmas2', 'i02');



insert into Invite values(0, 'test1','초대장1',sysdate, sysdate,'우리존재화이팅');
insert into Invite values(inv_num_seq.nextval, 'test1','초대장1',sysdate, sysdate,'우리존재화이팅');

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