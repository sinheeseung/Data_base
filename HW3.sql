/* EMP ���̺��� HIREDATE�� �̿��� 20210322�� �������� �Ի� ������ ����Ͽ���.
�� �� �Ի�⵵, �Ի� ��, �ϻ���, �Ի� ���� ������ ����ϰ� �Ի� ������ 37�� �̻��� ���
BONUS�� 1000������ �־��.  */
SELECT ENAME,
    EXTRACT (YEAR FROM HIREDATE)�Ի�⵵,
    EXTRACT (MONTH FROM HIREDATE)�Ի��,
    EXTRACT (DAY FROM HIREDATE)�Ի���,
    TRUNC  (MONTHS_BETWEEN('20210322',HIREDATE)/12,0)�Ի����,
    CASE WHEN TRUNC(MONTHS_BETWEEN('20210322',HIREDATE)/12,0) >= 37 THEN 1000
    ELSE 0
    END AS BONUS
FROM EMP;

/*K10 ���� �ִ� ���� �� 2021���� �������� �Դ� ������ 16�� �̻��� ������ BONUS�� 500������ �ְ�,
�Դ� ������ 11�� �̻��� ������ BONUS�� 300������ �ְ�,
�Դ� ������ 6�� �̻��� ������ BONUS�� 100������ �ְ� �׷��� ���� ������ BONUS�� 0���� �־��. 
(5�� ���� �߰� BONUS�� ������, 20�� �̻��� ��� 200���� �߰�, �׷��� ������ 100���� �߰� BONUS�̴�, 
�Դ� �⵵�� �� �� ���� ������ �Դ� �⵵�� �Դ� ������ 0���� ����Ͽ���)*/
SELECT PLAYER_NAME, NVL(JOIN_YYYY,'0') JOIN_YYYY,
NVL((2021-JOIN_YYYY),'0') �Դܳ���,
CASE WHEN  (2021-JOIN_YYYY) > 15 THEN 
     (CASE WHEN MOD((2021-JOIN_YYYY),5) = 0 THEN
          700
     ELSE 500
     END)
     WHEN  (2021-JOIN_YYYY) > 10 THEN
     (CASE WHEN MOD((2021-JOIN_YYYY),5) = 0 THEN
          400
     ELSE 300
     END)
WHEN  (2021-JOIN_YYYY) > 5 THEN
     (CASE WHEN MOD((2021-JOIN_YYYY),5) = 0 THEN
          200
      ELSE 100
      END)
ELSE 0
END AS BONUS
FROM PLAYER
WHERE TEAM_ID = 'K10';

/*K10�� ���� �ִ� ������ �� Ű�� 190 �̻��̰ų� �����԰� 85 �̻��� ������ 
��XXXL�� �����, Ű�� 180 �̻��̰ų� �����԰� 75 �̻��� ������ ��XXL�������, 
Ű�� 170 �̻��̰ų� �����԰� 65�̻��� ������ ��XL�������, 
Ű�� 160 �̻��̰ų� �����԰� 60 �̻��� ������ ��L�������,
������ ������ ��M������� ������ ������� �־��. 
(�� Ű�� �����԰� �ԷµǾ� ���� ���� ������ �����Ͽ���)*/
SELECT PLAYER_NAME, TEAM_ID, HEIGHT, WEIGHT,
CASE WHEN HEIGHT >= 190 OR WEIGHT >= 85 THEN 'XXXL'
     WHEN HEIGHT >= 180 OR WEIGHT >= 75 THEN 'XXL'
     WHEN HEIGHT >= 170 OR WEIGHT >= 65 THEN 'XL'
     WHEN HEIGHT >= 160 OR WEIGHT >= 60 THEN 'L'
     ELSE 'M'
END AS UNIFORM_SIZE
FROM PLAYER
WHERE TEAM_ID = 'K10'
AND WEIGHT IS NOT NULL
AND HEIGHT IS NOT NULL;


