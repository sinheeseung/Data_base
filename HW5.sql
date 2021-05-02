/*EMP ���̺� 1���� ���ο� Į���� �߰��ϴ� SQL���� �ۼ��ϰ� ���� ��, ���̺��� ������ ����϶�.*/
ALTER TABLE EMP
ADD (ADDRESS CHAR(80));

/*EMP ���̺� �����ϴ� Į�� 2������ ���� MODIFY�� �����ϴ� SQL���� �ۼ��ϰ� ���� ��, ���̺��� ������ ����϶�. 
(��, �� Į���� ���ؼ� �ٸ� ������ ���� MODIFY�� �ؾ� �Ѵ�.)*/
ALTER TABLE EMP
MODIFY (ADDRESS VARCHAR2(80),
        JOB NOT NULL);
        
/*EMP ���̺��� Ư�� Į�� 1���� �̸��� �ٲٴ� SQL���� �ۼ��ϰ� ���� ��, ���̺��� ������ ����϶�.*/
ALTER TABLE EMP
RENAME COLUMN ENAME TO NAME;

/*�� EMP ���̺��� Į�� 1���� ���� ���ο� ���������� �����ϴ� SQL���� �ۼ��ϰ� 
���� ��, �̸� Ȯ���� �� �ֵ��� ����϶�.*/
ALTER TABLE EMP
ADD UNIQUE(NAME);
