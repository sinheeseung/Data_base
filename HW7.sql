SELECT E.EMPNO AS 사원번호,E.ENAME AS 사원이름,D.DEPTNO AS 부서번호,D.DNAME AS 부서이름
FROM EMP E, DEPT D;

SELECT s.sche_date 경기일, st.stadium_name 구장명, t1.team_name 홈팀명,
t2.team_name 어웨이팀명
FROM SCHEDULE s, TEAM t1, TEAM t2, STADIUM st
WHERE s.stadium_id = st.stadium_id and
s.hometeam_id = t1.team_id and s.awayteam_id = t2.team_id
order by s.sche_date, st.stadium_name;


SELECT *
FROM PLAYER NATURAL JOIN TEAM;


SELECT s.sche_date 경기일, st.stadium_name 구장명,
s.home_score 홈팀점수, s.away_score 어워이팀점수
FROM SCHEDULE s JOIN STADIUM st
ON (s.stadium_id = st.stadium_id)
WHERE s.home_score > s.away_score;


SELECT *
FROM STADIUM CROSS JOIN TEAM;

SELECT *
FROM STADIUM st RIGHT OUTER JOIN TEAM t
ON st.stadium_id = t.stadium_id;


SELECT STADIUM_NAME, STADIUM.STADIUM_ID, SEAT_COUNT, HOMETEAM_ID, TEAM_NAME
FROM STADIUM LEFT OUTER JOIN TEAM
ON STADIUM.HOMETEAM_ID = TEAM.TEAM_ID
ORDER BY HOMETEAM_ID;