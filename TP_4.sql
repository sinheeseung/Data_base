INSERT INTO CUSTOMER VALUES (150, '�����', 'tlsgmltmd0', 'shs7265@naver.com');
INSERT INTO CUSTOMER VALUES (151, '�̵���', 'dlehdrnr1', 'dongkuk@naver.com');
INSERT INTO CUSTOMER VALUES (152, '�����', 'thsgmdals2', 'sonny_tot@naver.com');
INSERT INTO CUSTOMER VALUES (153, '�迵��', 'rladudrhkd3', 'glory@naver.com');
INSERT INTO CUSTOMER VALUES (154, '��û��', 'dlcjddyd4', 'blue_dragon@naver.com');
INSERT INTO CUSTOMER VALUES (155, '�⼺��', 'rltjddyd5', 'Ki@naver.com');
INSERT INTO CUSTOMER VALUES (156, '��������', 'dbsqldrkfka6', 'garam@naver.com');
INSERT INTO CUSTOMER VALUES (157, 'ȫö', 'ghdcjf7', 'Hong@naver.com');
INSERT INTO CUSTOMER VALUES (158, '������', 'qkrwltjd8', 'jisung@naver.com');
INSERT INTO CUSTOMER VALUES (159, '�̰���', 'dlrkddls9', 'gangin@naver.com');

select *
from customer;

INSERT INTO EBOOK VALUES (15000, 'ó�� �д� ������ �����', 'Ž����å', '2021-03-15', 150,1, '2021-05-01', '2021-05-21');
INSERT INTO EBOOK VALUES (15001, '���� �˰���', '�ҿ�һ��̾�Ƽ', '2021-04-26', 154,2, '2021-04-27', '2021-05-27');
INSERT INTO EBOOK VALUES (15002, '������ �̷�', '������ȭ�� ', '2021-04-27', 155,0, '2021-05-15', '2021-05-25');
INSERT INTO EBOOK VALUES (15003, '���� �ʸ�', '���������Ͽ콺', '21-03-24', null,0,null,null);
INSERT INTO EBOOK VALUES (15004, '���� �ƺ� ������ �ƺ�. 1(20�ֳ� Ư�� �����)', '������', '2018-03-20', 156,1, '2021-05-05', '2021-05-25');
INSERT INTO EBOOK VALUES (15005, '�⹦�� ���극��', '�ٻ�å��', '2021-05-03', null,0,null,null);
INSERT INTO EBOOK VALUES (15006, '�Ƶ��, �� �����ؾ� �Ѵ�', '�˿���ġ�ڸ���', '2021-04-01', 151,1, '2021-05-04', '2021-05-24');
INSERT INTO EBOOK VALUES (15007, '������ ���Ѵٴ� ����', '��Ű', '2021-05-07', 152 ,2, '2021-04-29', '2021-05-29');
INSERT INTO EBOOK VALUES (15008, '�Ƹ��', 'â��', '2017-03-31', 152,2, '2021-04-29', '2021-05-29');
INSERT INTO EBOOK VALUES (15009, '�޷���Ʈ �� ��ȭ��', '�ϴ�', '2021-04-12', 150,1,'2021-05-01','2021-05-21');
INSERT INTO EBOOK VALUES (15010, '���� �������� ������ �־�', '�Ϸθ���', '2021-04-21', null,0,null,null);
INSERT INTO EBOOK VALUES (15011, '�����ϴٴ� ����', '�������', '2020-11-20', null,0,null,null);
INSERT INTO EBOOK VALUES (15012, '�ޱ��� ����', 'â��', '2021-04-15', null,0,null,null);
INSERT INTO EBOOK VALUES (15013, '�ǹ� �ִ� ���� ���Ͽ�', '��������', '2021-05-04', null,0,null,null);
INSERT INTO EBOOK VALUES (15014, '�ָ��̰� ���� �˰� ���� �ִ����� TOP77', '����Ʈ�Ͻ�', '2021-01-18',null,0,null,null);
INSERT INTO EBOOK VALUES (15015, '������ ����', '�������ǰ���������', '2018-05-04', null,0,null,null);
INSERT INTO EBOOK VALUES (15016, '������ Ǯ� ������', '��ũ�̵��', '2021-05-12', null,0,null,null);
INSERT INTO EBOOK VALUES (15017, '������Ʈ ���ϸ޸�', '�˿���ġ�ڸ���', '2021-05-10', null,0,null,null);
INSERT INTO EBOOK VALUES (15018, '12���� �λ��� ��Ģ', '���̺�', '2018-10-29', null,0, null, null);
INSERT INTO EBOOK VALUES (15019, '�� ���ϴ°�', '�ٻ�Ͻ�', '2021-04-12', null,0, null, null);

select *
from ebook;

INSERT INTO AUTHORS VALUES (15000, '�̾���Ű ����ī��');
INSERT INTO AUTHORS VALUES (15001, '��ȸ��');
INSERT INTO AUTHORS VALUES (15002, '������');
INSERT INTO AUTHORS VALUES (15003, '�������ͽ�');
INSERT INTO AUTHORS VALUES (15004, '�ι�Ʈ ����Ű');
INSERT INTO AUTHORS VALUES (15005, '�ߵ��� īȣ��');
INSERT INTO AUTHORS VALUES (15006, '������');
INSERT INTO AUTHORS VALUES (15007, '����Ŭ ��������');
INSERT INTO AUTHORS VALUES (15008, '�տ���');
INSERT INTO AUTHORS VALUES (15009, '�̹̿�');
INSERT INTO AUTHORS VALUES (15010, '����');
INSERT INTO AUTHORS VALUES (15011, '����Ŭ ����');
INSERT INTO AUTHORS VALUES (15012, '�����');
INSERT INTO AUTHORS VALUES (15013, '�˷��� �');
INSERT INTO AUTHORS VALUES (15014, '����ȯ');
INSERT INTO AUTHORS VALUES (15015, '���� ��ġ');
INSERT INTO AUTHORS VALUES (15016, '�׷��� ��Ŀ��');
INSERT INTO AUTHORS VALUES (15017, '�ص� ����');
INSERT INTO AUTHORS VALUES (15018, '���� B. ���ͽ�');
INSERT INTO AUTHORS VALUES (15019, '�̳��� �����');

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

