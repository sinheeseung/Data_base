/*EMP ���̺� �����͸� �߰�, ����, �����ϴ� SQL���� �ۼ��ϰ� 
�� �߰��� �������� �����ϰ� �� ����� ����϶�.*/
INSERT INTO EMP
(EMPNO, ENAME, JOB,
MGR, HIREDATE, SAL, COMM,DEPTNO)
VALUES ('1111', 'HONG', 'INTERN',
NULL,'20210506', 500, NULL, 10);

UPDATE EMP
SET SAL = SAL + 60
WHERE DEPTNO = 10;

SAVEPOINT SVPT1;

DELETE
FROM EMP
WHERE ENAME ='HONG';

SELECT *
FROM EMP;
/*[����10-1]���� �ۼ��� SQL���鿡 ������ ���������� ROLLBACK�� �����ϴ� ������ �߰��ϰ� 
�� ����� ����϶�. */
INSERT INTO EMP
(EMPNO, ENAME, JOB,
MGR, HIREDATE, SAL, COMM,DEPTNO)
VALUES ('1111', 'HONG', 'INTERN',
NULL,'20210506', 500, NULL, 10);

UPDATE EMP
SET SAL = SAL + 60
WHERE DEPTNO = 10;

SAVEPOINT SVPT1;

DELETE
FROM EMP
WHERE ENAME ='HONG';

ROLLBACK TO SVPT1;

SELECT *
FROM EMP;

/*[����10-2]���� �ۼ��� SQL���鿡 �������� 
�������� �ʴ� ROLLBACK������ �߰��ϰ� �� ����� ����϶�.*/
INSERT INTO EMP
(EMPNO, ENAME, JOB,
MGR, HIREDATE, SAL, COMM,DEPTNO)
VALUES ('1111', 'HONG', 'INTERN',
NULL,'20210506', 500, NULL, 10);

UPDATE EMP
SET SAL = SAL + 60
WHERE DEPTNO = 10;

SAVEPOINT SVPT1;

DELETE
FROM EMP
WHERE ENAME ='HONG';

ROLLBACK TO SVPT1;

ROLLBACK;

SELECT *
FROM EMP;

/*�ý��� �����ڷ� �����Ͽ� ������ ������ ���� �� ������ ������ �����Ͽ� 
������ ���̺��� �����ϰų� ���� ���̺��� �����͸� ��ȸ�ϴ� SQL���� �ۼ��ϰ� 
�����غ��� �� ����� ����϶�.*/
CONN SYSTEM/9805
CREATE USER C##TEST IDENTIFIED BY TEST1;
CONN C##TEST/TEST1
CREATE TABLE GRADE ( SUBJECT VARCHAR2(10), SCORE NUMBER);
SELECT * FROM GRADE;*/

/*[����10-4]���� ������ �������� �ٸ� ����, ����, ���̺� ���� ������ �ο��϶�. 
�׷� ���� �� ������ �����Ͽ� ������ ���̺��� ������ �� �����͸� �߰��ϰ�
�� �����͸� ��ȸ�ϴ� SQL���� �ۼ��ϰ� �� ���� ����� ����϶�.*/
CONN SYSTEM/9805
CREATE ROLE C##LOGIN_TABLE;
GRANT CREATE USER, CREATE SESSION, CREATE TABLE TO C##LOGIN_TABLE;
GRANT C##LOGIN_TABLE TO C##TEST;
GRANT CONNECT, RESOURCE, DBA TO C##TEST;
CONN C##TEST/TEST1
CREATE TABLE GRADE ( SUBJECT VARCHAR2(10) NOT NULL, SCORE NUMBER);
INSERT INTO GRADE(SUBJECT, SCORE) VALUES ('DATABASE',100);
SELECT * FROM GRADE;


/*USER����*/
CONN SYSTEM/9805
DROP USER C##TEST CASCADE;