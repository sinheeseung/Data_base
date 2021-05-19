CREATE TABLE Customer
(
 cno NUMBER(3) NOT NULL, 
 name VARCHAR2(10),
 passwd VARCHAR2(12),
 email VARCHAR2(20),
 CONSTRAINT Customer_PK PRIMARY KEY (cno),
 CONSTRAINT Customer_UQ UNIQUE (email),
 CONSTRAINT CHK_cno CHECK (cno>=0)
);
describe Customer;

CREATE TABLE Ebook 
(
 isbn NUMBER(5) NOT NULL,
 title VARCHAR2(100),
 publisher VARCHAR2(14),
 year DATE,
 cno NUMBER(3),
 extTimes NUMBER(1) CHECK (extTimes>=0 AND extTimes<=2),
 dateRented DATE,
 dateDue DATE, 
 CONSTRAINT Ebook_PK PRIMARY KEY (isbn),
 CONSTRAINT Ebook_FK FOREIGN KEY (cno) REFERENCES Customer(cno)
);
describe Ebook;

CREATE TABLE Reservation
(
 isbn NUMBER(5) NOT NULL,
 cno NUMBER(3) NOT NULL,
 reservationTime DATE,
 CONSTRAINT Reserve_PK PRIMARY KEY (isbn, cno),
 CONSTRAINT Reserve_FK1 FOREIGN KEY (isbn) REFERENCES Ebook(isbn),
 CONSTRAINT Reserve_FK2 FOREIGN KEY (cno) REFERENCES Customer(cno)
);
describe Reservation;

CREATE TABLE PreviousRental
(
 isbn NUMBER(5) NOT NULL,
 dateRented DATE NOT NULL,
 dateReturned DATE NOT NULL,
 cno NUMBER(3) NOT NULL,
 CONSTRAINT PrevR_PK PRIMARY KEY (isbn, dateRented),
 CONSTRAINT PrevR_FK1 FOREIGN KEY (isbn) REFERENCES Ebook(isbn),
 CONSTRAINT PrevR_FK2 FOREIGN KEY (cno) REFERENCES Customer(cno)
);

describe PreviousRental;


CREATE TABLE Authors 
(
 isbn NUMBER(5) NOT NULL,
 author VARCHAR(14) NOT NULL,
 CONSTRAINT Authors_PK PRIMARY KEY (isbn, author),
 CONSTRAINT Authors_FK FOREIGN KEY (isbn) REFERENCES Ebook(isbn)
);

describe Authors;



 /*도서 예약 정보(ReservationInfo)라는 View를 정의해 보아라. View가 가져야 할 정보는 예약 도서의 isbn, title 및 예약 고객의 cno, name, email과 예약시간(reservationTime)이다.*/
CREATE VIEW ReservationInfo AS
 SELECT E.isbn, E.title, R.reservationTime, C.cno, C.name, C.email FROM Reservation R, Customer C, Ebook E
 WHERE R.cno = C.cno and E.isbn = R.isbn;


select *
from ReservationInfo;


drop table Customer;
drop table Ebook;
drop table Reservation;
drop table PreviousRental;
drop table Authors;
 
drop view ReservationInfo;