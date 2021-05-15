rem  DROP TABLES
DROP TABLE EMP;
DROP TABLE DEPT;
rem  create TABLES
CREATE TABLE DEPT
        (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
         DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;
CREATE TABLE EMP
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MGR   NUMBER(4),
	 HIREDATE DATE,
	 SAL   NUMBER(7,2),
	 COMM  NUMBER(7,2),
     EMAIL  VARCHAR2(25),
     MOBILE VARCHAR2(18),
     PERSONAL_HOMEPAGE VARCHAR2(100),
	 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
rem  insert DEPT 4 data
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
rem  insert EMP  14 data
INSERT INTO EMP  VALUES (7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'), 800,NULL,NULL,'010.0101.0101',NULL,20);
INSERT INTO EMP  VALUES (7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300, 'allen@abccorp.com','010.4567.8764',NULL,30);
INSERT INTO EMP  VALUES (7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500, 'ward.com','010.0531.0701',NULL,30);
INSERT INTO EMP  VALUES (7566,'JONES','MANAGER',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,'jones@abccorp.com','010.5423.6473','http://jones.abccorp.com/manager/intro',20);
INSERT INTO EMP  VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,'martine@abccorp.com','010.9276.4911',NULL,30);
INSERT INTO EMP  VALUES (7698,'BLAKE','MANAGER',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,'blake@abccorp','010.1243.9832','http://blake.abccorp.com/manager/#category-data',30);
INSERT INTO EMP  VALUES (7782,'CLARK','MANAGER',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,'clark.com','010.2354.2299',NULL,10);
INSERT INTO EMP  VALUES (7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987','dd-mm-yyyy'),3000,NULL,'scoot@abccorp.com','010.2943.5555',NULL,20);
INSERT INTO EMP  VALUES (7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,'king@abccorp.com','010.8786.9999','http://king.abccorp.com/president/81/11/17.htm#',10);
INSERT INTO EMP  VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,   'turner@abccorp','010.1211.0881',NULL,30);
INSERT INTO EMP  VALUES (7876,'ADAMS','CLERK',    7788,to_date('13-07-1987','dd-mm-yyyy'),1100,NULL,NULL,'010.9991.5532',NULL,20);
INSERT INTO EMP  VALUES (7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'), 950,NULL,NULL,'010.7493.9000',NULL,30);
INSERT INTO EMP  VALUES (7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,'ford@abccorp.com','010.7761.9331',NULL,20);
INSERT INTO EMP  VALUES (7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,NULL,'010.1211.5454',NULL,10);
COMMIT;


/*EMP 테이블에서 이메일 주소가 ‘소문자+숫자@소문자+숫자.소문자’ 패턴인 직원의 직원번호, 직원이름, 직무, 이메일 주소를 출력하는 SQL문을 작성하라. (단, REGEXP_LIKE 함수를 사용하며 POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력한다.)*/
select empno, ename, job, email
from emp
where REGEXP_LIKE (email,  '[[:alnum:][:digit:]]+@[[:alnum:][:digit:]]+\.+[[:alnum:]]');

select empno, ename, job, email
from emp
where REGEXP_LIKE (email, '\w+@+\w+\.+\w');

/*EMP 테이블에서 모든 직원의 직원번호, 직원이름, 기존의 핸드폰 번호, ‘숫자-숫자-숫자’ 패턴으로 변경한 핸드폰 번호를 출력하는 SQL문을 작성하라. (단, REGEXP_REPLACE 함수를 사용하며, POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력한다.)*/
select empno, ename, mobile, regexp_replace(mobile,'([[:digit:]]{3})\.([[:digit:]]{4})\.([[:digit:]]{4})','\1-\2-\3') as phone_number
from emp;

select empno, ename, mobile, regexp_replace(mobile,'(\d{3})+.+(\d{4})+.+(\d{4})','\1-\2-\3') as phone_number
from emp;

/*EMP 테이블에서 개인 홈페이지가 있는 직원들의 직원번호, 직원이름, 기존의 개인 홈페이지 주소, 메인 URL만 분리한 개인 홈페이지 주소 (예시: http://www.naver.com/)를 출력하는 SQL문을 작성하라. (단, REGEXP_SUBSTR 함수를 사용하며 POSIX 연산자와 PERL 정규 표현식 연산자 두 가지 방법을 모두 사용하여 출력하고 개인 홈페이지 주소가 없는 직원은 제외한다.)*/
select empno, ename, personal_homepage,  regexp_substr(personal_homepage, 'http://([[:alnum:]]+\.?){3}/') as homepage_url
from emp
where personal_homepage is not null;

select empno, ename, personal_homepage,  regexp_substr(personal_homepage, 'http://(\w+.){3}/')as homepage_url
from emp
where personal_homepage is not null;
