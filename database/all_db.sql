--------------------------------------------------------------------------------
-- ���� ������ update.s3db
-- ������� ����� ����������
CREATE TABLE IF NOT EXISTS version (
	updv		INTEGER DEFAULT 1);		-- ������ ���������� ����������

-- ������� �����
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,
	uid 		TEXT UNIQUE,			-- ���������� ID �����. ��� ��������� ������ ������ *
	lang 		TEXT,
	packname 	TEXT NOT NULL,
	packname_ru	TEXT NOT NULL,
	descript	TEXT,
	descript_ru	TEXT,
	version		default CURRENT_TIMESTAMP);

-- SELECT hex(randomblob(16));		-- ��� uid
-- SELECT datetime('now');		-- ��� version

-- ������� ��������
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,
	question1	TEXT UNIQUE,
	question2	TEXT NOT NULL,
	version		default CURRENT_TIMESTAMP);

-- SELECT datetime('now');	-- ��� version

-- ������� ��������� �������� ���� ���� ��� �������� ����������
CREATE TRIGGER IF NOT EXISTS card_update AFTER UPDATE ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
	UPDATE packet SET version=datetime('now') where np=new.np;
END;

CREATE TRIGGER IF NOT EXISTS card_insert AFTER INSERT ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
	UPDATE packet SET version=datetime('now') where np=new.np;
END;


-- UPDATE cards SET version=1 WHERE np=1; -- �������������� ��������� ���� version (����) (���������� �������)

--------------------------------------------------------------------------------
-- ���� ������ card.s3db
-- ������� ������ ��������� ��
CREATE TABLE IF NOT EXISTS version (
	dbv 		INTEGER DEFAULT 1,		-- ������ ��������� ���� ������		
	updv		INTEGER DEFAULT 0);		-- ������ ���������� ����������

-- ������� �����
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,	-- ����� �����
	uid 		TEXT UNIQUE,		-- ���������� ID �����, ��� ��������� ������ ������ *
	type		INTEGER DEFAULT 1,	-- ��� ����� (0 - ���������, 1 - ���������, 2 - ������� (����������� ��������), 2 ������� ��� �������� 
	lang 		TEXT DEFAULT "",	-- ���� �������� (Ru-Ru,Ru-En,En-Ru,En-En,De-Ru,Ru-De,Other)
	packname	TEXT NOT NULL,		-- �������� �����
	descript	TEXT,			-- �������� �����
	version		default CURRENT_TIMESTAMP,	-- ������ ���������� ������ ���������� (�����)
	record		INTEGER DEFAULT 0);	-- ������ ��� �������� ������		
	
-- ������� ��������
CREATE TABLE IF NOT EXISTS cards (
	nc		INTEGER PRIMARY KEY,	-- ����� �������� (� ��������� ��)
	np		INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,	-- �������� �� ����� packet.np
	question1	TEXT NOT NULL,		-- ������ ��������
	question2	TEXT NOT NULL,		-- ����� ��������
	hide1		INTEGER DEFAULT 0,	-- ������� "������ ��� ������� ��������"
	hide2		INTEGER DEFAULT 0,	-- ������� "������ ��� ������� ��������"
	version		default CURRENT_TIMESTAMP);	-- ������ (����� ���������� ���������)
-- ������ ��� ��������
CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);	

CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);


-- ������� ��������� �������� ���� ������ (����) ��� �������� ��������
-- (��������� ��� ���������� ��) DROP TRIGGER IF EXISTS cards_update;
CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE OF question1, question2 ON cards
BEGIN
	UPDATE cards SET version=datetime("now") where nc=new.nc;
END;

-- ������� �������� ������������ ���� question1+np ��� �������� ��������
CREATE TRIGGER IF NOT EXISTS cards_update_question AFTER UPDATE OF question1 ON cards
BEGIN
	SELECT
		CASE
			WHEN Count(*)>1 THEN RAISE(ABORT, 'Duplicate question1')
		END
	FROM cards WHERE np||question1=new.np||new.question1;
END;

-- ������� �������� ������������ ���� question1+np ��� ���������� ��������
CREATE TRIGGER IF NOT EXISTS cards_insert_question BEFORE INSERT ON cards
BEGIN
	SELECT
		CASE
			WHEN MIN(rowid) IS NOT NULL THEN RAISE(ABORT, 'Duplicate question1')
	END
	FROM cards WHERE np||question1=new.np||new.question1;
END;

-- ������� ������� ��� �������� �����
-- (������� �� ���������)
-- CREATE TRIGGER IF NOT EXISTS cards_clear BEFORE DELETE ON packet
-- BEGIN
--	DELETE FROM cards WHERE np=old.np;
-- END;


-- ������� ���������� �������
CREATE TABLE IF NOT EXISTS answers (
	nc	INTEGER REFERENCES cards (nc) ON DELETE CASCADE ON UPDATE CASCADE,	-- ����� � ������ ��������
	direct	INTEGER NOT NULL,		-- ����������� ������ (0/1 - ������/��������)
	answer	INTEGER	NOT NULL,		-- 1/0 (�����/������)
	atime	default CURRENT_TIMESTAMP);	-- ����� ������
	
-- ������� ��� �������
CREATE INDEX IF NOT EXISTS answers_atime on answers (atime ASC);
CREATE INDEX IF NOT EXISTS answers_nc on answers (nc ASC);
CREATE INDEX IF NOT EXISTS answers_direct on answers (direct ASC);

-- ������� ��������� �������� ���� ���� ��� ���������� ���������� (���������� ���������)
CREATE TRIGGER IF NOT EXISTS answers_update_time AFTER INSERT ON answers
BEGIN
	UPDATE answers SET atime=datetime('now') where rowid=new.rowid;
END;

-- ������� ������� ������� ��� ����� �������� 
-- (�� ����� 10 ��� ������ ����������� ������)
CREATE TRIGGER IF NOT EXISTS answer_count_clear AFTER INSERT ON answers
BEGIN
	DELETE FROM answers WHERE rowid IN (
		SELECT rowid FROM answers 
		WHERE nc=new.nc and direct=new.direct 
		ORDER BY atime DESC LIMIT -1 OFFSET 10);
END;
	
-- ������� ������� ���������� � ������ ��������� "������� ��������" ��� ��������� ���������� ��������
CREATE TRIGGER IF NOT EXISTS answers_clear AFTER UPDATE OF question1,question2 ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.nc;
	UPDATE cards SET  hide1=0, hide2=0 WHERE nc=old.nc;
END;

-- ����� ���������� �� �����
CREATE VIEW IF NOT EXISTS pack_stats AS
	SELECT	np,		-- ����� �����
		count(np) AS countcards,	--����� �������� � �����
		max(version) AS lastmod,
		(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide1=1) AS hide1,	-- ����� ������ ��� ������� ���������
		(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide2=1) AS hide2	-- ����� ������ ��� ��������� ���������
	FROM cards c1 GROUP BY np;

-- ����� ���������� �� ��������
CREATE VIEW IF NOT EXISTS card_stats AS
	SELECT	nc,				-- ����� ��������
		count(nc) AS countanswers,	--����� ������� �� ���������
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=1) AS direct_true,	-- ������ �����. ������ ����� 
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=0) AS direct_false,-- ��������� �����. ������ ����� 
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=1) AS reverse_true,-- ������ �����. �������� �����
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=0) AS reverse_false-- ��������� �����. �������� �����
	FROM answers c1 GROUP BY nc;

 
-- ������� ������� ���������� ��� �������� ��������
-- ������� �� ���������
-- CREATE TRIGGER IF NOT EXISTS answers_clear2 BEFORE DELETE ON cards
-- BEGIN
--	DELETE FROM answers WHERE nc=old.rowid;
-- END;
------------------------------------------------------------

-- �� ������ ��������
PRAGMA foreign_keys=ON;

-- ������� "�������"
SELECT count(c1.np) FROM cards c1 GROUP BY np;
SELECT * FROM cards;
SELECT p.np,p.uid,p.version,max(c.version) AS cversion, count(c.nc) AS ccount FROM packet p
LEFT JOIN cards c ON c.np=p.np GROUP BY p.np;

SELECT c.np, count(c.np) AS cards, max(c.version) AS lastmod,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide1=1) AS hide1,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide2=1) AS hide2
FROM cards c GROUP BY c.np;
-- ����� ���������� �� ������ �� �����������
SELECT p.np,p.uid,p.version,max(c.version) AS cversion, count(c.nc) AS ccount,
	(SELECT count(c1.np) FROM cards c1 WHERE c1.np=c.np and c1.hide1=1) AS hide1,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide2=1) AS hide2
	FROM packet p
	LEFT JOIN cards c ON c.np=p.np GROUP BY p.np;	
-- �� ��, �� ����� view
SELECT p.np, p.uid, p.version, datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
	FROM packet p
	LEFT JOIN pack_stats s ON s.np=p.np GROUP BY s.np;	-- ����� ��� GROUP???
-- �� �� ����� view �� ����� �����
SELECT p.np, p.uid, p.version, datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
	FROM packet p
	LEFT JOIN pack_stats s ON s.np=p.np
		WHERE p.np=3;	
	

-- ����� ���������� �� ��������� �� �����������
SELECT 	c.nc,c.question1,c.question2,c.hide1,c.hide2,
	s.direct_true,s.direct_false,reverse_true,reverse_false
	FROM cards c
		LEFT JOIN card_stats s ON s.nc=c.nc
	WHERE c.np=2					-- ����� ��������
        ORDER BY c.question1;

select * from cards where nc=171;

UPDATE cards SET question1='����� 1',question2='����� -',hide1=1,hide2=2
WHERE nc=171;

select version, datetime(version,'localtime') from packet;


-- ����� ���������� �� ����� � ������������
SELECT p.lang, datetime(p.version,'localtime') AS version,
  datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
  FROM packet p LEFT JOIN pack_stats s ON s.np=p.np 
  WHERE p.np=3;
  
  

  