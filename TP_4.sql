INSERT INTO CUSTOMER VALUES (150, '신희승', 'tlsgmltmd0', 'shs7265@naver.com');
INSERT INTO CUSTOMER VALUES (151, '이동국', 'dlehdrnr1', 'dongkuk@naver.com');
INSERT INTO CUSTOMER VALUES (152, '손흥민', 'thsgmdals2', 'sonny_tot@naver.com');
INSERT INTO CUSTOMER VALUES (153, '김영광', 'rladudrhkd3', 'glory@naver.com');
INSERT INTO CUSTOMER VALUES (154, '이청용', 'dlcjddyd4', 'blue_dragon@naver.com');
INSERT INTO CUSTOMER VALUES (155, '기성용', 'rltjddyd5', 'Ki@naver.com');
INSERT INTO CUSTOMER VALUES (156, '윤빛가람', 'dbsqldrkfka6', 'garam@naver.com');
INSERT INTO CUSTOMER VALUES (157, '홍철', 'ghdcjf7', 'Hong@naver.com');
INSERT INTO CUSTOMER VALUES (158, '박지성', 'qkrwltjd8', 'jisung@naver.com');
INSERT INTO CUSTOMER VALUES (159, '이강인', 'dlrkddls9', 'gangin@naver.com');

select *
from customer;

INSERT INTO EBOOK VALUES (15000, '처음 읽는 음식의 세계사', '탐나는책', '2021-03-15', 150,1, '2021-05-01', '2021-05-21');
INSERT INTO EBOOK VALUES (15001, '운의 알고리즘', '소울소사이어티', '2021-04-26', 154,2, '2021-04-27', '2021-05-27');
INSERT INTO EBOOK VALUES (15002, '공간의 미래', '을유문화사 ', '2021-04-27', 155,0, '2021-05-15', '2021-05-25');
INSERT INTO EBOOK VALUES (15003, '질서 너머', '웅진지식하우스', '21-03-24', null,0,null,null);
INSERT INTO EBOOK VALUES (15004, '부자 아빠 가난한 아빠. 1(20주년 특별 기념판)', '민음인', '2018-03-20', 156,1, '2021-05-05', '2021-05-25');
INSERT INTO EBOOK VALUES (15005, '기묘한 러브레터', '다산책방', '2021-05-03', null,0,null,null);
INSERT INTO EBOOK VALUES (15006, '아들아, 돈 공부해야 한다', '알에이치코리아', '2021-04-01', 151,1, '2021-05-04', '2021-05-24');
INSERT INTO EBOOK VALUES (15007, '지구를 위한다는 착각', '부키', '2021-05-07', 152 ,2, '2021-04-29', '2021-05-29');
INSERT INTO EBOOK VALUES (15008, '아몬드', '창비', '2017-03-31', 152,2, '2021-04-29', '2021-05-29');
INSERT INTO EBOOK VALUES (15009, '달러구트 꿈 백화점', '북닻', '2021-04-12', 150,1,'2021-05-01','2021-05-21');
INSERT INTO EBOOK VALUES (15010, '작은 별이지만 빛나고 있어', '북로망스', '2021-04-21', null,0,null,null);
INSERT INTO EBOOK VALUES (15011, '공정하다는 착각', '와이즈베리', '2020-11-20', null,0,null,null);
INSERT INTO EBOOK VALUES (15012, '달까지 가자', '창비', '2021-04-15', null,0,null,null);
INSERT INTO EBOOK VALUES (15013, '의미 있는 삶을 위하여', '수오서재', '2021-05-04', null,0,null,null);
INSERT INTO EBOOK VALUES (15014, '주린이가 가장 알고 싶은 최다질문 TOP77', '메이트북스', '2021-01-18',null,0,null,null);
INSERT INTO EBOOK VALUES (15015, '월가의 영웅', '국일증권경제연구소', '2018-05-04', null,0,null,null);
INSERT INTO EBOOK VALUES (15016, '시장을 풀어낸 수학자', '로크미디어', '2021-05-12', null,0,null,null);
INSERT INTO EBOOK VALUES (15017, '프로젝트 헤일메리', '알에이치코리아', '2021-05-10', null,0,null,null);
INSERT INTO EBOOK VALUES (15018, '12가지 인생의 법칙', '메이븐', '2018-10-29', null,0, null, null);
INSERT INTO EBOOK VALUES (15019, '왜 일하는가', '다산북스', '2021-04-12', null,0, null, null);

select *
from ebook;

INSERT INTO AUTHORS VALUES (15000, '미야자키 마사카츠');
INSERT INTO AUTHORS VALUES (15001, '정회도');
INSERT INTO AUTHORS VALUES (15002, '유현준');
INSERT INTO AUTHORS VALUES (15003, '조던피터슨');
INSERT INTO AUTHORS VALUES (15004, '로버트 기요사키');
INSERT INTO AUTHORS VALUES (15005, '야도노 카호루');
INSERT INTO AUTHORS VALUES (15006, '정선용');
INSERT INTO AUTHORS VALUES (15007, '마이클 셀런버거');
INSERT INTO AUTHORS VALUES (15008, '손원평');
INSERT INTO AUTHORS VALUES (15009, '이미예');
INSERT INTO AUTHORS VALUES (15010, '소윤');
INSERT INTO AUTHORS VALUES (15011, '마이클 샌델');
INSERT INTO AUTHORS VALUES (15012, '장류진');
INSERT INTO AUTHORS VALUES (15013, '알렉스 룽구');
INSERT INTO AUTHORS VALUES (15014, '염승환');
INSERT INTO AUTHORS VALUES (15015, '피터 린치');
INSERT INTO AUTHORS VALUES (15016, '그레고리 주커만');
INSERT INTO AUTHORS VALUES (15017, '앤디 위어');
INSERT INTO AUTHORS VALUES (15018, '조던 B. 피터슨');
INSERT INTO AUTHORS VALUES (15019, '이나모리 가즈오');

select *
from authors;

INSERT INTO Reservation VALUES(15009,151, '2021-05-13');
INSERT INTO Reservation VALUES(15009,153, '2021-05-15');
INSERT INTO Reservation VALUES(15009,157, '2021-05-17');
INSERT INTO Reservation VALUES(15006,152, '2021-05-12');
INSERT INTO Reservation VALUES(15006,159, '2021-05-14');
INSERT INTO Reservation VALUES(15006,157, '2021-05-17');

select *
from reservation;

INSERT INTO PreviousRental VALUES(15009,'2021-04-19','2021-04-27',151);
INSERT INTO PreviousRental VALUES(15001,'2021-02-13','2020-02-20',151);
INSERT INTO PreviousRental VALUES(15008,'2021-03-30','2020-04-15',151);
INSERT INTO PreviousRental VALUES(15007,'2020-12-17','2020-12-27',151);
INSERT INTO PreviousRental VALUES(15005,'2020-12-29','2021-01-13',151);

select *
from previousrental;

