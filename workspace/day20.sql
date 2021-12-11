--�����Լ� (NULL�� �������� �ʴ´�) : ���� ���� ���� �ϳ��� ������ �����Ͽ� ��Ÿ����.	
--WHERE ������ ����� �� ����.

--AVG() : ���
--MAX() : �ִ밪
--MIN() : �ּҰ�
--SUM() : �� ��
--COUNT() : ����

SELECT AVG(HEIGHT), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;
SELECT ROUND(AVG(HEIGHT),2), MAX(HEIGHT), MIN(HEIGHT), SUM(HEIGHT), COUNT(HEIGHT) FROM PLAYER;

--PLAYER ���̺����� HEIGHT ���� �˻�(NULL �����ؼ� COUNT �ϱ�)
SELECT COUNT(HEIGHT) FROM PLAYER;
SELECT * FROM PLAYER;
SELECT COUNT(NVL(HEIGHT, 0)) FROM PLAYER;
-------------------------------------------------------------------------
--ORDER BY : ����
--ASC : ��������(�⺻��)
--DESC : ��������
SELECT * FROM PLAYER ORDER BY HEIGHT ; 
SELECT * FROM PLAYER ORDER BY HEIGHT DESC;
SELECT * FROM PLAYER ORDER BY 12 DESC;

--PLAYER ���̺����� Ű ��, ������ ��,(��������)���� �˻�
--NULL�� �ƴ� ���� �˻�
--ù��° �÷� ���� ������ �� ��° ������ �Ѵ�.
SELECT PLAYER_NAME, HEIGHT, WEIGHT FROM PLAYER 
WHERE HEIGHT IS NOT NULL AND WEIGHT IS NOT NULL
ORDER BY 2, 3;
-------------------------------------------------------------------------
--CASE��
--CASE WHEN THEN ELSE END
--CASE WHEN ���ǽ� THEN '�� ��' ELSE '���� ��' END
--EMP ���̺����� SAL 3000�̻��̸� HIGH_1000�̻��̸�MID, �� �ƴϸ� LOW
SELECT * FROM EMP;
SELECT ENAME �����, SAL �޿�, 
	CASE 
		WHEN SAL >= 3000 THEN 'HIGH'
		WHEN SAL >= 1000 THEN 'MID'
		ELSE 'LOW'
	END
FROM EMP;

-- STADIUM ���̺����� SEAT_COUNT�� 0 �̻� 30000�����̸� 'S'
-- 30001�̻� 50000���ϸ� 'M' �� �ƴϸ� 'L'
-- ��ø ���̽���
SELECT STADIUM_NAME �����, SEAT_COUNT �¼���,
	CASE
		WHEN SEAT_COUNT BETWEEN 0 AND 30000  THEN  'S' 
		ELSE 
			(
			CASE	
				WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'M' 
				ELSE 'L' 
				END
			) 
		END
FROM STADIUM;

--PLAYER ���̺����� WEIGHT�� 50�̻� 70���ϸ� 'L'
--71�̻� 80���ϸ� 'M' NULL�̸� '�̵��' �� �ƴϸ� 'H'
SELECT PLAYER_NAME �����̸�, WEIGHT||'kg' ������,
	CASE 
		WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
		WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
		ELSE
			(
			CASE WHEN WEIGHT IS NULL THEN '�̵��' 
			ELSE 'H' 
			END
			)
	END ü��
FROM PLAYER;































