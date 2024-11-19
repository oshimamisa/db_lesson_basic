CREATE TABLE `people`(
  `id` INT,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `password` CHAR(8)
  );

  CREATE TABLE people (
  person_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(255) UNIQUE,
  age INT,
  gender TINYINT COMMENT '1が男、2が女',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

  ALTER TABLE people MODIFY age TINYINT UNSIGNED;

  ALTER TABLE people MODIFY person_id INT UNSIGNED;

  ALTER TABLE people MODIFY person_id INT UNSIGNED AUTO_INCREMENT;

  INSERT INTO people (name,email,age,gender)
  VALUES
  ('鈴木たかし','suzuki@gisumo.jp', 20, 1),
  ('田中ゆうこ', 'tanaka@gizumo.jp', 25, 2),
  ('福田だいすけ', 'fukuda@gizumo.jp', 42, 1),
  ('豊島はなこ', 'toyoshima@gizumo.jp', 34, 2),
  ('早坂てつお', 'hayasaka@gizumo.co.jp', 61, 1),
  ('不思議沢みちこ', NULL, NULL, NULL);


  /*Section8 練習問題*/
  ALTER TABLE reports ADD name VARCHAR(255) AFTER person_id;

  INSERT INTO reports (person_id,content)
  VALUES
  (1, '地獄銭湯のストーリーが深く面白かった'),
  (2, 'チラズの新作ゲームが発表されたので楽しみ。'),
  (3, '年末ライブが発表されたけど、出演ライバーと開催地を見て今回はパスと決めた。'),
  (4, ''),
  (5, '新しく始めたゲームがストーリー性が深くて楽しい。スマホの操作性があんまりでPCで楽しみたいと思った。'),
  (6, '新曲が出た。最初にどかんと来る感じではないのに気付くとはまってる、本当に全てがスルメ曲。'),
  (7, '新衣装発表、という夢を見た。'),
  (8, 'イベントで好きな作家さんとお話ししたら最近夢に出てくるようになった。'),
  (9, 'ウエハース週間が始まった。いちご味割と好き。'),
  (10, '強オタの開封動画見るの楽しい。');

  


UPDATE reports SET content='強オタの開封動画見るの楽しい。' WHERE person_id=4;
DELETE FROM reports WHERE content='強オタの開封動画見るの楽しい。'

INSERT INTO reports (person_id,content)
VALUES
(10, '');

SELECT * FROM people INNER JOIN reports ON people.person_id = reports.person_id;
DELETE FROM reports WHERE person_id=10;

SELECT people.person_id, people.name, reports.content
FROM people INNER JOIN reports ON people.person_id = reports.person_id;

SELECT p.person_id, p.name, r.content
FROM people AS p INNER JOIN reports AS r ON p.person_id = r.person_id;

SELECT p.person_id, p.name, r.content
FROM people p JOIN reports r ON p.person_id = r.person_id;

SELECT p.person_id, p.name, r.content FROM people p JOIN reports r USING (person_id);

SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);

SELECT p.person_id, p.name, r.content FROM people p RIGHT OUTER JOIN reports r USING (person_id);

SELECT * FROM people GROUP BY gender;
SELECT gender FROM people GROUP BY gender;
SELECT DISTINCT gender FROM people;
SELECT gender, COUNT(*) AS people_count FROM people GROUP BY gender;
SELECT gender, MAX(age) AS max_age, MIN(age) AS min_age FROM people GROUP BY gender;
SELECT SUM(age) AS total_age FROM people GROUP BY gender;

