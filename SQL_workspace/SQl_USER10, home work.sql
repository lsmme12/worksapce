
create table student(
    id varchar(10) primary key,
    name varchar(20) not null,
    department varchar(30) not null,
    address varchar(50) not null
);

insert into student values('20160001','ȫ�浿','��ǻ�Ͱ��а�','����� ��������');
insert into student values('20162233','�̼���','��Ƽ�̵���а�','�λ�� ����');
insert into student values('20161177','�հ�','��Ƽ�̵���а�','������ ��ô��');

commit;

select * from student
where address like '�����%';

select * from student
order by id asc;

select * from student
order by name desc;

select * from student
where name like '��%'
-------------------------------------------------------------------------------

create table member(
    id varchar2(50) primary key,
    name varchar2(50) not null,
    gender char(1) not null,
    joinDate date default sysdate
);  

insert into member values('hkd','ȫ�浿','m','2001-01-01');
insert into member values('lss','�̼���','m','2003-02-01');
insert into member values('hj','Ȳ����','f','2002-11-13');
insert into member values('wg','�հ�','m','2005-12-21');
insert into member values('pms','�ڹ���','m','2006-11-09');

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
-- ��ȣ,�ֹ���ȣ,��ǰ��ȣ,��ǰ����
create table ordersDetail(
    no number primary key,
    ono number not null references orders(ono), --�ֹ���ȣ
    gno number not null references goods(gno),
    ea number not null
);

insert into ordersDetail values(1,1,1,1);
insert into ordersDetail values(2,1,3,1);
insert into ordersDetail values(3,2,2,2);
insert into ordersDetail values(4,3,2,1);

commit;

-- 09-16 ��������
select count(*) as ��üȸ���� from member;

select gender, count(*) as ȸ����
from member
group by gender;

select * from ordersdetail

SELECT g.name AS ��ǰ��, SUM(od.ea) AS �Ǹż���
FROM ordersDetail od
JOIN goods g ON od.gno = g.gno
GROUP BY g.name
ORDER BY SUM(od.ea) DESC;


SELECT m.name   AS ȸ����,    -- ȸ�� �̸�
       g.name   AS ��ǰ��,    -- ��ǰ �̸�
       od.ea    AS �ֹ�����   -- �ֹ� �󼼿� ���� �ֹ� ����
FROM ordersDetail od
JOIN orders o   ON od.ono = o.ono      -- �ֹ��� �� �ֹ� ����
JOIN member m   ON o.id = m.id         -- �ֹ� �� ȸ�� ����
JOIN goods g    ON od.gno = g.gno;     -- �ֹ��� �� ��ǰ ����

commit;
--09.17 ��������
select to_char(o.orderdate,'YYYY') as �⵵ , sum(od.ea) as �ǸŰ���
from orders o , ordersdetail od
where od.ono in(select ono from orders)
and o.ono = od.ono
group by to_char(o.orderdate,'YYYY')
order by �⵵;

select to_char(o.orderdate, 'YYYY') as �⵵,
       g.name as ��ǰ��,
       sum(od.ea) as �ǸŰ���
from orders o
join ordersDetail od on o.ono = od.ono
join goods g on od.gno = g.gno
group by to_char(o.orderdate, 'YYYY'), g.name
order by �⵵, ��ǰ��;

-- ��ǰ(goods) ���̺��� ����(price)�� �������� DECODE �Լ��� ����� 10000 �� '����' 50000 �� '�߰�' 700000 �� '��' �� �����Ͽ� ����Ͻÿ�.
select gno as ��ǰ��ȣ,
       name as ��ǰ��,
       price as ��ǰ����,
       decode(price,10000,'����',50000,'�߰�',700000,'��') as ���ݵ��
from goods;
-- ȸ��(member) ���̺��� ���Կ���(joinDate ����)�� �̾Ƽ�, DECODE �Լ��� 2001�� �� '�ʱ�ȸ��' 2003�� �� '�߰�ȸ��' 2005�� ���� �� '�ű�ȸ��' ���� �����ؼ� ����Ͻÿ�.
select id as ȸ��ID,
       name as ȸ���̸�,
       to_char(joindate,'YYYY') as ���Կ���,
       decode(to_char(joindate,'YYYY'),'2001','�ʱ�ȸ��','2003','�߰�ȸ��','2005','�ű�ȸ��','��Ÿ') as ȸ�����
from member;

-- �ֹ���(ordersDetail) ���̺��� ea(�Ǹż���)�� �������� DECODE�� ����� ����� �����Ͻÿ�. ea = 1 �� '1�� �Ǹ�'ea = 2 �� '2�� �Ǹ�'ea �� 3 �� '�ٷ� �Ǹ�'�� �� �� �� '��Ÿ'
select no as �ֹ��󼼹�ȣ,
       ono as �ֹ���ȣ,
       gno as ��ǰ��ȣ,
       ea as ����,
       decode(ea,1,'1���Ǹ�',2,'2���Ǹ�',3,'�ٷ��Ǹ�','��Ÿ') as �Ǹŵ��
from ordersdetail;

commit;
--------------------------------------------------------------------------------
create table developers(
    id varchar2(10) primary key,  
    name varchar2(30) not null
);
insert into developers values('hkd','ȫ�浿');
insert into developers values('lss','�̼���');
insert into developers values('wg','�հ�');
insert into developers values('sjdw','�������');
insert into developers values('pms','�ڹ���');

create table projects(
    no number primary key,
    project_name varchar2(100) not null,
    finished char(1) not null
);
insert into projects values(1,'�л�����ý���','N');
insert into projects values(2,'�λ�����ý���','Y');

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

-------------------------------------���ʴ�� 1��~10��
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
       count(pm.no) as ����Ƚ��
from developers d
left join project_members pm 
       on d.id = pm.id
group by d.id, d.name
order by d.id;

select no,
       project_name,
       decode(finished, 
              'Y', '����', 
              'N', '������') as ���Ῡ��
from projects;

commit;

-- ������ ��ǰ�Ǹ� ������ ��
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
insert into jego values('0001','������15',100);
insert into jego values('0002','������s23',100);
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
after insert on ipgo -- ipgo���̺��� insert�� �� ȣ���
for each row -- :new, :old ���̺� ��밡��
begin
    update jego set ea=ea+:new.ea -- ipgo���̺� insert�� ea
    where gcode=:new.gcode;  -- ipgo���̺� insert�� gcode
end;


-- tgr_ipgo Ʈ���Ű� �ڵ�����Ǳ� ���� �̺�Ʈ ( �������� )
insert into ipgo values(1,'0001',10,sysdate);

select * from ipgo;
select * from jego;

commit;
