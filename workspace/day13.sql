SELECT * FROM PET;
SELECT * FROM OWNER;

INSERT INTO OWNER (ID, NAME, AGE, ADDRESS)
VALUES('20201005001', '������', 26, '���ֱ�����');

INSERT INTO OWNER (ID, NAME, AGE, ADDRESS)
VALUES('20201005002', 'ȫ�浿', 21, '��⵵ ������');

INSERT INTO PET (PIN, NAME, AGE, OWNERID, GENDER)
VALUES('8202001', '�ǻ�', 4, '20201005001', 'W');

INSERT INTO PET VALUES('8202002', '�ٵ���', 3, '20201005002', 'M');

INSERT INTO PET VALUES('8202003', '�߿���', 10, '20201005001', 'M');

SELECT NAME FROM PET WHERE GENDER <> 'M';
SELECT NAME FROM PET WHERE GENDER = 'M';

DELETE FROM PET 
WHERE NAME = '�ٵ���';

UPDATE OWNER
SET NAME = '�̼���'
WHERE ID = '20201005002';

TRUNCATE TABLE PET;

