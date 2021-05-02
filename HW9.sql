/*LAYER 테이블에서 팀ID 별, 포지션 별 선수들의 합계를 구하는 SQL문을 작성하고 그 결과를 출력하라. 
(단, 포지션이 NULL인 데이터는 제외하고 팀ID 순으로 정렬한다.)*/
SELECT TEAM_ID 팀ID, POSITION 포지션,
COUNT(*) 선수합계
FROM PLAYER
WHERE POSITION IS NOT NULL
GROUP BY TEAM_ID, POSITION
ORDER BY TEAM_ID;

/*PLAYER 테이블에서 전체 TEAM의 포지션 별 선수 합계와 선수 총합, 
각 팀별 포지션별 선수합계와 팀 선수 총합을 구하는 SQL문을 작성하시오.*/
SELECT
CASE GROUPING(TEAM_ID)
WHEN 1 THEN 'All TEAM_ID'
ELSE TEAM_ID END AS 팀ID,
CASE GROUPING(POSITION)
WHEN 1 THEN 'All POSITION'
ELSE POSITION END AS 포지션,
COUNT(*) "선수합계"
FROM PLAYER
WHERE POSITION IS NOT NULL
GROUP BY CUBE (TEAM_ID, POSITION);

/*PLAYER 테이블에서 팀ID, 소속선수 수, 소속 선수 수가 많은 순으로 
팀 순위를 구하는 SQL문을 작성하고 그 결과를 출력하라. 
(단, 하나의 SQL문으로 작성되어야 하며, 
팀 순위는 동일한 값에 대해서 동일한 순서를 부여하는 것과
동일한 순위를 하나의 건수로 취급하는 것 두 가지 방법을 모두 사용하여 출력한다.)*/
SELECT TEAM_ID 팀_ID, COUNT(*) 소속선수수,
RANK() OVER (ORDER BY COUNT(*)DESC) 순위_방법1,
DENSE_RANK() OVER (ORDER BY COUNT(*)DESC) 순위_방법2
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY 순위_방법1;

/*PLAYER 테이블에서 선수들의 소속팀ID, 선수이름, 선수의 키, 소속팀 선수들 중 최장신 선수의 키,
최단신 선수의 키를 출력하는 SQL문을 작성하고 그 결과를 출력하라.*/
SELECT TEAM_ID 팀ID, PLAYER_NAME 선수명, HEIGHT 키,
MAX(HEIGHT) OVER (PARTITION BY TEAM_ID) AS TEAM_MAX_HEIGHT,
MIN(HEIGHT) OVER(PARTITION BY TEAM_ID) AS TEAM_MIN_HEIGHT
FROM PLAYER;

/*LAYER 테이블에서 같은 연도에 입단한 선수들의 평균 몸무게를 출력하는
SQL문을 작성하고 그 결과를 출력하라. (단, 평균 몸무게는 소수점 첫째자리까지 표시한다.)*/
SELECT PLAYER_ID 선수ID, PLAYER_NAME 선수명, JOIN_YYYY 입단년도, WEIGHT 몸무게,
ROUND (AVG(WEIGHT) OVER (PARTITION BY JOIN_YYYY),1) AS JOIN_YYYY_AVG_WEIGHT
FROM PLAYER;

/*PLAYER 테이블에서 포지션 별로 선수들의 입단연도가 빠른 순으로 포지션명, 
선수이름, 입단연도, 포지션 내에서 가장 입단연도가 빠른 선수와 가장 늦은 선수이름을 
출력하는 SQL문을 작성하고 그 결과를 출력하라. (단, 입단연도가 같으면 이름 순으로 정렬한다.)*/
SELECT POSITION 포지션, PLAYER_NAME 선수이름, JOIN_YYYY 입단년도,
FIRST_VALUE(PLAYER_NAME) OVER
(PARTITION BY POSITION ORDER BY JOIN_YYYY, PLAYER_NAME ASC
ROWS UNBOUNDED PRECEDING) AS POSITION_FASTEST_JOIN,
LAST_VALUE(PLAYER_NAME) OVER
(PARTITION BY POSITION ORDER BY JOIN_YYYY, PLAYER_NAME ASC
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
AS POSITION_LASTEST_JOIN
FROM PLAYER
WHERE JOIN_YYYY IS NOT NULL;

/*PLAYER 테이블에서 입단년도가 빠른 순으로 정렬하고 입단년도를 기준으로 4개의 그룹으로 분류하여라.*/
SELECT PLAYER_NAME, JOIN_YYYY,
NTILE(4) OVER (ORDER BY JOIN_YYYY) AS QUAR_TILE
FROM PLAYER
WHERE JOIN_YYYY IS NOT NULL;