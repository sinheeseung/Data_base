/*PLAYER 테이블에서 팀별로 각 포지션별 선수의 수와 평균 신장(키)을 구하는 뷰를 생성하고 생성된 뷰의 전체 데이터를 조회하는 SQL문을 작성하라. (단, PIVOT절을 사용하고 팀 ID순으로 정렬한다.)*/
create view playerInfo as
select *
from (select team_id, position, height from player)
pivot (avg(height) as avg_height, count(*) as cnt for position in ('FW' as FW,'MF' AS MF,'DF' AS DF,'GK' AS GK))
order by team_id;

select *
from playerInfo;

/*[과제11-1]에서 생성한 뷰의 전체 데이터 조회 결과 중 각 팀에서 포지션이 ‘MF’인 선수들의 정보(선수의 수, 평균 신장(키))를 조회하는 SQL문을 작성하라. (단, UNPIVOT절을 사용하고 팀 ID순으로 정렬한다.) */
select team_id, POSITION, height AS AVG_HEIGHT, MF_CNT AS COUNT
from playerInfo
unpivot ((height,MF_CNT) for position IN ((MF_AVG_HEIGHT,MF_CNT) AS 'MF'))
order by team_id;

drop view playerInfo;

