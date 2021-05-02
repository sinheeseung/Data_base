SELECT E.EMPNO AS �����ȣ,E.ENAME AS ����̸�,D.DEPTNO AS �μ���ȣ,D.DNAME AS �μ��̸�
FROM EMP E, DEPT D;

SELECT s.sche_date �����, st.stadium_name �����, t1.team_name Ȩ����,
t2.team_name ���������
FROM SCHEDULE s, TEAM t1, TEAM t2, STADIUM st
WHERE s.stadium_id = st.stadium_id and
s.hometeam_id = t1.team_id and s.awayteam_id = t2.team_id
order by s.sche_date, st.stadium_name;


SELECT *
FROM PLAYER NATURAL JOIN TEAM;


SELECT s.sche_date �����, st.stadium_name �����,
s.home_score Ȩ������, s.away_score �����������
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