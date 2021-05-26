/*PreviousRental table data �߰� */
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

/*Ebook table data �߰� */
INSERT INTO EBOOK VALUES (15020, '�츮�� ���۷δϿ��� �Ծ�', 'â��', '2021-05-10', null,0, null, null);
INSERT INTO EBOOK VALUES (15021, '����Ʈ', 'â��', '2019-04-19', null,0, null, null);
INSERT INTO EBOOK VALUES (15022, '��Ű� �� ����', '���̺�', '2018-01-30', null,0, null, null);
INSERT INTO EBOOK VALUES (15023, '���� ���� ������ �ʿ��� �ְ� �ʹ�', '�˿���ġ�ڸ���', '2017-06-07', null,0, null, null);
INSERT INTO EBOOK VALUES (15024, '�Ϻ��� ���� �ݷ�', '�������', '2016-06-27', null,0, null, null);

/*Authors table data �߰� */
INSERT INTO AUTHORS VALUES (15020, '�����');
INSERT INTO AUTHORS VALUES (15021, '����');
INSERT INTO AUTHORS VALUES (15022, '������');
INSERT INTO AUTHORS VALUES (15023, '������');
INSERT INTO AUTHORS VALUES (15024, '����Ŭ ����');

/*PreviousRental ���̺��� ��� ���� ����� ������, ������, �۰�, ��������, �ݳ�
���ڸ� �������ڸ� �������� ������������ �����Ͽ� ����Ͽ���.*/

select c.name as �̸�, e.title as ������, a.author as �۰�, p.daterented as ��������, p.datereturned as �ݳ�����
from Customer c, Ebook e, PreviousRental p, Authors a
where p.cno = c.cno and p.isbn = e.isbn and p.isbn = a.isbn
order by p.daterented;

/*ebook ���̺��� �׷��Լ��� �̿��Ͽ� ���ǻ纰 ���� �Ǽ��� ���� �Ǽ��� �������� 
������������ ����Ͽ���.*/

select e.publisher as ���ǻ�, count(*) as ���ǱǼ�
from ebook e
group by e.publisher
order by count(*);

/*PreviousRental ���̺��� �׷��Լ��� �̿��Ͽ� ȸ����ȣ�� �� ����Ǽ��� �������� ������������ �����Ͽ�
ȸ����, ȸ����ȣ, �Ѵ���Ǽ��� ����Ͽ���.*/

select c.name as �̸�, p.cno as ȸ����ȣ, count(*) as �Ѵ���Ǽ�
from previousRental p, customer c
where p.cno = c.cno
group by p.cno, c.name
order by count(*);


/*PreviousRental ���̺��� ������ �Լ��� �̿��Ͽ� ������ �̸�, ȸ����ȣ, ����Ƚ��, 
����Ƚ���� ���� ������ ���Ͽ���.(������ ������ ������ �ϳ��� �Ǽ��� ���)*/

select c.name as �̸�, p.cno as ȸ����ȣ, count(*) as ����Ƚ��, dense_rank() over (order by count(*) desc) as ����Ƚ����ŷ
from PreviousRental p, customer c
where p.cno = c.cno
group by p.cno, c.name;



