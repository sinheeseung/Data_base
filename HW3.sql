/* EMP 테이블에서 HIREDATE를 이용해 20210322를 기준으로 입사 년차를 계산하여라.
그 후 입사년도, 입사 월, 일사일, 입사 년차 순서로 출력하고 입사 년차가 37년 이상인 경우
BONUS로 1000만원을 주어라.  */
SELECT ENAME,
    EXTRACT (YEAR FROM HIREDATE)입사년도,
    EXTRACT (MONTH FROM HIREDATE)입사월,
    EXTRACT (DAY FROM HIREDATE)입사일,
    TRUNC  (MONTHS_BETWEEN('20210322',HIREDATE)/12,0)입사년차,
    CASE WHEN TRUNC(MONTHS_BETWEEN('20210322',HIREDATE)/12,0) >= 37 THEN 1000
    ELSE 0
    END AS BONUS
FROM EMP;

/*K10 팀에 있는 선수 중 2021년을 기준으로 입단 년차가 16년 이상인 선수는 BONUS로 500만원을 주고,
입단 년차가 11년 이상인 선수는 BONUS로 300만원을 주고,
입단 년차가 6년 이상인 선수는 BONUS로 100만원을 주고 그렇지 않은 선수는 BONUS로 0원을 주어라. 
(5년 마다 추가 BONUS가 있으며, 20년 이상인 경우 200만원 추가, 그렇지 않으면 100만원 추가 BONUS이다, 
입단 년도를 알 수 없는 선수는 입단 년도와 입단 년차를 0으로 출력하여라)*/
SELECT PLAYER_NAME, NVL(JOIN_YYYY,'0') JOIN_YYYY,
NVL((2021-JOIN_YYYY),'0') 입단년차,
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

/*K10의 팀에 있는 선수들 중 키가 190 이상이거나 몸무게가 85 이상인 선수는 
‘XXXL’ 사이즈를, 키가 180 이상이거나 몸무게가 75 이상인 선수는 ‘XXL’사이즈를, 
키가 170 이상이거나 몸무게가 65이상인 선수는 ‘XL’사이즈를, 
키가 160 이상이거나 몸무게가 60 이상인 선수는 ‘L’사이즈를,
나머지 선수는 ‘M’사이즈를 유니폼 사이즈로 주어라. 
(단 키와 몸무게가 입력되어 있지 않은 선수는 제외하여라)*/
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


