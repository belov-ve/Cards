--------------------------------------------------------------------------------
-- База данных update.s3db
-- таблица верси обновления
CREATE TABLE IF NOT EXISTS version (
	updv		INTEGER DEFAULT 1);		-- версия последнего обновления

-- таблица пачек
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,
	uid 		TEXT UNIQUE,			-- уникальный ID пачки. для системных всегда первая *
	lang 		TEXT,
	packname 	TEXT NOT NULL,
	packname_ru	TEXT NOT NULL,
	descript	TEXT,
	descript_ru	TEXT,
	version		default CURRENT_TIMESTAMP);

-- SELECT hex(randomblob(16));		-- для uid
-- SELECT datetime('now');		-- для version

-- таблица карточек
CREATE TABLE IF NOT EXISTS cards (
	np		INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,
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

CREATE TRIGGER IF NOT EXISTS card_insert AFTER INSERT ON cards
BEGIN
	UPDATE cards SET version=datetime('now') where rowid=new.rowid;
	UPDATE packet SET version=datetime('now') where np=new.np;
END;


-- UPDATE cards SET version=1 WHERE np=1; -- принудительная установка поля version (дата) (отработает триггер)

--------------------------------------------------------------------------------
-- База данных card.s3db
-- таблица версии структуры БД
CREATE TABLE IF NOT EXISTS version (
	dbv 		INTEGER DEFAULT 1,		-- версия структуры базы данных		
	updv		INTEGER DEFAULT 0);		-- версия последнего обновления

-- таблица пачек
CREATE TABLE IF NOT EXISTS packet (
	np  		INTEGER PRIMARY KEY,	-- номер пачки
	uid 		TEXT UNIQUE,		-- уникальный ID пачки, для системных всегда первая *
	type		INTEGER DEFAULT 1,	-- тип пачки (0 - системная, 1 - локальная, 2 - сетевая (загруженная локально), 2 сетевая без загрузки 
	lang 		TEXT DEFAULT "",	-- язык карточек (Ru-Ru,Ru-En,En-Ru,En-En,De-Ru,Ru-De,Other)
	packname	TEXT NOT NULL,		-- название пачки
	descript	TEXT,			-- описание пачки
	version		default CURRENT_TIMESTAMP,	-- версия последнего пакета обновления (время)
	record		INTEGER DEFAULT 0);	-- рекорд при експресс опросе		
	
-- таблица карточек
CREATE TABLE IF NOT EXISTS cards (
	nc		INTEGER PRIMARY KEY,	-- номер карточки (в локальной БД)
	np		INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,	-- карточка от пачки packet.np
	question1	TEXT NOT NULL,		-- вопрос карточки
	question2	TEXT NOT NULL,		-- ответ карточки
	hide1		INTEGER DEFAULT 0,	-- признак "скрыть для прямого перебора"
	hide2		INTEGER DEFAULT 0,	-- признак "скрыть для прямого перебора"
	version		default CURRENT_TIMESTAMP);	-- версия (время последнего изменения)
-- индекс для карточек
CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);	

CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);


-- триггер установки значения поля версии (даты) при изменеии карточки
-- (отключать при обновлении БД) DROP TRIGGER IF EXISTS cards_update;
CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE OF question1, question2 ON cards
BEGIN
	UPDATE cards SET version=datetime("now") where nc=new.nc;
END;

-- триггер проверки дублирования поля question1+np при изменеии карточки
CREATE TRIGGER IF NOT EXISTS cards_update_question AFTER UPDATE OF question1 ON cards
BEGIN
	SELECT
		CASE
			WHEN Count(*)>1 THEN RAISE(ABORT, 'Duplicate question1')
		END
	FROM cards WHERE np||question1=new.np||new.question1;
END;

-- триггер проверки дублирования поля question1+np при добавлении карточки
CREATE TRIGGER IF NOT EXISTS cards_insert_question BEFORE INSERT ON cards
BEGIN
	SELECT
		CASE
			WHEN MIN(rowid) IS NOT NULL THEN RAISE(ABORT, 'Duplicate question1')
	END
	FROM cards WHERE np||question1=new.np||new.question1;
END;

-- триггер очистки при удалении пачки
-- (заменен на констрейн)
-- CREATE TRIGGER IF NOT EXISTS cards_clear BEFORE DELETE ON packet
-- BEGIN
--	DELETE FROM cards WHERE np=old.np;
-- END;


-- таблица статистики ответов
CREATE TABLE IF NOT EXISTS answers (
	nc	INTEGER REFERENCES cards (nc) ON DELETE CASCADE ON UPDATE CASCADE,	-- ответ к номеру карточки
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
	
-- триггер очистки статистики и сброса признаков "скрытия карточки" при изменении содержания карточки
CREATE TRIGGER IF NOT EXISTS answers_clear AFTER UPDATE OF question1,question2 ON cards
BEGIN
	DELETE FROM answers WHERE nc=old.nc;
	UPDATE cards SET  hide1=0, hide2=0 WHERE nc=old.nc;
END;

-- вьюха статистики по пачке
CREATE VIEW IF NOT EXISTS pack_stats AS
	SELECT	np,		-- номер пачки
		count(np) AS countcards,	--всего карточек в пачке
		max(version) AS lastmod,
		(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide1=1) AS hide1,	-- всего скрыто для прямого просмотра
		(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide2=1) AS hide2	-- всего скрыто для обратного порсмотра
	FROM cards c1 GROUP BY np;

-- вьюха статистики по карточке
CREATE VIEW IF NOT EXISTS card_stats AS
	SELECT	nc,				-- номер карточки
		count(nc) AS countanswers,	--всего ответов на карточеку
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=1) AS direct_true,	-- верный ответ. прямой опрос 
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=0) AS direct_false,-- ошибочный ответ. прямой опрос 
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=1) AS reverse_true,-- верный ответ. обратный опрос
		(SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=0) AS reverse_false-- ошибочный ответ. обратный опрос
	FROM answers c1 GROUP BY nc;

 
-- триггер очистки статистики при удалении карточки
-- заменил на констрыин
-- CREATE TRIGGER IF NOT EXISTS answers_clear2 BEFORE DELETE ON cards
-- BEGIN
--	DELETE FROM answers WHERE nc=old.rowid;
-- END;
------------------------------------------------------------

-- не забыть включить
PRAGMA foreign_keys=ON;

-- рабочие "селекты"
SELECT count(c1.np) FROM cards c1 GROUP BY np;
SELECT * FROM cards;
SELECT p.np,p.uid,p.version,max(c.version) AS cversion, count(c.nc) AS ccount FROM packet p
LEFT JOIN cards c ON c.np=p.np GROUP BY p.np;

SELECT c.np, count(c.np) AS cards, max(c.version) AS lastmod,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide1=1) AS hide1,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide2=1) AS hide2
FROM cards c GROUP BY c.np;
-- отбор информации по пачкам со статистикой
SELECT p.np,p.uid,p.version,max(c.version) AS cversion, count(c.nc) AS ccount,
	(SELECT count(c1.np) FROM cards c1 WHERE c1.np=c.np and c1.hide1=1) AS hide1,
	(SELECT count(c2.np) FROM cards c2 WHERE c2.np=c.np and c2.hide2=1) AS hide2
	FROM packet p
	LEFT JOIN cards c ON c.np=p.np GROUP BY p.np;	
-- то же, но через view
SELECT p.np, p.uid, p.version, datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
	FROM packet p
	LEFT JOIN pack_stats s ON s.np=p.np GROUP BY s.np;	-- можно без GROUP???
-- то же через view по одной пачке
SELECT p.np, p.uid, p.version, datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
	FROM packet p
	LEFT JOIN pack_stats s ON s.np=p.np
		WHERE p.np=3;	
	

-- отбор информации по карточкам со статистикой
SELECT 	c.nc,c.question1,c.question2,c.hide1,c.hide2,
	s.direct_true,s.direct_false,reverse_true,reverse_false
	FROM cards c
		LEFT JOIN card_stats s ON s.nc=c.nc
	WHERE c.np=2					-- номер карточки
        ORDER BY c.question1;

select * from cards where nc=171;

UPDATE cards SET question1='Ворос 1',question2='Ответ -',hide1=1,hide2=2
WHERE nc=171;

select version, datetime(version,'localtime') from packet;


-- отбор информации по пачке с детализацией
SELECT p.lang, datetime(p.version,'localtime') AS version,
  datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2
  FROM packet p LEFT JOIN pack_stats s ON s.np=p.np 
  WHERE p.np=3;
  
  

  