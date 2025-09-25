-- DEPARTMENT ���̺� ����
CREATE TABLE DEPARTMENT (
	DEPTNO		NUMBER	NOT NULL,
	DEPTNAME	CHAR(10),
	FLOOR		NUMBER,
	PRIMARY KEY(DEPTNO)
);



INSERT INTO DEPARTMENT VALUES(1, '����', 8);
INSERT INTO DEPARTMENT VALUES(2, '��ȹ', 10);
INSERT INTO DEPARTMENT VALUES(3, '����', 9);
INSERT INTO DEPARTMENT VALUES(4, '�ѹ�', 7);


-- EMPLOYEE ���̺� ����
CREATE TABLE EMPLOYEE (
	EMPNO	NUMBER	NOT NULL,
	EMPNAME	CHAR(10)	UNIQUE,
	TITLE	CHAR(10)	DEFAULT '���',
	MANAGER	NUMBER,
	SALARY	NUMBER	CHECK (SALARY < 6000000),
	DNO		NUMBER	DEFAULT 1 CHECK (DNO IN (1,2,3,4)) ,
	PRIMARY KEY(EMPNO),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO) ON DELETE CASCADE
);


INSERT INTO EMPLOYEE VALUES(2106, '��â��', '�븮', 1003, 2500000, 2);
INSERT INTO EMPLOYEE VALUES(3426, '�ڿ���', '����', 4377, 3000000, 1);
INSERT INTO EMPLOYEE VALUES(3011, '�̼���', '����', 4377, 4000000, 3);
INSERT INTO EMPLOYEE VALUES(1003, '������', '����', 4377, 3000000, 2);
INSERT INTO EMPLOYEE VALUES(3427, '����ö', '���', 3011, 1500000, 3);
INSERT INTO EMPLOYEE VALUES(1365, '����', '���', 3426, 1500000, 1);
INSERT INTO EMPLOYEE VALUES(4377, '�̼���', '�̻�',  NULL, 5000000, 2);


-- EMP_PLANNING �� ����
-------------------------------------------------------------------------------
-- 09.19 ������ ���ι��� ��� ���� �����ϰ� ���.
CREATE VIEW EMP_PLANNING
AS
SELECT E.EMPNAME, E.TITLE, E.SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DEPTNO AND D.DEPTNAME='��ȹ';

commit;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- dno�� 2�ΰ͸� �˻�
select * from employee
where dno=2;

-- �̸��� '��'�� ���۵Ǵ� �� �˻�
select empno, empname
from employee
where empname like '��%' -- '��'�� ���۵Ǵ°�

-- �̸��� '��'���� ������ �� �˻�
select empno, empname
from employee
where empname like '%��' -- '��'���� �����°�

-- �Խ��� ���񿡼� 'SQL' �� �ִ� �� �˻�
select * from board
where title like '%sql%'; -- '%�˻���%'�� �˻��� �� ��ġ�� ������� �˻�.

create table board(
    bno number primary key,
    title varchar(50) not null,
    content varchar(1000) not null,
    writer varchar(50) not null,
    wdate date not null
);

insert into board values(1, 'sql�� ������?','sql�� rdb���� ���� ����Դϴ� �³���?','ȫ�浿',sysdate);
insert into board values(2, 'sql�� ������?','sql�� ��Ƴ���?','�̼���',sysdate);

select * from board;

commit;

select * from board
where writer like '%��'

-- �Խ��� ���񿡼� 'sql' �� �ִ� �� �˻�
select * from board
where title like '%sql%'


-- �˻������� �������϶�
select *
from department
where deptname ='����' or deptname='��ȹ';

select *
from employee
where dno=1 and salary>2000000;

select *
from employee
where title='����' and dno=1;

select *
from employee
where title='����' and dno<>1;

select *
from employee
where title='����' or dno<>1; -- ���� �̰ų� �μ���ȭ�� 1���� �ƴѻ�� ��� �˻�.

-- ������ �׸��� ��ȸ�ο� ���� ��� ���� �˻��ϱ�
-- �ѱ� '�׸���' �� ���ƿ� ���� and�� �ƴ϶� or�� ���ؾ���.
select *
from department
where deptname = '����' or deptname='��ȹ'


-- �޿��� 300�����̻� 450���������� ��� �˻�
select *
from employee
where salary between 3000000 and 4500000;

select *
from employee
where salary >= 3000000 and salary<=4500000;

-- ����Ʈ�� ����� �˻� ( IN )
select *
from employee
where dno in (1,3);

select *
from employee
where dno=1 or dno=3;

-- alias
select empno, empname, salary, salary*3.1 as salaryup
from employee;

-- is null
select *from employee
where manager is null; -- manager�� null�λ�� ã�� ��. 

-- �����Լ�
select count(*) as ����� from employee; -- ����
select sum(salary) as �ѱ޿��հ� from employee; -- �հ�
select avg(salary) as 


ployee; -- ���
select max(salary) as �ѱ޿��ִ밪 from employee; -- �ִ밪
select min(salary) as �ѱ޿��ּҰ� from employee; -- �ּҰ�

select count(*) as ����� from employee; -- ����
select count(manager) as ����� from employee; -- null ���� �����ϰ������ ()<�ȿ� �Է�.


-- group by�� �����Լ� �Բ� ����ؼ� �׷캰�� ó��

-- �μ��� �޿� ���
select dno, avg(salary) from employee
group by dno;

-- ���޺� �޿� ���
select title, avg(salary) from employee
group by title;

-- having, group by �����Լ�()�� ������� �������� filtering
select dno, avg(salary) from employee
group by dno
having avg(salary) >=2500000;

-- �������� 2�������� �μ�
select dno, count(empno) from employee
group by dno
having count(empno)<=2;
-------------------------------------------------------------------------------
-- union Ȱ�� ����

-- �ƽþ� ������
create table sale_asia(
    car_name varchar(50),
    ea number,
    sdate date
);

-- �ƽþ� �Ǹ� ������
insert into sale_asia values('�Ÿ',10,sysdate);
insert into sale_asia values('��Ÿ��',50,sysdate);
insert into sale_asia values('�׷���',20,'2025-09-15');  --�ߺ�������

commit;

-- ���� ������
create table sale_europe(
    car_name varchar(50),
    ea number,
    sdate date
);

-- ���� �Ǹ� ������
insert into sale_europe values('�ҳ�Ÿ',70,sysdate);
insert into sale_europe values('��Ÿ��',100,sysdate);
insert into sale_europe values('�׷���',20,'2025-09-15');  --�ߺ�������

commit;


-- ������
select * from sale_asia
union  -- �ߺ��� ���� �Ѱ��� �����ؼ� ���
select * from sale_europe

select * from sale_asia
union all  --�ߺ��� ���� ���� �����ؼ� ���
select * from sale_europe


-- ������
select * from sale_asia
intersect -- �ߺ��� �ุ ���
select * from sale_europe;

select * from sale_asia
intersect all -- �ߺ��� �ุ ���� ���
select * from sale_europe;

-- ������
select * from sale_asia
except -- �ߺ��� �ุ ���� ���
select * from sale_europe;

-------------------------------------------------------------------------------
--join: �ΰ��� ���̺��� �Ѱ��� ���̺��� ��ó�� ����ؼ� �˻��� �� ���

-- employee���̺��� dno
select * from employee;

-- 2���μ��� �̸����ϱ�
select * from department
where deptno=1;

-- join�� ����ؼ� ����� �μ� �̸��� �ѹ��� ���ϱ�
select employee.*, department.deptname
from employee, department
where employee.dno=department.deptno;

select employee.empno, employee.empname, department.deptname
from employee, department
where employee.dno=department.deptno;
-------------------------------------------------------------------------------

-- ȸ�� ���̺�
CREATE TABLE MEMBER (
    MEMBER_ID     VARCHAR2(20) PRIMARY KEY,
    NAME          VARCHAR2(100) NOT NULL,
    EMAIL         VARCHAR2(100) UNIQUE NOT NULL,
    PASSWORD      VARCHAR2(100) NOT NULL,
    PHONE         VARCHAR2(20),
    CREATED_AT    DATE DEFAULT SYSDATE
);

-- ��ǰ ���̺�
CREATE TABLE PRODUCT (
    PRODUCT_ID    NUMBER PRIMARY KEY,
    NAME          VARCHAR2(200) NOT NULL,
    DESCRIPTION   VARCHAR2(1000),
    PRICE         NUMBER(10, 2) NOT NULL,
    STOCK         NUMBER DEFAULT 0,
    CREATED_AT    DATE DEFAULT SYSDATE
);

-- ��ٱ��� ���̺�
CREATE TABLE CART (
    CART_ID       NUMBER PRIMARY KEY,
    MEMBER_ID     VARCHAR2(20) NOT NULL,
    PRODUCT_ID    NUMBER NOT NULL,
    QUANTITY      NUMBER DEFAULT 1,
    ADDED_AT      DATE DEFAULT SYSDATE,
    
    CONSTRAINT FK_CART_MEMBER FOREIGN KEY (MEMBER_ID)
        REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE,
        
    CONSTRAINT FK_CART_PRODUCT FOREIGN KEY (PRODUCT_ID)
        REFERENCES PRODUCT(PRODUCT_ID) ON DELETE CASCADE
);

-- ȸ��
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user01', 'ȫ�浿', 'hong@example.com', 'pass1234', '010-1111-1111', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user02', '�迵��', 'kim@example.com', 'pass2345', '010-2222-2222', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user03', '��ö��', 'lee@example.com', 'pass3456', '010-3333-3333', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user04', '�ڹμ�', 'park@example.com', 'pass4567', '010-4444-4444', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user05', '�ּ���', 'choi@example.com', 'pass5678', '010-5555-5555', SYSDATE);

-- ��ǰ
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (101, '���� ���콺', '���� ���� ���콺', 25000, 100, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (102, '���� Ű����', 'û�� Ű����', 55000, 50, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (103, 'HD �����', '24��ġ FHD �����', 120000, 30, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (104, 'USB-C ���', '7-in-1 ��Ƽ��Ʈ ���', 35000, 75, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (105, '��Ʈ�� ���ĵ�', '�˷�̴� ���̽� ���ĵ�', 29000, 80, SYSDATE);

-- ������. ���� 1���� �ϴϾ� ����. �ߺ���������.
CREATE SEQUENCE SEQ_CART_ID START WITH 1 INCREMENT BY 1;

-- īƮ
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user01', 101, 2, SYSDATE);
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user01', 103, 1, SYSDATE);
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user02', 102, 3, SYSDATE);
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user03', 105, 1, SYSDATE);
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user04', 104, 2, SYSDATE);

INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user04', 104, 2, '2025-01-20');
INSERT INTO CART (CART_ID, MEMBER_ID, PRODUCT_ID, QUANTITY, ADDED_AT)
VALUES (SEQ_CART_ID.NEXTVAL, 'user04', 104, 2, '2025-04-10');




-- ����
commit;

select * from member;

select * from product;

select * from cart;

-- ���ο� ���̺� 2�� ���
select cart.cart_id,cart.member_id,product.name,cart.quantity,cart.added_at
from cart,product 
where cart.product_id= product.product_id; --join����.

--���ο� ���̺� 3�� ���
select cart.cart_id,member.member_id, member.name, product.name as product_name, cart.quantity,cart.added_at
from cart, product,member
where cart.product_id= product.product_id
and cart.member_id=member.member_id;

-- table alias ���
select c.cart_id,m.member_id, m.name, p.name as p, c.quantity, c.added_at
from cart c, product p, member m
where c.product_id= p.product_id
and c.member_id=m.member_id;

-- ANSI-SQL�� join����
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at 
from cart c inner join product p on c.product_id= p.product_id 
inner join member m on c.member_id=m.member_id;

-- filtering ������ �߰��� ���ι�
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c, product p, member m
where c.product_id= p.product_id -- ��������
and c.member_id=m.member_id -- ��������
and c.member_id='user01';

select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id -- ��������
inner join member m
on c.member_id=m.member_id -- ��������
where c.member_id='user01';

-- self join �������������� ���� ���. ��) ��ǰī�װ�, �Ŵ��� ���
select e1.empno, e1.empname, e2.empname as manager
from employee e1, employee e2 -- alias�� Ȱ���� ��. �ٸ� �̸����� �ΰ� ���.
where e1.manager=e2.empno;

-- order by asc ��������. desc ��������
select d.deptname, e.empname, e.title, e.salary
from employee e, department d 
where e.dno=d.deptno
order by deptname, salary desc; -- deptname asc, salary desc�� ����.

-------------------------------------------------------------------------------
--09.18 �����.

--outer join�� Ansi SQL�� ���� ����.

--outer join �ܺ����� : ���ʿ��� �����ϴ� �� ���� �˻��� �� ���.
select cart.cart_id,member.member_id, member.name, product.name as product_name, cart.quantity, cart.added_at
from cart, product, member
where cart.product_id= product.product_id(+)
and cart.member_id(+)=member.member_id; --member ���̺��� member_id ��� ��������. right �ƿ� ����.

-- outter join, ansi SQL
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
right outer join member m  -- right outer join. ������ member�� member_id,name�� �� ������ �ϱ� ���ؼ� ���.
on c.member_id=m.member_id;

select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
left outer join member m  -- left outer join. ���� member�� member_id,name�� �� ������ �ϱ� ���ؼ� ���.
on c.member_id=m.member_id;

-- outer join �ǽ��� ���̺�
-- drop table t_member; ���̺��� �����ϴ°�.

create table t_member(
    id varchar(50) primary key,
    name varchar(50) not null
);

insert into t_member values('hkd','ȫ�浿');
insert into t_member values('lss','�̼���');
insert into t_member values('wg','�հ�');

commit;

select * from t_member;

create table t_cart(
    no number primary key,
    id varchar(50) references t_member(id)
);

insert into t_cart values(1,'hkd');
insert into t_cart values(2,'lss');
insert into t_cart values(3,'sjdw');

commit;

select * from t_cart;

-- inner join 
select c.id, m.name
from t_cart c, t_member m
where c.id=m.id;

-- right outer join
select c.id, m.name
from t_cart c, t_member m 
where c.id(+)=m.id;

-- left outer join
select c.id, m.name
from t_cart c, t_member m 
where c.id=m.id(+);

-- full outer join Ansi SQL�� ����. -- �ǹ������� full outer join ���� ���� ����. ����� ���� ���Ѵٰ� ������. '0%'
select c.id, m.name
from t_cart c full outer join t_memver m -- �������̺��� ������ ��� ������ �ϱ�����.
on c,id=m.id;



--------------------------------------------------------------------------------
-- sub query. ���� (�Ʒ���) ������ ���� ����� �� �ٱ���(����) ������ �����.
select empname, title
from employee
where title=(select title from employee where empname='�ڿ���');

-- in�� ����� ��.
select empname
from employee
where dno in (select deptno from department where deptname='����' or deptname='����');

-- ������������ ������ ����ӵ��� �Ϲ������� ����, ������ ����ϴ� ���� ����
select e.empname, d.deptname
from employee e, department d
where e.dno=d.deptno
and (d.deptname='����' or d.deptname='����');


-- query optimizer ���������ϱ�. �����ڰ� �ۼ��� ������ �м��ؼ� ȿ������ ������� ���� 
-- ������ ���������� ����ɼ��� ����.

--------------------------------------------------------------------------------

-- exists ���� �ڵ� 
select empname
from employee e
where exists (
                select *
                from department d
                where e.dno=d.deptno
                and (deptname='����' or deptname='����')
);

-- �����������. �������輭������. join�� ���.
-- �ٱ��� ������ ���̺��� ���྿ ���� ������ ��� 
select empname, dno, salary
from employee e
where salary > (
                select avg(salary)
                from employee e2
                where e2.dno=e.dno -- ���� ���̺�� �ٱ��� ���̺��� ������.
                );
 
-------------------------------------------------------------------------------
-- decode() �Լ� : 3�� �����ڿ� ����� ����, ( ���� )? A : B. ����Ŭ ���� �Լ�

-- decode( �÷���, �񱳰�, true�� ��, false�� ��)

select * from employee

select empno as �����ȣ,empname as �̸�, decode(dno,
                            1,'����',
                            2,'��ȹ',
                            3,'����',
                            '��Ÿ') as �μ���
from employee;

-------------------------------------------------------------------------------



select dno,title, avg(salary)
from employee
group by dno,title
order by dno

-- rollup. group by ���� �� ���� ���� ����
select dno, title,  avg(salary)
from employee
group by rollup(dno, title)
order by dno;

-- cube. rollup ���� �� ���� ���� ����
select dno, title,  avg(salary)
from employee
group by cube(dno, title)
order by dno;

-------------------------------------------------------------------------------
-- ���̺��� select���� �ʰ� ������ ���. �� ��(��) ����ϴ� ���.
select 10+20 from dual; --dual�� from���� �ۼ��ϱ����� ������ ���̺�

select 'hello world' from dual;

select sysdate from dual;

-------------------------------------------------------------------------------
-- to_char(). ���ڿ��� ��ȯ�ϴ� �Լ�, ������ �����ؼ� ��ȯ ����.

-- ��¥
select to_char(sysdate,'YY-MM-DD')from dual;
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

-- �б�
select to_char(sysdate, 'q')from dual;
select dadded_dt, to_char(added_at,'q')from cart;

-- �б⺰ ����
select to_char(added_at,'q'),count(*)
from cart
group by to_char(added_at,'q')
order by to_char(added_at,'q')

-- ��¥ ���� ���� �� �� '2025-09-17'�� ��¥�� ��ȯ�Ǹ� '2025-09-17 00:00:00'����.
select '2025-09-17' from dual;

select to_char(to_date('2025-09-17'), 'YYYY-MM-DD HH24:MI:SS') from dual;

select cart_id,added_at,to_char(added_at, 'YYYY-MM-DD HH24:MI:SS')
from cart;

-- 1�б� : '2025-01-01' ~ '2025-03-31' => 3�� 31���� �Ϸ�ġ�� ������.
-- where added_at >='20205-01-01' and added_at <='2025-03-31' �Ϸ�ġ ����(x)
-- where added_at >='20205-01-01' and added_at <='2025-04-01' ������ �Ϸ�ġ ����(x)

-------------------------------------------------------------------------------
-- insert �� 
insert into department
values(5,'����',null);

commit;

select * from department

insert into department(deptno,deptname,floor)
values(6,'AI',10);

commit;

select * from department

insert into department(deptno)
values(7)

commit;

select * from department

create table high_salary(
    ename varchar(50),
    title varchar(50),
    sal number    
);

-- insert ~ select ��,�������� ���� �ѹ��� ����.
insert into high_salary(ename,title,sal)
select empname,title,salary
from employee
where salary>=3000000;

-- insert�� union�� �̿��ؼ� �������� ���� �ѹ��� ����
insert into high_salary(ename,title,sal)
select 'ȫ�浿','����',400000 from dual
union
select '�̼���','����',500000 from dual
union
select '�հ�','����',7000000 from dual;

commit;

select * from high_salary; 

delete from high_salary
where ename='ȫ�浿'

rollback; -- �Ǽ��� ������� �ѹ� �ٽ� ����Ѵٴ� ��,

select *from employee

update employee set dno=3, salary=salary*1.05
where empno=2106;

commit;

-------------------------------------------------------------------------------
-- CRUD
-- Create - insert
-- Read - select
-- Update - update
-- Delete - delete

-------------------------------------------------------------------------------
-- 09.18 index �׽�Ʈ������ ���̵����� ����
create sequence seq_t_board;
drop table t_board2

create table t_board(
    no number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    wdate date default sysdate --���� ���� �ð��� �⺻������.
);

insert into t_board(no,title,content,writer) values(seq_t_board.nextval,'����Ŭ','����Ŭ�� ��ǥ���� ��� RDB�Դϴ�','ȫ�浿');

insert into t_board(no,title,content,writer)
select seq_t_board.nextval,title,content,writer from t_board

select count(*) from t_board;

commit;


-- primay key�� �����ϸ� , pk�� index �� �ڵ� ������.
select * from t_board
where no=50000; -- index�� ����ؼ� �˻���. ���� �ӵ��� �˻� ����.

--------------------------------------------------------------------------------

-- board 2 ��.

drop sequence seq_t_board2

create sequence seq_t_board2;

create table t_board2(
    no number,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    wdate date default sysdate --���� ���� �ð��� �⺻������.
);

insert into t_board2(no,title,content,writer) values(seq_t_board2.nextval,'����Ŭ','����Ŭ�� ��ǥ���� ��� RDB�Դϴ�','ȫ�浿');

insert into t_board2(no,title,content,writer)
select seq_t_board2.nextval,title,content,writer from t_board2

commit;

select count(*) from t_board2;

-- no�� ����ؼ� index����
create index idx_t_board2 on t_board2(no);



select * from t_board2
where no=1000000;

-- ���� �ε���. �ΰ��̻��� �÷��� ��� ���� index
select* from t_board2
where no=1000000 and  writer='ȫ�浿'; -- �� ������ �����ٸ�, no�� writer�� ��� index�������.

create index idx_t_board2_composit on t_board2(no,writer);

select no, wdate
from t_board2
where no=1000000; -- �������� �����ٸ�, no, wdate�� ��� index���� ���.

create index idx_t_board2_composit2 on t_board2(no,wdate);

commit;

-- 09.19 �����.
-- view
create view v1
as
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
right outer join member m  -- right outer join. ������ member�� member_id,name�� �� ������ �ϱ� ���ؼ� ���.
on c.member_id=m.member_id;

select * from v1;

-- �ý��� īŻ�α�. �ý���(DB,uesr,table���)�� ���� ������ ����
select *from all_catalog;

select *from user_tab_columns
where table_name='MEMBER';

select *from user_views;

commit;
--------------------------------------------------------------------------------
09.22 ���͵�

create table accounts(
    no number primary key,
    name varchar2(50) not null,
    balance number not null
);

insert into accounts values(1,'ȫ�浿',10000);
insert into accounts values(2,'�̼���',10000);

select * from accounts;

commit;

update accounts set balance=balance-1000
where name='ȫ�浿'

update accounts set balance=balance+1000
where name='�̼���'

select * from accounts

rollback; -- ���. rollback�̳� commit�� �ؾ� transaction�� �����.

--------------------------------------------------------------------------------

-- transaction ó���� db�� �δ��� �ִ� �۾�
-- transaction ó���� ª�� �ð��� ���� ���� ����.
-- transaction ���� �����۾��� ���������� �ϴ°ͺ���, �۾��� �и� �Ҽ� �ִٸ�, ���� Ʈ����ǿ��� ª�� ������ �۾��ϴ°� ����.
-- ����Ŭ������ create���� �����ϸ� �ڵ����� commit�ȴ�. (�����ؾ���)

select * from accounts;

update accounts set balance=balance+10000
where name='ȫ�浿'

commit;
--------------------------------------------------------------------------------
create user wg1 identified 1234;

select * from user10.accounts; -- owner.table��. ������ ������ �⺻�� ( �⺻ owner )

-------------------------------------------------------------------------------

set serveroutput on; -- ������ ������ ���� ����. pl/sql���� print ���

declare      -- ���� �ҋ� ���� ��.
    v_name varchar(50); -- ����
begin
    v_name := 'ȫ�浿';
    dbms_output.put_line(v_name); -- ������/������ Ȯ�ο�. ������. �ֿܼ� ���. �������α׷����� ��µ� ���� ���� �� ����. ���̺����°� �ƴ�.
end;

select 'ȫ�浿' as name from dual;  -- ���̺����·� ���.

-------------------------------------------------------------------------------

declare
    v_id member.MEMBER_ID%type; -- member���̺��� id�� ���� Ÿ��
begin
    select MEMBER_ID into v_id --  id���� v_id�� ����. id���� 1������ ����
    from member where name='ȫ�浿';
    dbms_output.put_line(v_id);  -- js�� console.log()�� ����� ����
    -- v_id �������� �̿��� �ڵ尡 �̾���
end;

--------------------------------------------------------------------------------

declare
    -- 1.cursor����
    cursor member_cur
    is
    select member_id from member where name='ȫ�浿';
    
    v_id member.member_id%type;
begin
    -- 2. cursor open
    open member_cur;
    -- 3. fetch cursor. fetch�� Ŀ���� �̿��ؼ� �� �྿ �о���� �۾�.
    loop
        fetch member_cur into v_id;
        exit when member_cur%notfound; -- ���� ������ loop����
        dbms_output.put_line(v_id); -- ������.
        
        -- ���� id�� 'hkd'�̸� �̻������ ����Ʈ�� �� �� �شٸ� �̷� �۾��� �̾ �� �� ����
        
    end loop;
    -- 4. cursor close
    close member_cur;    
end;

-------------------------------------------------------------------------------
create or replace procedure proc1(
    p_name in member.name%type
)
as
 -- 1.cursor����
    cursor member_cur
    is
    select member_id from member where name=p_name;
    
    v_id member.member_id%type;
begin
    -- 2. cursor open
    open member_cur;
    -- 3. fetch cursor. fetch�� Ŀ���� �̿��ؼ� �� �྿ �о���� �۾�.
    loop
        fetch member_cur into v_id;
        exit when member_cur%notfound; -- ���� ������ loop����
        dbms_output.put_line(v_id); -- ������.
        
        -- ���� id�� 'hkd'�̸� �̻������ ����Ʈ�� �� �� �شٸ� �̷� �۾��� �̾ �� �� ����
        
    end loop;
    -- 4. cursor close
    close member_cur;    
end;   

execute proc1('ȫ�浿'); -- ���ν���ȣ��

commit;
---------------------------------------------------------------------------------

-- 09.23 ��� �����
-- inline view or from �� view
-- =>from ���� select�� �ۼ�. select�� ����� ��� ������ ���̺�� �������. ������ ����Ǹ� �����.


select a.empno, a.empname, d.deptname
from (select * from employee where dno=2) a, department d-- ���⼭ a�� inline view ����Ѵ�.
where a.dno=d.deptno;

-- select���� select
select (select round(avg(salary)) from employee) avg_salary, (select max(salary) from employee) max_salary from dual;

-- pivot
-- ���̺� ����
create table sales (
    region varchar2(50),
    sales_person varchar2(50),
    month varchar2(3),
    sales_amount number
);

-- ������ ����
insert into sales (region, sales_person, month, sales_amount) values ('North', 'John', 'Jan', 1000);
insert into sales (region, sales_person, month, sales_amount) values ('North', 'John', 'Feb', 1500);
insert into sales (region, sales_person, month, sales_amount) values ('North', 'Alice', 'mar', 2000);

insert into sales (region, sales_person, month, sales_amount) values ('South', 'Alice', 'Jan', 1200);
insert into sales (region, sales_person, month, sales_amount) values ('South', 'Alice', 'Feb', 1800);
insert into sales (region, sales_person, month, sales_amount) values ('South', 'Alice', 'mar', 3000);

insert into sales (region, sales_person, month, sales_amount) values ('East', 'Bob', 'Jan', 1100);
insert into sales (region, sales_person, month, sales_amount) values ('East', 'Bob', 'Feb', 1600);
insert into sales (region, sales_person, month, sales_amount) values ('East', 'Alice', 'mar', 2500);

commit;

select * from sales;

-- decode�� ����Ͽ� pivot ����
select region,
       sales_person,
       sum(decode(month, 'Jan', sales_amount, 0)) as jan_sales,
       sum(decode(month, 'Feb', sales_amount, 0)) as feb_sales,
       sum(decode(month, 'mar', sales_amount, 0)) as mar_sales
  from sales
group by region, sales_person
order by region, sales_person;


-- pivot �Լ��� pivot ����
select region, 
       sales_person, 
       coalesce(jan, 0) as jan_sales, 
       coalesce(feb, 0) as feb_sales
  from (select region, 
               sales_person, 
               month, 
               sales_amount
        from sales) 
pivot (sum(sales_amount) for month in ('Jan' as jan, 'Feb' as feb))
order by region, sales_person;
---------------------------------------------------------------------------------
-- case��
-- case ������ �÷���. �÷��� ���� when ������ ������ ���� ��ġ�ϴ��� ��
select empno, empname, dno,
    case dno when 1 then '����' 
             when 2 then '��ȹ' 
             else '��Ÿ' 
    end as deptname
from employee;


-- case ������ �÷����� ��������. when ������ ���ǽ�. ������ ����.
select empno, empname, salary,
    case when salary >3000000 then '������'
         when salary>=2000000 then '�߿�����'
         else '�ҿ�����'
    end as salary_level
from employee;

--------------------------------------------------------------------------------
-- create table. pk����. fk����


-- primary key �̸� ���� 
create table stocks(
    no number primary key, -- pk�̸��� �������� ����. ����Ŭ�� �̸� �ڵ�����. ������ �̸� �浹 ���� ����.
    name varchar2(50) not null,
    ea number not null
);

-- primary key �̸� ����.
create table stocks2(
    no number,
    name varchar2(50) not null,
    ea number not null,
    constraint pk_stocks2 primary key (no) -- pk�̸��� pk_stocks2�� ������ �ȴ�. ������ �̸� �浹�� �ɼ��� ����.
);

-- alter table ���� ��� . pk �̸� ����
create table stocks3(
    no number,
    name varchar2(50) not null,
    ea number not null
);
alter table stocks3
add constraint pk_stocks3 primary key (no)

--------------------------------------------------------------------------------
-- fk �� �̸� ���� �����ϱ�.
create table stocks_output(
    output_no number primary key,
    no number references stocks(no), -- fk �̸����� fk ����. ������ �̸� �浹 ���� ����.
    output_ea number not null,
    output_date date default sysdate -- default �� �⺻�� ����.
);

-- fk�� �̸��� �ۼ��ؼ� ����
create table stocks_output2(
    output_no number primary key,
    no number, 
    output_ea number not null,
    output_date date default sysdate,
    constraint fk_stocks_output2 foreign key (no) references stocks(no) -- fk�̸��ۼ��ؼ� ����. �̸��浹 ��� ����.
);

-- alter table������ fk�̸� �ۼ��ؼ� ����
create table stocks_output3(
    output_no number primary key,
    no number,
    output_ea number not null,
    output_date date default sysdate
);
alter table stocks_output3
add constraint fk_stocks_output3  foreign key (no) references stocks(no)

-------------------------------------------------------------------------------
insert into stocks values(1,'������',10);
-- insert into stocks values(1,'������',20); --���� pk�� �ߺ� ����
insert into stocks values(2,'������',20);

select * from stocks;
commit;

insert into stocks_output values(1,1,50,default);
-- insert into stocks_output values(2,3,50,default); -- ���� fk�� �������Ἲ ����.
insert into stocks_output values(2,2,50,default);

select * from stocks_output;
commit;

-- delete from stocks where no=1 -- 1���� stocks_output�� �����ϹǷ� ����Ű ����. ���� �Ұ�.
-- stocks_output���� ��ǰ 1���� ���� �� ��, stocks���� ���� ����.
delete from stocks_output where no=1;
delete from stocks where no=1;

commit;

-- fk������ cascade on delete ����� ����ϸ� ,�ڵ����� �θ�,���� Ű ��� ������.
create table stocks_output4(
    output_no number primary key,
    no number references stocks(no) on delete cascade, -- on delete cascade �θ�Ű�� �ڽ�Ű�� ���� �ڵ� ����.
    output_ea number not null,
    output_date date default sysdate -- default�� �⺻�� ����.
);

insert into stocks values(3,'������',30);

select * from stocks;

commit;

insert into stocks_output4 values(1,3,70,default);

select * from stocks_output4;

commit;

delete from stocks where no=3;

select * from stocks;
select * from stocks_output4;

commit;

