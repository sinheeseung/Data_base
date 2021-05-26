/*PreviousRental table data 추가 */
INSERT INTO PreviousRental VALUES(15002,'2021-02-01','2021-02-20',150);
INSERT INTO PreviousRental VALUES(15001,'2021-01-13','2021-02-03',150);
INSERT INTO PreviousRental VALUES(15015,'2021-02-13','2021-02-28',153);
INSERT INTO PreviousRental VALUES(15013,'2021-01-02','2021-02-01',154);
INSERT INTO PreviousRental VALUES(15007,'2021-02-03','2021-02-13',157);
INSERT INTO PreviousRental VALUES(15008,'2021-01-07','2021-01-15',157);
INSERT INTO PreviousRental VALUES(15010,'2021-02-01','2021-02-20',156);
INSERT INTO PreviousRental VALUES(15009,'2020-12-12','2020-12-17',155);
INSERT INTO PreviousRental VALUES(15008,'2020-05-16','2020-05-21',154);
INSERT INTO PreviousRental VALUES(15008,'2020-04-20','2020-05-13',153);
INSERT INTO PreviousRental VALUES(15004,'2020-12-27','2021-01-05',157);
INSERT INTO PreviousRental VALUES(15004,'2020-11-06','2020-12-03',158);
INSERT INTO PreviousRental VALUES(15018,'2020-03-24','2020-04-01',154);
INSERT INTO PreviousRental VALUES(15019,'2020-01-25','2020-02-17',155);

/*Ebook table data 추가 */
INSERT INTO EBOOK VALUES (15020, '우리는 페퍼로니에서 왔어', '창비', '2021-05-10', null,0, null, null);
INSERT INTO EBOOK VALUES (15021, '페인트', '창비', '2019-04-19', null,0, null, null);
INSERT INTO EBOOK VALUES (15022, '당신과 나 사이', '메이븐', '2018-01-30', null,0, null, null);
INSERT INTO EBOOK VALUES (15023, '가장 예쁜 생각을 너에게 주고 싶다', '알에이치코리아', '2017-06-07', null,0, null, null);
INSERT INTO EBOOK VALUES (15024, '완벽에 대한 반론', '와이즈베리', '2016-06-27', null,0, null, null);

/*Authors table data 추가 */
INSERT INTO AUTHORS VALUES (15020, '김금희');
INSERT INTO AUTHORS VALUES (15021, '이희영');
INSERT INTO AUTHORS VALUES (15022, '김혜남');
INSERT INTO AUTHORS VALUES (15023, '나태주');
INSERT INTO AUTHORS VALUES (15024, '마이클 센델');

/*PreviousRental 테이블에서 모든 대출 기록의 대출자, 도서명, 작가, 대출일자, 반납
일자를 대출일자를 기준으로 오름차순으로 정렬하여 출력하여라.*/

select c.name as 이름, e.title as 도서명, a.author as 작가, p.daterented as 대출일자, p.datereturned as 반납일자
from Customer c, Ebook e, PreviousRental p, Authors a
where p.cno = c.cno and p.isbn = e.isbn and p.isbn = a.isbn
order by p.daterented;

/*ebook 테이블에서 그룹함수를 이용하여 출판사별 출판 권수를 출판 권수를 기준으로 
오름차순으로 출력하여라.*/

select e.publisher as 출판사, count(*) as 출판권수
from ebook e
group by e.publisher
order by count(*);

/*PreviousRental 테이블에서 그룹함수를 이용하여 회원번호별 총 대출권수를 기준으로 오름차순으로 정렬하여
회원명, 회원번호, 총대출권수를 출력하여라.*/

select c.name as 이름, p.cno as 회원번호, count(*) as 총대출권수
from previousRental p, customer c
where p.cno = c.cno
group by p.cno, c.name
order by count(*);


/*PreviousRental 테이블에서 윈도우 함수를 이용하여 대출자 이름, 회원번호, 대출횟수, 
대출횟수에 따른 순위를 구하여라.(순위는 동일한 순위를 하나의 건수로 취급)*/

select c.name as 이름, p.cno as 회원번호, count(*) as 대출횟수, dense_rank() over (order by count(*) desc) as 대출횟수랭킹
from PreviousRental p, customer c
where p.cno = c.cno
group by p.cno, c.name;



