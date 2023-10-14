--------------------------------------------------------------------------------
-- ���� ������ update.s3db
-- ������� �����
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,
	uid 		TEXT UNIQUE,
	lang 		TEXT,
	packname 	TEXT NOT NULL,
	descript	TEXT),
	version		default CURRENT_TIMESTAMP);

-- SELECT hex(randomblob(16));		-- ��� uid
-- SELECT datetime('now');		-- ��� version

-- ������� ��������
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER NOT NULL,
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

-- UPDATE cards SET version=1 WHERE np=1; -- �������������� ��������� ���� version (����)

--------------------------------------------------------------------------------
-- ���� ������ card.s3db
-- ������� �����
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,	-- ����� �����
	uid 		TEXT UNIQUE,		-- ���������� ID �����
	type		INTEGER DEFAULT null,	-- ��� ����� (null - ���������, 0 - ���������, 1 - ������� (����������� ��������), 2 ������� ��� �������� 
	lang 		TEXT DEFAULT "",	-- ���� �������� (ru-ru,ru-en,en-ru,en-en,de-ru,ru-de)
	packname	TEXT NOT NULL,		-- �������� �����
	descript	TEXT,			-- �������� �����
	version		default CURRENT_TIMESTAMP);	-- ������ ���������� ������ ���������� (�����)
	
-- ������� ��������
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER NOT NULL,	-- �������� �� ����� packet.np
	question1	TEXT UNIQUE,		-- �����-1 ��������
	question2	TEXT NOT NULL,		-- �����-1 ��������
	hide1		INTEGER DEFAULT "0",	-- ������� "������ ��� ������� ��������"
	hide2		INTEGER DEFAULT "0",	-- ������� "������ ��� ������� ��������"
	version		default CURRENT_TIMESTAMP)	-- ������ (����� ���������� ���������)
-- ������ ��� ��������
CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);	

CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);


-- ������� ��������� �������� ���� ���� ��� �������� ��������
CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
END;	

-- ������� ������� ��� �������� �����
CREATE TRIGGER IF NOT EXISTS cards_clear BEFORE DELETE ON packet
BEGIN
	DELETE FROM cards WHERE np=old.np;
END;


-- ������� ���������� �������
CREATE TABLE IF NOT EXISTS answers (
	nc	INTEGER NOT NULL,		-- ����� � ������ ��������
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
	
-- ������� ������� ���������� ��� ��������� ���������� ��������
CREATE TRIGGER IF NOT EXISTS answers_clear1 
	AFTER UPDATE OF question1,question2 ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.rowid;
END;

-- ������� ������� ���������� ��� �������� ��������
CREATE TRIGGER IF NOT EXISTS answers_clear2 
	BEFORE DELETE ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.rowid;
END;
