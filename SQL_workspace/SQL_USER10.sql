-- DEPARTMENT 테이블 생성
CREATE TABLE DEPARTMENT (
	DEPTNO		NUMBER	NOT NULL,
	DEPTNAME	CHAR(10),
	FLOOR		NUMBER,
	PRIMARY KEY(DEPTNO)
);



INSERT INTO DEPARTMENT VALUES(1, '영업', 8);
INSERT INTO DEPARTMENT VALUES(2, '기획', 10);
INSERT INTO DEPARTMENT VALUES(3, '개발', 9);
INSERT INTO DEPARTMENT VALUES(4, '총무', 7);


-- EMPLOYEE 테이블 생성
CREATE TABLE EMPLOYEE (
	EMPNO	NUMBER	NOT NULL,
	EMPNAME	CHAR(10)	UNIQUE,
	TITLE	CHAR(10)	DEFAULT '사원',
	MANAGER	NUMBER,
	SALARY	NUMBER	CHECK (SALARY < 6000000),
	DNO		NUMBER	DEFAULT 1 CHECK (DNO IN (1,2,3,4)) ,
	PRIMARY KEY(EMPNO),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO) ON DELETE CASCADE
);


INSERT INTO EMPLOYEE VALUES(2106, '김창섭', '대리', 1003, 2500000, 2);
INSERT INTO EMPLOYEE VALUES(3426, '박영권', '과장', 4377, 3000000, 1);
INSERT INTO EMPLOYEE VALUES(3011, '이수민', '부장', 4377, 4000000, 3);
INSERT INTO EMPLOYEE VALUES(1003, '조민희', '과장', 4377, 3000000, 2);
INSERT INTO EMPLOYEE VALUES(3427, '최종철', '사원', 3011, 1500000, 3);
INSERT INTO EMPLOYEE VALUES(1365, '김상원', '사원', 3426, 1500000, 1);
INSERT INTO EMPLOYEE VALUES(4377, '이성래', '이사',  NULL, 5000000, 2);


-- EMP_PLANNING 뷰 생성
-------------------------------------------------------------------------------
-- 09.19 복잡한 조인문을 뷰로 만들어서 간편하게 사용.
CREATE VIEW EMP_PLANNING
AS
SELECT E.EMPNAME, E.TITLE, E.SALARY
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DEPTNO AND D.DEPTNAME='기획';

commit;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- dno가 2인것만 검색
select * from employee
where dno=2;

-- 이름이 '이'로 시작되는 것 검색
select empno, empname
from employee
where empname like '이%' -- '이'로 시작되는것

-- 이름이 '원'으로 끝나는 것 검색
select empno, empname
from employee
where empname like '%원' -- '원'으로 끝나는것

-- 게시판 제목에서 'SQL' 이 있는 것 검색
select * from board
where title like '%sql%'; -- '%검색어%'는 검색어 의 위치에 상관없이 검색.

create table board(
    bno number primary key,
    title varchar(50) not null,
    content varchar(1000) not null,
    writer varchar(50) not null,
    wdate date not null
);

insert into board values(1, 'sql이 뭐에요?','sql은 rdb에서 쓰는 언어입니다 맞나요?','홍길동',sysdate);
insert into board values(2, 'sql이 쉬워요?','sql은 어렵나요?','이순신',sysdate);

select * from board;

commit;

select * from board
where writer like '%동'

-- 게시판 제목에서 'sql' 이 있는 것 검색
select * from board
where title like '%sql%'


-- 검색조건이 여러개일때
select *
from department
where deptname ='영업' or deptname='기획';

select *
from employee
where dno=1 and salary>2000000;

select *
from employee
where title='과장' and dno=1;

select *
from employee
where title='과장' and dno<>1;

select *
from employee
where title='과장' or dno<>1; -- 과장 이거나 부서번화가 1번이 아닌사람 모두 검색.

-- 영업부 그리고 기회부에 속한 모든 직원 검색하기
-- 한글 '그리고' 는 문맥에 따라서 and가 아니라 or로 구해야함.
select *
from department
where deptname = '영업' or deptname='기획'


-- 급여가 300만원이상 450만원이하인 사람 검색
select *
from employee
where salary between 3000000 and 4500000;

select *
from employee
where salary >= 3000000 and salary<=4500000;

-- 리스트를 사용한 검색 ( IN )
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
where manager is null; -- manager가 null인사람 찾는 것. 

-- 집단함수
select count(*) as 사원수 from employee; -- 갯수
select sum(salary) as 총급여합계 from employee; -- 합계
select avg(salary) as 


ployee; -- 평균
select max(salary) as 총급여최대값 from employee; -- 최대값
select min(salary) as 총급여최소값 from employee; -- 최소값

select count(*) as 사원수 from employee; -- 갯수
select count(manager) as 사원수 from employee; -- null 값은 제외하고싶을떈 ()<안에 입력.


-- group by와 집계함수 함께 사용해서 그룹별로 처리

-- 부서별 급여 평균
select dno, avg(salary) from employee
group by dno;

-- 직급별 급여 평균
select title, avg(salary) from employee
group by title;

-- having, group by 집계함수()의 결과값을 기준으로 filtering
select dno, avg(salary) from employee
group by dno
having avg(salary) >=2500000;

-- 직원수가 2명이하인 부서
select dno, count(empno) from employee
group by dno
having count(empno)<=2;
-------------------------------------------------------------------------------
-- union 활용 예시

-- 아시아 데이터
create table sale_asia(
    car_name varchar(50),
    ea number,
    sdate date
);

-- 아시아 판매 데이터
insert into sale_asia values('쏘나타',10,sysdate);
insert into sale_asia values('싼타페',50,sysdate);
insert into sale_asia values('그랜저',20,'2025-09-15');  --중복데이터

commit;

-- 유럽 데이터
create table sale_europe(
    car_name varchar(50),
    ea number,
    sdate date
);

-- 유럽 판매 데이터
insert into sale_europe values('소나타',70,sysdate);
insert into sale_europe values('싼타페',100,sysdate);
insert into sale_europe values('그랜저',20,'2025-09-15');  --중복데이터

commit;


-- 합집합
select * from sale_asia
union  -- 중복된 행을 한개만 포함해서 출력
select * from sale_europe

select * from sale_asia
union all  --중복된 행을 전부 포함해서 출력
select * from sale_europe


-- 교집합
select * from sale_asia
intersect -- 중복된 행만 출력
select * from sale_europe;

select * from sale_asia
intersect all -- 중복된 행만 전부 출력
select * from sale_europe;

-- 차집합
select * from sale_asia
except -- 중복된 행만 뺴고 출력
select * from sale_europe;

-------------------------------------------------------------------------------
--join: 두개의 테이블을 한개의 테이블인 것처럼 사용해서 검색할 때 사용

-- employee테이블에서 dno
select * from employee;

-- 2번부서의 이름구하기
select * from department
where deptno=1;

-- join을 사용해서 사원의 부서 이름을 한번에 구하기
select employee.*, department.deptname
from employee, department
where employee.dno=department.deptno;

select employee.empno, employee.empname, department.deptname
from employee, department
where employee.dno=department.deptno;
-------------------------------------------------------------------------------

-- 회원 테이블
CREATE TABLE MEMBER (
    MEMBER_ID     VARCHAR2(20) PRIMARY KEY,
    NAME          VARCHAR2(100) NOT NULL,
    EMAIL         VARCHAR2(100) UNIQUE NOT NULL,
    PASSWORD      VARCHAR2(100) NOT NULL,
    PHONE         VARCHAR2(20),
    CREATED_AT    DATE DEFAULT SYSDATE
);

-- 상품 테이블
CREATE TABLE PRODUCT (
    PRODUCT_ID    NUMBER PRIMARY KEY,
    NAME          VARCHAR2(200) NOT NULL,
    DESCRIPTION   VARCHAR2(1000),
    PRICE         NUMBER(10, 2) NOT NULL,
    STOCK         NUMBER DEFAULT 0,
    CREATED_AT    DATE DEFAULT SYSDATE
);

-- 장바구니 테이블
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

-- 회원
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user01', '홍길동', 'hong@example.com', 'pass1234', '010-1111-1111', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user02', '김영희', 'kim@example.com', 'pass2345', '010-2222-2222', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user03', '이철수', 'lee@example.com', 'pass3456', '010-3333-3333', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user04', '박민수', 'park@example.com', 'pass4567', '010-4444-4444', SYSDATE);
INSERT INTO MEMBER (MEMBER_ID, NAME, EMAIL, PASSWORD, PHONE, CREATED_AT)
VALUES ('user05', '최수정', 'choi@example.com', 'pass5678', '010-5555-5555', SYSDATE);

-- 상품
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (101, '무선 마우스', '고성능 무선 마우스', 25000, 100, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (102, '기계식 키보드', '청축 키보드', 55000, 50, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (103, 'HD 모니터', '24인치 FHD 모니터', 120000, 30, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (104, 'USB-C 허브', '7-in-1 멀티포트 허브', 35000, 75, SYSDATE);
INSERT INTO PRODUCT (PRODUCT_ID, NAME, DESCRIPTION, PRICE, STOCK, CREATED_AT)
VALUES (105, '노트북 스탠드', '알루미늄 접이식 스탠드', 29000, 80, SYSDATE);

-- 시퀀스. 값이 1부터 하니씩 증가. 중복되지않음.
CREATE SEQUENCE SEQ_CART_ID START WITH 1 INCREMENT BY 1;

-- 카트
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




-- 저장
commit;

select * from member;

select * from product;

select * from cart;

-- 조인에 테이블 2개 사용
select cart.cart_id,cart.member_id,product.name,cart.quantity,cart.added_at
from cart,product 
where cart.product_id= product.product_id; --join조건.

--조인에 테이블 3개 사용
select cart.cart_id,member.member_id, member.name, product.name as product_name, cart.quantity,cart.added_at
from cart, product,member
where cart.product_id= product.product_id
and cart.member_id=member.member_id;

-- table alias 사용
select c.cart_id,m.member_id, m.name, p.name as p, c.quantity, c.added_at
from cart c, product p, member m
where c.product_id= p.product_id
and c.member_id=m.member_id;

-- ANSI-SQL로 join구현
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at 
from cart c inner join product p on c.product_id= p.product_id 
inner join member m on c.member_id=m.member_id;

-- filtering 조건이 추가된 조인문
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c, product p, member m
where c.product_id= p.product_id -- 조인조건
and c.member_id=m.member_id -- 조인조건
and c.member_id='user01';

select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id -- 조인조건
inner join member m
on c.member_id=m.member_id -- 조인조건
where c.member_id='user01';

-- self join 계층형구조에서 많이 사용. 예) 상품카테고리, 매니저 등등
select e1.empno, e1.empname, e2.empname as manager
from employee e1, employee e2 -- alias를 활용한 것. 다른 이름으로 두개 사용.
where e1.manager=e2.empno;

-- order by asc 오름차순. desc 내림차순
select d.deptname, e.empname, e.title, e.salary
from employee e, department d 
where e.dno=d.deptno
order by deptname, salary desc; -- deptname asc, salary desc와 같음.

-------------------------------------------------------------------------------
--09.18 배운내용들.

--outer join은 Ansi SQL로 구현 권장.

--outer join 외부조인 : 한쪽에만 존재하는 것 까지 검색할 떄 사용.
select cart.cart_id,member.member_id, member.name, product.name as product_name, cart.quantity, cart.added_at
from cart, product, member
where cart.product_id= product.product_id(+)
and cart.member_id(+)=member.member_id; --member 테이블의 member_id 모두 나오도록. right 아웃 조인.

-- outter join, ansi SQL
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
right outer join member m  -- right outer join. 오른쪽 member의 member_id,name이 다 나오게 하기 위해서 사용.
on c.member_id=m.member_id;

select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
left outer join member m  -- left outer join. 왼쪽 member의 member_id,name이 다 나오게 하기 위해서 사용.
on c.member_id=m.member_id;

-- outer join 실습용 테이블
-- drop table t_member; 테이블을 삭제하는것.

create table t_member(
    id varchar(50) primary key,
    name varchar(50) not null
);

insert into t_member values('hkd','홍길동');
insert into t_member values('lss','이순신');
insert into t_member values('wg','왕건');

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

-- full outer join Ansi SQL만 지원. -- 실무적으로 full outer join 사용빈도 거의 없음. 사용을 거의 안한다고 봐야함. '0%'
select c.id, m.name
from t_cart c full outer join t_memver m -- 양쪽테이블의 데이터 모두 나오게 하기위해.
on c,id=m.id;



--------------------------------------------------------------------------------
-- sub query. 안쪽 (아래쪽) 쿼리가 먼저 실행된 후 바깥쪽(위쪽) 쿼리가 실행됨.
select empname, title
from employee
where title=(select title from employee where empname='박영권');

-- in을 사용한 것.
select empname
from employee
where dno in (select deptno from department where deptname='영업' or deptname='개발');

-- 서브쿼리보다 조인이 실행속도가 일반적으로 빠라서, 조인을 사용하는 것을 권장
select e.empname, d.deptname
from employee e, department d
where e.dno=d.deptno
and (d.deptname='영업' or d.deptname='개발');


-- query optimizer 쿼리최적하기. 개발자가 작성한 쿼리를 분석해서 효과적인 방법으로 실행 
-- 쿼리가 내부적으로 변경될수도 있음.

--------------------------------------------------------------------------------

-- exists 질의 코드 
select empname
from employee e
where exists (
                select *
                from department d
                where e.dno=d.deptno
                and (deptname='영업' or deptname='개발')
);

-- 상관중접질의. 연관관계서브쿼리. join과 비슷.
-- 바깥쪽 쿼리의 테이블을 한행씩 안쪽 쿼리에 사용 
select empname, dno, salary
from employee e
where salary > (
                select avg(salary)
                from employee e2
                where e2.dno=e.dno -- 안쪽 테이블과 바깥쪽 테이블이 연관됨.
                );
 
-------------------------------------------------------------------------------
-- decode() 함수 : 3항 연산자와 비슷한 역할, ( 조건 )? A : B. 오라클 전용 함수

-- decode( 컬러명, 비교값, true일 떄, false일 떄)

select * from employee

select empno as 사원번호,empname as 이름, decode(dno,
                            1,'영업',
                            2,'기획',
                            3,'개발',
                            '기타') as 부서명
from employee;

-------------------------------------------------------------------------------



select dno,title, avg(salary)
from employee
group by dno,title
order by dno

-- rollup. group by 보다 더 많은 정보 제공
select dno, title,  avg(salary)
from employee
group by rollup(dno, title)
order by dno;

-- cube. rollup 보다 더 많은 정보 제공
select dno, title,  avg(salary)
from employee
group by cube(dno, title)
order by dno;

-------------------------------------------------------------------------------
-- 테이블에서 select하지 않고 연산한 결과. 값 을(를) 출력하는 경우.
select 10+20 from dual; --dual은 from절을 작성하기위한 가상의 테이블

select 'hello world' from dual;

select sysdate from dual;

-------------------------------------------------------------------------------
-- to_char(). 문자열로 변환하는 함수, 형식을 지정해서 변환 가능.

-- 날짜
select to_char(sysdate,'YY-MM-DD')from dual;
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

-- 분기
select to_char(sysdate, 'q')from dual;
select dadded_dt, to_char(added_at,'q')from cart;

-- 분기별 집계
select to_char(added_at,'q'),count(*)
from cart
group by to_char(added_at,'q')
order by to_char(added_at,'q')

-- 날짜 사용시 주의 할 점 '2025-09-17'는 날짜로 변환되면 '2025-09-17 00:00:00'가됨.
select '2025-09-17' from dual;

select to_char(to_date('2025-09-17'), 'YYYY-MM-DD HH24:MI:SS') from dual;

select cart_id,added_at,to_char(added_at, 'YYYY-MM-DD HH24:MI:SS')
from cart;

-- 1분기 : '2025-01-01' ~ '2025-03-31' => 3월 31일일 하루치가 누락됨.
-- where added_at >='20205-01-01' and added_at <='2025-03-31' 하루치 누락(x)
-- where added_at >='20205-01-01' and added_at <='2025-04-01' 마지막 하루치 누락(x)

-------------------------------------------------------------------------------
-- insert 문 
insert into department
values(5,'연구',null);

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

-- insert ~ select 문,여러개의 행을 한번에 삽입.
insert into high_salary(ename,title,sal)
select empname,title,salary
from employee
where salary>=3000000;

-- insert와 union을 이용해서 여러개의 행을 한번에 삽입
insert into high_salary(ename,title,sal)
select '홍길동','과장',400000 from dual
union
select '이순신','과장',500000 from dual
union
select '왕건','과장',7000000 from dual;

commit;

select * from high_salary; 

delete from high_salary
where ename='홍길동'

rollback; -- 실수로 지운것을 롤백 다시 취소한다는 것,

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
-- 09.18 index 테스트를위한 더미데이터 생성
create sequence seq_t_board;
drop table t_board2

create table t_board(
    no number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    wdate date default sysdate --서버 현재 시간을 기본값으로.
);

insert into t_board(no,title,content,writer) values(seq_t_board.nextval,'오라클','오라클은 대표적인 상용 RDB입니다','홍길동');

insert into t_board(no,title,content,writer)
select seq_t_board.nextval,title,content,writer from t_board

select count(*) from t_board;

commit;


-- primay key를 생성하면 , pk로 index 가 자동 생성됨.
select * from t_board
where no=50000; -- index를 사용해서 검색됨. 빠른 속도로 검색 가능.

--------------------------------------------------------------------------------

-- board 2 번.

drop sequence seq_t_board2

create sequence seq_t_board2;

create table t_board2(
    no number,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    wdate date default sysdate --서버 현재 시간을 기본값으로.
);

insert into t_board2(no,title,content,writer) values(seq_t_board2.nextval,'오라클','오라클은 대표적인 상용 RDB입니다','홍길동');

insert into t_board2(no,title,content,writer)
select seq_t_board2.nextval,title,content,writer from t_board2

commit;

select count(*) from t_board2;

-- no를 사용해서 index생성
create index idx_t_board2 on t_board2(no);



select * from t_board2
where no=1000000;

-- 복합 인덱스. 두개이상의 컬럼을 묶어서 만든 index
select* from t_board2
where no=1000000 and  writer='홍길동'; -- 이 쿼리가 느리다면, no와 writer를 묶어서 index생성고려.

create index idx_t_board2_composit on t_board2(no,writer);

select no, wdate
from t_board2
where no=1000000; -- 이쿼리가 느리다면, no, wdate를 묶어서 index생성 고려.

create index idx_t_board2_composit2 on t_board2(no,wdate);

commit;

-- 09.19 배운내용들.
-- view
create view v1
as
select c.cart_id,m.member_id, m.name, p.name as product_name, c.quantity, c.added_at
from cart c inner join product p
on c.product_id= p.product_id
right outer join member m  -- right outer join. 오른쪽 member의 member_id,name이 다 나오게 하기 위해서 사용.
on c.member_id=m.member_id;

select * from v1;

-- 시스템 카탈로그. 시스템(DB,uesr,table등등)에 관한 정보를 제공
select *from all_catalog;

select *from user_tab_columns
where table_name='MEMBER';

select *from user_views;

commit;
--------------------------------------------------------------------------------
09.22 배운것들

create table accounts(
    no number primary key,
    name varchar2(50) not null,
    balance number not null
);

insert into accounts values(1,'홍길동',10000);
insert into accounts values(2,'이순신',10000);

select * from accounts;

commit;

update accounts set balance=balance-1000
where name='홍길동'

update accounts set balance=balance+1000
where name='이순신'

select * from accounts

rollback; -- 취소. rollback이나 commit을 해야 transaction이 종료됨.

--------------------------------------------------------------------------------

-- transaction 처리는 db에 부담을 주는 작업
-- transaction 처리는 짧은 시간에 끝날 수록 좋다.
-- transaction 에서 여러작업을 연속적으로 하는것보다, 작업을 분리 할수 있다면, 여러 트랜잭션에서 짧게 여러번 작업하는게 좋다.
-- 오라클에서는 create문을 실행하면 자동으로 commit된다. (주의해야함)

select * from accounts;

update accounts set balance=balance+10000
where name='홍길동'

commit;
--------------------------------------------------------------------------------
create user wg1 identified 1234;

select * from user10.accounts; -- owner.table명. 접속한 계정이 기본값 ( 기본 owner )

-------------------------------------------------------------------------------

set serveroutput on; -- 접속할 때마다 먼저 실행. pl/sql에서 print 허용

declare      -- 선언 할떄 쓰는 것.
    v_name varchar(50); -- 변수
begin
    v_name := '홍길동';
    dbms_output.put_line(v_name); -- 개발자/관리자 확인용. 디버깅용. 콘솔에 출력. 응용프로그램에서 출력된 값을 받을 수 없음. 테이블형태가 아님.
end;

select '홍길동' as name from dual;  -- 테이블형태로 출력.

-------------------------------------------------------------------------------

declare
    v_id member.MEMBER_ID%type; -- member테이블의 id와 같은 타입
begin
    select MEMBER_ID into v_id --  id값을 v_id에 저장. id값이 1개여야 가능
    from member where name='홍길동';
    dbms_output.put_line(v_id);  -- js의 console.log()와 비슷한 역할
    -- v_id 변수값을 이용한 코드가 이어짐
end;

--------------------------------------------------------------------------------

declare
    -- 1.cursor정의
    cursor member_cur
    is
    select member_id from member where name='홍길동';
    
    v_id member.member_id%type;
begin
    -- 2. cursor open
    open member_cur;
    -- 3. fetch cursor. fetch는 커서를 이용해서 한 행씩 읽어오는 작업.
    loop
        fetch member_cur into v_id;
        exit when member_cur%notfound; -- 값이 없으면 loop중지
        dbms_output.put_line(v_id); -- 디버깅용.
        
        -- 만약 id가 'hkd'이면 이사람에게 포인트를 더 해 준다면 이런 작업을 이어서 할 수 있음
        
    end loop;
    -- 4. cursor close
    close member_cur;    
end;

-------------------------------------------------------------------------------
create or replace procedure proc1(
    p_name in member.name%type
)
as
 -- 1.cursor정의
    cursor member_cur
    is
    select member_id from member where name=p_name;
    
    v_id member.member_id%type;
begin
    -- 2. cursor open
    open member_cur;
    -- 3. fetch cursor. fetch는 커서를 이용해서 한 행씩 읽어오는 작업.
    loop
        fetch member_cur into v_id;
        exit when member_cur%notfound; -- 값이 없으면 loop중지
        dbms_output.put_line(v_id); -- 디버깅용.
        
        -- 만약 id가 'hkd'이면 이사람에게 포인트를 더 해 준다면 이런 작업을 이어서 할 수 있음
        
    end loop;
    -- 4. cursor close
    close member_cur;    
end;   

execute proc1('홍길동'); -- 프로시져호출

commit;
---------------------------------------------------------------------------------

-- 09.23 배운 내용들
-- inline view or from 절 view
-- =>from 절에 select를 작성. select한 결과가 잠시 가상의 테이블로 만들어짐. 쿼리가 종료되면 사라짐.


select a.empno, a.empname, d.deptname
from (select * from employee where dno=2) a, department d-- 여기서 a를 inline view 라고한다.
where a.dno=d.deptno;

-- select절에 select
select (select round(avg(salary)) from employee) avg_salary, (select max(salary) from employee) max_salary from dual;

-- pivot
-- 테이블 생성
create table sales (
    region varchar2(50),
    sales_person varchar2(50),
    month varchar2(3),
    sales_amount number
);

-- 데이터 삽입
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

-- decode를 사용하여 pivot 구현
select region,
       sales_person,
       sum(decode(month, 'Jan', sales_amount, 0)) as jan_sales,
       sum(decode(month, 'Feb', sales_amount, 0)) as feb_sales,
       sum(decode(month, 'mar', sales_amount, 0)) as mar_sales
  from sales
group by region, sales_person
order by region, sales_person;


-- pivot 함수로 pivot 구현
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
-- case문
-- case 다음에 컬럼명. 컬럼의 값이 when 다음에 나오는 값과 일치하는지 비교
select empno, empname, dno,
    case dno when 1 then '영업' 
             when 2 then '기획' 
             else '기타' 
    end as deptname
from employee;


-- case 다음에 컬럼명이 오지않음. when 다음에 조건식. 범위비교 가능.
select empno, empname, salary,
    case when salary >3000000 then '고연봉자'
         when salary>=2000000 then '중연봉자'
         else '소연봉자'
    end as salary_level
from employee;

--------------------------------------------------------------------------------
-- create table. pk생성. fk생성


-- primary key 이름 없이 
create table stocks(
    no number primary key, -- pk이름을 지정하지 않음. 오라클이 이름 자동생성. 배포시 이름 충돌 염려 없음.
    name varchar2(50) not null,
    ea number not null
);

-- primary key 이름 지정.
create table stocks2(
    no number,
    name varchar2(50) not null,
    ea number not null,
    constraint pk_stocks2 primary key (no) -- pk이름이 pk_stocks2로 생성이 된다. 배포시 이름 충돌이 될수도 있음.
);

-- alter table 문을 사용 . pk 이름 지정
create table stocks3(
    no number,
    name varchar2(50) not null,
    ea number not null
);
alter table stocks3
add constraint pk_stocks3 primary key (no)

--------------------------------------------------------------------------------
-- fk 를 이름 없이 생성하기.
create table stocks_output(
    output_no number primary key,
    no number references stocks(no), -- fk 이름없이 fk 생성. 배포시 이름 충돌 염려 없음.
    output_ea number not null,
    output_date date default sysdate -- default 는 기본값 지정.
);

-- fk를 이름을 작성해서 생성
create table stocks_output2(
    output_no number primary key,
    no number, 
    output_ea number not null,
    output_date date default sysdate,
    constraint fk_stocks_output2 foreign key (no) references stocks(no) -- fk이름작성해서 생성. 이름충돌 우려 있음.
);

-- alter table문으로 fk이름 작성해서 생성
create table stocks_output3(
    output_no number primary key,
    no number,
    output_ea number not null,
    output_date date default sysdate
);
alter table stocks_output3
add constraint fk_stocks_output3  foreign key (no) references stocks(no)

-------------------------------------------------------------------------------
insert into stocks values(1,'아이폰',10);
-- insert into stocks values(1,'갤럭시',20); --에러 pk가 중복 방지
insert into stocks values(2,'갤럭시',20);

select * from stocks;
commit;

insert into stocks_output values(1,1,50,default);
-- insert into stocks_output values(2,3,50,default); -- 에러 fk가 참조무결성 유지.
insert into stocks_output values(2,2,50,default);

select * from stocks_output;
commit;

-- delete from stocks where no=1 -- 1번이 stocks_output에 존재하므로 참조키 에러. 삭제 불가.
-- stocks_output에서 상품 1번을 삭제 한 후, stocks에서 삭제 가능.
delete from stocks_output where no=1;
delete from stocks where no=1;

commit;

-- fk생성시 cascade on delete 욥션을 사용하면 ,자동으로 부모,참조 키 모두 삭제됨.
create table stocks_output4(
    output_no number primary key,
    no number references stocks(no) on delete cascade, -- on delete cascade 부모키와 자식키를 같이 자동 삭제.
    output_ea number not null,
    output_date date default sysdate -- default는 기본값 지정.
);

insert into stocks values(3,'블랙베리',30);

select * from stocks;

commit;

insert into stocks_output4 values(1,3,70,default);

select * from stocks_output4;

commit;

delete from stocks where no=3;

select * from stocks;
select * from stocks_output4;

commit;

