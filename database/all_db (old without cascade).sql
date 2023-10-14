--------------------------------------------------------------------------------
-- База данных update.s3db
-- таблица пачек
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,
	uid 		TEXT UNIQUE,
	lang 		TEXT,
	packname 	TEXT NOT NULL,
	descript	TEXT),
	version		default CURRENT_TIMESTAMP);

-- SELECT hex(randomblob(16));		-- для uid
-- SELECT datetime('now');		-- для version

-- таблица карточек
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER NOT NULL,
	question1	TEXT UNIQUE,
	question2	TEXT NOT NULL,
	version		default CURRENT_TIMESTAMP);

-- SELECT datetime('now');	-- для version

-- триггер установки значения поля даты при изменеии статистики
CREATE TRIGGER IF NOT EXISTS card_update AFTER UPDATE ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
	UPDATE packet SET version=datetime('now') where np=new.np;
END;

-- UPDATE cards SET version=1 WHERE np=1; -- принудительная установка поля version (дата)

--------------------------------------------------------------------------------
-- База данных card.s3db
-- таблица пачек
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,	-- номер пачки
	uid 		TEXT UNIQUE,		-- уникальный ID пачки
	type		INTEGER DEFAULT null,	-- тип пачки (null - локальная, 0 - системная, 1 - сетевая (загруженная локально), 2 сетевая без загрузки 
	lang 		TEXT DEFAULT "",	-- язык карточек (ru-ru,ru-en,en-ru,en-en,de-ru,ru-de)
	packname	TEXT NOT NULL,		-- название пачки
	descript	TEXT,			-- описание пачки
	version		default CURRENT_TIMESTAMP);	-- версия последнего пакета обновления (время)
	
-- таблица карточек
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER NOT NULL,	-- карточка от пачки packet.np
	question1	TEXT UNIQUE,		-- текст-1 карточки
	question2	TEXT NOT NULL,		-- текст-1 карточки
	hide1		INTEGER DEFAULT "0",	-- признак "скрыть для прямого перебора"
	hide2		INTEGER DEFAULT "0",	-- признак "скрыть для прямого перебора"
	version		default CURRENT_TIMESTAMP)	-- версия (время последнего изменения)
-- индекс для карточек
CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);	

CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);


-- триггер установки значения поля даты при изменеии карточки
CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
END;	

-- триггер очистки при удалении пачки
CREATE TRIGGER IF NOT EXISTS cards_clear BEFORE DELETE ON packet
BEGIN
	DELETE FROM cards WHERE np=old.np;
END;


-- таблица статистики ответов
CREATE TABLE IF NOT EXISTS answers (
	nc	INTEGER NOT NULL,		-- ответ к номеру карточки
	direct	INTEGER NOT NULL,		-- направление ответа (0/1 - прямой/обратный)
	answer	INTEGER	NOT NULL,		-- 1/0 (верно/ошибка)
	atime	default CURRENT_TIMESTAMP);	-- время ответа
	
-- индексы для ответов
CREATE INDEX IF NOT EXISTS answers_atime on answers (atime ASC);
CREATE INDEX IF NOT EXISTS answers_nc on answers (nc ASC);
CREATE INDEX IF NOT EXISTS answers_direct on answers (direct ASC);

-- триггер установки значения поля даты при добавлении статистики (избыточный контролль)
CREATE TRIGGER IF NOT EXISTS answers_update_time AFTER INSERT ON answers
BEGIN
	UPDATE answers SET atime=datetime('now') where rowid=new.rowid;
END;

-- триггер очистки ответов для одной карточки 
-- (не более 10 для одного направления ответа)
CREATE TRIGGER IF NOT EXISTS answer_count_clear AFTER INSERT ON answers
BEGIN
	DELETE FROM answers WHERE rowid IN (
		SELECT rowid FROM answers 
		WHERE nc=new.nc and direct=new.direct 
		ORDER BY atime DESC LIMIT -1 OFFSET 10);
END;
	
-- триггер очистки статистики при изменении содержания карточки
CREATE TRIGGER IF NOT EXISTS answers_clear1 
	AFTER UPDATE OF question1,question2 ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.rowid;
END;

-- триггер очистки статистики при удалении карточки
CREATE TRIGGER IF NOT EXISTS answers_clear2 
	BEFORE DELETE ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.rowid;
END;
