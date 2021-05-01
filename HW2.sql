/*PLAYER ���̺� �����԰� 200kg �̻��� 4���� �����͸� INSERT �ϴ� SQL���� 4�� �ۼ��϶�*/
INSERT INTO PLAYER
VALUES ('2002010','��û��','K07','','BlueDragon','2002','MF','17',
NULL,NULL,'1',180,250);
INSERT INTO PLAYER
VALUES ('2002011','������','K01','','','2002','MF','7',
NULL,NULL,'1',180,220);
INSERT INTO PLAYER
VALUES ('2002012','����','K02','','','','FW','6',
NULL,NULL,'1',175,230);
INSERT INTO PLAYER
VALUES ('2002013','��ȫ��','K03','','','','GK','4',
NULL,NULL,'1',175,240);

/*���԰� 200kg �̻��� �� 4���� ������, [����2-1]�� �����Ͽ� 4���� NICKNAME�� "TB"�� 
UPDATE �ϴ� SQL���� �ۼ��ϰ� ���� ��, 4���� ����� ���� 3-1�� SELECT ������ ����϶�*/
UPDATE PLAYER
SET NICKNAME = 'TB'
WHERE WEIGHT >= 200;

/*IS NULL�� ROWNUM�� ����Ͽ� 2���� ���� ��ȸ�ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� ����϶�.*/
SELECT PLAYER_ID, PLAYER_NAME, NATION
FROM PLAYER
WHERE NATION IS NULL
AND ROWNUM <= 2;

/* BACK_NO�� ���� ����� �߿��� 
���� �达�� ����鸸 ��ȸ�ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�.*/
SELECT PLAYER_ID, PLAYER_NAME, BACK_NO
FROM PLAYER
WHERE BACK_NO IS NULL
AND PLAYER_NAME LIKE '��%';
/*AND, NOT, IS NULL�� �����ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�*/
SELECT PLAYER_ID, PLAYER_NAME, POSITION, NICKNAME
FROM PLAYER
WHERE POSITION = 'FW'
AND NICKNAME IS NOT NULL
AND NOT PLAYER_NAME LIKE '��%'

/*3�� �̻��� �÷��� IN, LIKE�� �̿��Ͽ� 
�˻��ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� �� ����� ����϶�.*/
SELECT PLAYER_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT
FROM PLAYER
WHERE (POSITION, HEIGHT) IN (('GK',190),('FW',175)) OR WEIGHT LIKE '2%'

/*������ ������ ��ȸ�ϴ� �ѱ� ���ǹ��� SQL���� �ۼ��ϰ� ���� ��, 
�� ����� ����϶�. (��, �ռ� ������(||)�� ��� �����ڸ� ���� 3�� �̻� ����ϼ���.)*/
SELECT PLAYER_NAME || '����, '  || HEIGHT || 'cm, ' || WEIGHT || 'kg '"ü������",  ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2) "BMI ������"
FROM PLAYER
WHERE WEIGHT >= 200

