/*PLAYER 테이블에 몸무게가 200kg 이상인 4명의 데이터를 INSERT 하는 SQL문을 4개 작성하라*/
INSERT INTO PLAYER
VALUES ('2002010','이청용','K07','','BlueDragon','2002','MF','17',
NULL,NULL,'1',180,250);
INSERT INTO PLAYER
VALUES ('2002011','박지성','K01','','','2002','MF','7',
NULL,NULL,'1',180,220);
INSERT INTO PLAYER
VALUES ('2002012','고도현','K02','','','','FW','6',
NULL,NULL,'1',175,230);
INSERT INTO PLAYER
VALUES ('2002013','서홍석','K03','','','','GK','4',
NULL,NULL,'1',175,240);

/*무게가 200kg 이상인 열 4개를 가지고, [예제2-1]을 변형하여 4명의 NICKNAME을 "TB"로 
UPDATE 하는 SQL문을 작성하고 실행 후, 4명의 결과를 과제 3-1의 SELECT 문으로 출력하라*/
UPDATE PLAYER
SET NICKNAME = 'TB'
WHERE WEIGHT >= 200;

/*IS NULL과 ROWNUM을 사용하여 2개의 행을 조회하는 한글 질의문과 SQL문을 작성하고 출력하라.*/
SELECT PLAYER_ID, PLAYER_NAME, NATION
FROM PLAYER
WHERE NATION IS NULL
AND ROWNUM <= 2;

/* BACK_NO가 없는 사람들 중에서 
성이 김씨인 사람들만 조회하는 SQL문을 작성하고 그 결과를 출력하라.*/
SELECT PLAYER_ID, PLAYER_NAME, BACK_NO
FROM PLAYER
WHERE BACK_NO IS NULL
AND PLAYER_NAME LIKE '김%';
/*AND, NOT, IS NULL을 포함하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라*/
SELECT PLAYER_ID, PLAYER_NAME, POSITION, NICKNAME
FROM PLAYER
WHERE POSITION = 'FW'
AND NICKNAME IS NOT NULL
AND NOT PLAYER_NAME LIKE '김%'

/*3개 이상의 컬럼을 IN, LIKE를 이용하여 
검색하는 한글 질의문과 SQL문을 작성하고 그 결과를 출력하라.*/
SELECT PLAYER_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT
FROM PLAYER
WHERE (POSITION, HEIGHT) IN (('GK',190),('FW',175)) OR WEIGHT LIKE '2%'

/*선수의 정보를 조회하는 한글 질의문과 SQL문을 작성하고 실행 후, 
그 결과를 출력하라. (단, 합성 연산자(||)와 산술 연산자를 각각 3개 이상 사용하세요.)*/
SELECT PLAYER_NAME || '선수, '  || HEIGHT || 'cm, ' || WEIGHT || 'kg '"체격정보",  ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)),2) "BMI 비만지수"
FROM PLAYER
WHERE WEIGHT >= 200

