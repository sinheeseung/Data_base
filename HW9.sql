/*LAYER ���̺��� ��ID ��, ������ �� �������� �հ踦 ���ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
(��, �������� NULL�� �����ʹ� �����ϰ� ��ID ������ �����Ѵ�.)*/
SELECT TEAM_ID ��ID, POSITION ������,
COUNT(*) �����հ�
FROM PLAYER
WHERE POSITION IS NOT NULL
GROUP BY TEAM_ID, POSITION
ORDER BY TEAM_ID;

/*PLAYER ���̺��� ��ü TEAM�� ������ �� ���� �հ�� ���� ����, 
�� ���� �����Ǻ� �����հ�� �� ���� ������ ���ϴ� SQL���� �ۼ��Ͻÿ�.*/
SELECT
CASE GROUPING(TEAM_ID)
WHEN 1 THEN 'All TEAM_ID'
ELSE TEAM_ID END AS ��ID,
CASE GROUPING(POSITION)
WHEN 1 THEN 'All POSITION'
ELSE POSITION END AS ������,
COUNT(*) "�����հ�"
FROM PLAYER
WHERE POSITION IS NOT NULL
GROUP BY CUBE (TEAM_ID, POSITION);

/*PLAYER ���̺��� ��ID, �ҼӼ��� ��, �Ҽ� ���� ���� ���� ������ 
�� ������ ���ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. 
(��, �ϳ��� SQL������ �ۼ��Ǿ�� �ϸ�, 
�� ������ ������ ���� ���ؼ� ������ ������ �ο��ϴ� �Ͱ�
������ ������ �ϳ��� �Ǽ��� ����ϴ� �� �� ���� ����� ��� ����Ͽ� ����Ѵ�.)*/
SELECT TEAM_ID ��_ID, COUNT(*) �ҼӼ�����,
RANK() OVER (ORDER BY COUNT(*)DESC) ����_���1,
DENSE_RANK() OVER (ORDER BY COUNT(*)DESC) ����_���2
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY ����_���1;

/*PLAYER ���̺��� �������� �Ҽ���ID, �����̸�, ������ Ű, �Ҽ��� ������ �� ����� ������ Ű,
�ִܽ� ������ Ű�� ����ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�.*/
SELECT TEAM_ID ��ID, PLAYER_NAME ������, HEIGHT Ű,
MAX(HEIGHT) OVER (PARTITION BY TEAM_ID) AS TEAM_MAX_HEIGHT,
MIN(HEIGHT) OVER(PARTITION BY TEAM_ID) AS TEAM_MIN_HEIGHT
FROM PLAYER;

/*LAYER ���̺��� ���� ������ �Դ��� �������� ��� �����Ը� ����ϴ�
SQL���� �ۼ��ϰ� �� ����� ����϶�. (��, ��� �����Դ� �Ҽ��� ù°�ڸ����� ǥ���Ѵ�.)*/
SELECT PLAYER_ID ����ID, PLAYER_NAME ������, JOIN_YYYY �Դܳ⵵, WEIGHT ������,
ROUND (AVG(WEIGHT) OVER (PARTITION BY JOIN_YYYY),1) AS JOIN_YYYY_AVG_WEIGHT
FROM PLAYER;

/*PLAYER ���̺��� ������ ���� �������� �Դܿ����� ���� ������ �����Ǹ�, 
�����̸�, �Դܿ���, ������ ������ ���� �Դܿ����� ���� ������ ���� ���� �����̸��� 
����ϴ� SQL���� �ۼ��ϰ� �� ����� ����϶�. (��, �Դܿ����� ������ �̸� ������ �����Ѵ�.)*/
SELECT POSITION ������, PLAYER_NAME �����̸�, JOIN_YYYY �Դܳ⵵,
FIRST_VALUE(PLAYER_NAME) OVER
(PARTITION BY POSITION ORDER BY JOIN_YYYY, PLAYER_NAME ASC
ROWS UNBOUNDED PRECEDING) AS POSITION_FASTEST_JOIN,
LAST_VALUE(PLAYER_NAME) OVER
(PARTITION BY POSITION ORDER BY JOIN_YYYY, PLAYER_NAME ASC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
AS POSITION_LASTEST_JOIN
FROM PLAYER
WHERE JOIN_YYYY IS NOT NULL;

/*PLAYER ���̺��� �Դܳ⵵�� ���� ������ �����ϰ� �Դܳ⵵�� �������� 4���� �׷����� �з��Ͽ���.*/
SELECT PLAYER_NAME, JOIN_YYYY,
NTILE(4) OVER (ORDER BY JOIN_YYYY) AS QUAR_TILE
FROM PLAYER
WHERE JOIN_YYYY IS NOT NULL;