
create table student(
    id varchar(10) primary key,
    name varchar(20) not null,
    department varchar(30) not null,
    address varchar(50) not null
);

insert into student values('20160001','홍길동','컴퓨터공학과','서울시 영등포구');
insert into student values('20162233','이순신','멀티미디어학과','부산시 남구');
insert into student values('20161177','왕건','멀티미디어학과','강원도 삼척시');

commit;

select * from student
where address like '서울시%';

select * from student
order by id asc;

select * from student
order by name desc;

select * from student
where name like '이%'
-------------------------------------------------------------------------------

create table member(
    id varchar2(50) primary key,
    name varchar2(50) not null,
    gender char(1) not null,
    joinDate date default sysdate
);  

insert into member values('hkd','홍길동','m','2001-01-01');
insert into member values('lss','이순신','m','2003-02-01');
insert into member values('hj','황진이','f','2002-11-13');
insert into member values('wg','왕건','m','2005-12-21');
insert into member values('pms','박문수','m','2006-11-09');

-- goods
create table goods(
    gno number primary key,
    name varchar(50) not null,
    price number not null
);

insert into goods values(1,'mp3',10000);
insert into goods values(2,'camera',50000);
insert into goods values(3,'pc',700000);


-- orders
create table orders(
    ono number primary key,
    id varchar2(50) not null references member(id),
    orderdate date default sysdate
);

insert into  orders values(1,'hkd','2001-03-27');
insert into orders values(2,'wg','2005-04-17');
insert into orders values(3,'hkd','2006-02-07');


-- ordersDetail
-- 번호,주문번호,상품번호,상품수량
create table ordersDetail(
    no number primary key,
    ono number not null references orders(ono), --주문번호
    gno number not null references goods(gno),
    ea number not null
);

insert into ordersDetail values(1,1,1,1);
insert into ordersDetail values(2,1,3,1);
insert into ordersDetail values(3,2,2,2);
insert into ordersDetail values(4,3,2,1);

commit;

-- 09-16 연습문제
select count(*) as 전체회원수 from member;

select gender, count(*) as 회원수
from member
group by gender;

select * from ordersdetail

SELECT g.name AS 상품명, SUM(od.ea) AS 판매수량
FROM ordersDetail od
JOIN goods g ON od.gno = g.gno
GROUP BY g.name
ORDER BY SUM(od.ea) DESC;


SELECT m.name   AS 회원명,    -- 회원 이름
       g.name   AS 상품명,    -- 상품 이름
       od.ea    AS 주문갯수   -- 주문 상세에 적힌 주문 수량
FROM ordersDetail od
JOIN orders o   ON od.ono = o.ono      -- 주문상세 → 주문 연결
JOIN member m   ON o.id = m.id         -- 주문 → 회원 연결
JOIN goods g    ON od.gno = g.gno;     -- 주문상세 → 상품 연결

commit;
--09.17 연습문제
select to_char(o.orderdate,'YYYY') as 년도 , sum(od.ea) as 판매갯수
from orders o , ordersdetail od
where od.ono in(select ono from orders)
and o.ono = od.ono
group by to_char(o.orderdate,'YYYY')
order by 년도;

select to_char(o.orderdate, 'YYYY') as 년도,
       g.name as 상품명,
       sum(od.ea) as 판매갯수
from orders o
join ordersDetail od on o.ono = od.ono
join goods g on od.gno = g.gno
group by to_char(o.orderdate, 'YYYY'), g.name
order by 년도, 상품명;

-- 상품(goods) 테이블에서 가격(price)을 기준으로 DECODE 함수를 사용해 10000 → '저가' 50000 → '중가' 700000 → '고가' 로 구분하여 출력하시오.
select gno as 상품번호,
       name as 상품명,
       price as 상품가격,
       decode(price,10000,'저가',50000,'중가',700000,'고가') as 가격등급
from goods;
-- 회원(member) 테이블에서 가입연도(joinDate 기준)를 뽑아서, DECODE 함수로 2001년 → '초기회원' 2003년 → '중간회원' 2005년 이후 → '신규회원' 으로 구분해서 출력하시오.
select id as 회원ID,
       name as 회원이름,
       to_char(joindate,'YYYY') as 가입연도,
       decode(to_char(joindate,'YYYY'),'2001','초기회원','2003','중간회원','2005','신규회원','기타') as 회원등급
from member;

-- 주문상세(ordersDetail) 테이블에서 ea(판매수량)를 기준으로 DECODE를 사용해 등급을 구분하시오. ea = 1 → '1개 판매'ea = 2 → '2개 판매'ea ≥ 3 → '다량 판매'그 외 값 → '기타'
select no as 주문상세번호,
       ono as 주문번호,
       gno as 상품번호,
       ea as 수량,
       decode(ea,1,'1개판매',2,'2개판매',3,'다량판매','기타') as 판매등급
from ordersdetail;

commit;
--------------------------------------------------------------------------------
create table developers(
    id varchar2(10) primary key,  
    name varchar2(30) not null
);
insert into developers values('hkd','홍길동');
insert into developers values('lss','이순신');
insert into developers values('wg','왕건');
insert into developers values('sjdw','세종대왕');
insert into developers values('pms','박문수');

create table projects(
    no number primary key,
    project_name varchar2(100) not null,
    finished char(1) not null
);
insert into projects values(1,'학사관리시스템','N');
insert into projects values(2,'인사관리시스템','Y');

create table project_members(
    num number primary key,
    no number not null references projects(no),
    id varchar2(10) not null references developers(id)    
);
insert into project_members values(1,1,'hkd');
insert into project_members values(2,1,'lss');
insert into project_members values(3,1,'wg');
insert into project_members values(4,2,'lss');
insert into project_members values(5,2,'pms');

commit;

select * from developers;
select * from projects;
select * from project_members

-------------------------------------차례대로 1번~10번
select * from developers;

select count(*) from developers;

select no,project_name
from projects
where finished= 'N';

select
from

select p.no, 
       p.project_name, 
       d.id, 
       d.name
from projects p
join project_members pm on p.no = pm.no
join developers d      on pm.id = d.id;

select p.no,
       p.project_name,
       d.id,
       d.name
from projects p,
     project_members pm,
     developers d
where p.no=pm.no
and pm.id=d.id;

select d.id, d.name
from developers d
left join project_members pm
    on d.id=pm.id
where pm.id is null;

select d.id, d.name
from developers d, project_members pm
where d.id = pm.id(+)
  and pm.id is null;

select id, name
from developers
minus
select d.id, d.name
from developers d
inner join project_members pm 
       on d.id = pm.id;

select d.id,
       d.name,
       count(pm.no) as 참여횟수
from developers d
left join project_members pm 
       on d.id = pm.id
group by d.id, d.name
order by d.id;

select no,
       project_name,
       decode(finished, 
              'Y', '종결', 
              'N', '미종결') as 종결여부
from projects;

commit;

-- 연도별 상품판매 갯수의 합
create table statistics_year(
    year char(4) primary key,
    total number not null
);

-- create function 
create or replace function fn_name(p_id varchar2)
return varchar2
is
    v_name member.id%type;
begin
    select name into v_name
    from member
    where id=p_id;
    
    return v_name;
end;

select ono, id, fn_name(id) as name
from orders;

---------------------------------------------------------------------------------
create table jego(
    gcode char(4) primary key,
    gname varchar2(50) not null,
    ea number not null
);
insert into jego values('0001','아이폰15',100);
insert into jego values('0002','갤럭시s23',100);
commit;

create table ipgo(
    ino number primary key,
    gcode char(4) not null,
    ea number not null,
    idate date not null
);
select * from jego;
select * from ipgo;

create or replace trigger tgr_ipgo
after insert on ipgo -- ipgo테이블에서 insert된 후 호출됨
for each row -- :new, :old 테이블 사용가능
begin
    update jego set ea=ea+:new.ea -- ipgo테이블에 insert된 ea
    where gcode=:new.gcode;  -- ipgo테이블에 insert된 gcode
end;


-- tgr_ipgo 트리거가 자동실행되기 위한 이벤트 ( 전제조건 )
insert into ipgo values(1,'0001',10,sysdate);

select * from ipgo;
select * from jego;

commit;
