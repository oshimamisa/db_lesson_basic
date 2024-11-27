/*Q1*/
CREATE TABLE departments (
  department_id INT unsigned PRIMARY KEY NOT NULL auto_increment,
  name VARCHAR(20) NOT NULL,
  create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
  /*レコード名を間違えたので変更*/
  ALTER TABLE departments RENAME COLUMN create_at to created_at;
  ALTER TABLE departments RENAME COLUMN update_at to updated_at;

/*Q2*/
  ALTER TABLE people ADD department_id INT unsigned comment 'emailの後ろに追加する';

  /*INT型に(10)という設定が加わっていたので追加*/
  ALTER TABLE people MODIFY department_id INT(10);
  /*❔→Query OKの表示が出たが変わらなかった、ついでにpearson_idもおなじ*/

/*Q3*/
  /*ALTER TABLE departments ADD COLUMN 営業, 開発, 経理, 人事, 情報システム;*/
  /*INSERT INTO departments name VALUES ('営業', '開発', '経理', '人事', '情報システム');*/

  INSERT INTO departments (name) VALUES ('営業')
  insert into user (id, name) values (2, 'Suzuki');

  INSERT INTO departments ()
    /*🔴設定する値の形式があっているか確認すること→今回はすでに値が数字で決まっているのに
    営業、人事などのテキストで入力していた🔴*/
    ❌UPDATE people SET department_id ='営業' WHERE person_id=1;
    ⭕️UPDATE people SET department_id =1 WHERE person_id=1;

  /*規定数に足らないのでレコードを増やす*/
    INSERT INTO people (name,email,age,gender)
    VALUES
    ('樋口かえで', 'higuchi@gizumo.com', 24, 2);

  /*レコードを増やした。登録アドレスを間違えたので修正*/
  /*🔴テキストが入る時は’’忘れずに🔴*/
    UPDATE people SET email = 'higuchi@gizumo.jp' WHERE person_id=11;

  /*reportsの追加*/
  /*日報を10件作成する*/
  INSERT INTO reports (person_id, content)
  VALUES
  (1, '攻略動画はためになると思った'),
  (2, 'エスカレーターで飲み物をこぼしたら掃除が大変そうだと思った'),
  (3, 'PCのクリアケースを買ってステッカーで埋めてみたい'),
  (5, '私の好きなお菓子は雪の宿だそうです'),
  (6, '気温が上がったり下がったりで毎日大変だと思いました'),
  (7, '納豆が大好きだそうで、中粒派だとおっしゃっていました'),
  (8, 'ルイボスティーはちょっと薬みたいな味がして美味しい'),
  (9, '風間先生の個展に行った、謎解き...楽しい！'),
  (10, 'たくさんお話した、烏滸がましくも感覚が似ていて話していて楽しかった'),
  (11, 'はおうーろん、おいしい！')
  ;

  /*以前やったカリキュラムでperson_idのない日報があったので修正する*/
  UPDATE reports SET person_id = 11 WHERE report_id = 12;

/*Q4*/
SELECT * FROM people;
  /*❔peopleの追加にミスがあったので、以前追加のメンバーのdepartment_idを初期値のNULLにする(?)
    🔴指定の値の削除の仕方がわからない🔴*/
  UPDATE people SET department_id = '' WHERE person_id = 1;

  /*とりあえず10人追加する*/
    INSERT INTO people (name,email,age,gender)
    VALUES
    ('小野田さかみち', 'onoda@gizumo.com', 18, 1),
    ('四ノ宮みづき', 'shinomiya@gizumo.com', 22, 1),
    ('碧衣さくら', 'aoi@gizumo.com', 16, 2),
    ('葛葉かなえ', 'kuzuha@gizumo.com', 22, 1),
    ('宇佐美しょうこ', 'usami@gizumo.com', 23, 2),
    ('槙ふみか', 'maki@gizumo.com', 28, 2),
    ('持田ひなみ', 'mochida@gizumo.com', 25, 2),
    ('金江じゅん', 'kanae@gizumo.com', 26, 1),
    ('高峰かえで', 'takamine@gizumo.com', 29, 1),
    ('星導りひと', 'hoshirube@gizumo.com', 23, 1);

    /*絞り込みと割り振り*/
    /*営業 25歳以上の女性*/
    UPDATE people SET department_id = 1 WHERE age >= 25 AND gender = 2;
    /*開発 25歳未満の女性*/
    UPDATE people SET department_id = 2 WHERE age < 25 AND gender = 2;
    /*経理 23歳以下の男性*/
    UPDATE people SET department_id = 3 WHERE age <= 23 AND gender = 1;
    /*人事 23歳以上30歳以下の男性*/
    UPDATE people SET department_id = 4 WHERE age >= 23 AND age <=30 AND gender = 1;
    /*情報システム 30歳より上の男子(30歳は含まれない)*/

/*Q5 年齢の降順で男性の名前と年齢を取得してください。*/
/*SELECT * FROM people ORDER BY age DESC;
SELECT * FROM people WHERE gender = 1;
SELECT * FROM people WHERE gender = 1 AND ORDER BY age DESC;
SELECT * FROM people ORDER BY age DESC AND gender = 1;*/

⭕️SELECT * FROM people WHERE gender = 1
  ORDER BY age DESC;

/*Q6 テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。*/
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

🟡回答🟡peopleテーブルのname,email,ageカラムから、department_idが1のデータを抽出し、created_atの時間の降順で並べる。

/*Q7 20代の女性と40代の男性の名前一覧を取得してください。*/
SELECT * FROM people WHERE gender = 2 AND age >= 20 AND age < 30 OR gender = 1 AND age >= 30 AND < 40;
SELECT * FROM people WHERE gender = 2 AND age = 20 OR gender = 1 AND age = 30;

SELECT * FROM people WHERE gender = 2 AND age BETWEEN 20 AND 29 OR gender = 1 AND age BETWEEN 30 AND 39;

/*Q8 営業部に所属する人だけを年齢の昇順で取得してください。*/
SELECT * FROM people WHERE department_id = 1
ORDER BY age ASC;

❔❔❔/*Q9 開発部に所属している女性の平均年齢を取得してください。*/
ALTER TABLE people ADD average_age tinyint unsigned NOT NULL;
SELECT AVG age FROM people WHERE gender =2 AND department_id = 2;

/*Q10 名前と部署名とその人が提出した日報の内容を同時に取得してください。（日報を提出していない人は含めない）*/
SELECT people.name, departments.name, reports.content
FROM people INNER JOIN reports ON people.person_id = reports.person_id AND people.department_id = departments.department_id;

/*Q11 日報を一つも提出していない人の名前一覧を取得してください。*/
  /*person_idでpeopleとreportsを紐づけると日報を提出した人の表が抽出できる？*/
    ▷ mysql> SELECT * FROM people INNER JOIN reports ON people.person_id = reports.person_id;
      SELECT * FROM reports WHERE content = NULL;

  /*言語化 テーブル結合＿内部結合*/
  mysql> SELECT people.person_id, people.name, reports.content
    -> FROM people INNER JOIN reports ON people.person_id = reports.person_id;
    /*peopleのperson_idとreportsのperson_idが一緒の
    peopleとreportsカラムのpeople.person_id, people.name, reports.contentを一つの表として(結合して)表示*/

    日報を一つも提出していない ▷ contentの登録がない人
    🟡どう表すのか🟡content = NULL?
    出したいデータ ▷ 名前 (日報提出をしていない人に限る)

    SELECT * people.name FROM people  INNER JOIN reports ON people.person_id = report

    🟠内部結合🟠
    主キー(primary KEYを基準に結合される)
    データが入っているものが抽出される
    NULLの値が入っている場合にそれらは省かれて出てくる

    🟠外部結合🟠
    データが入っていないものにはNULLという値が表示される
    対応しない値を出したいとき、データがないものを抽出したいとき

    🟡content = NULLを表示🟡
    ▷ 言語化してみる 例: SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);
                      ▷ p.person_id, p.name, r.contentのデータを表に出力。
                      ▷ left→people(指定したテーブル)  right→reports(結合したいテーブル)
                      peopleテーブルにreportsテーブルを結合します。条件はUSING parson_idで、
                      表示するデータはp.person_id, p.name, r.contentです。

    SELECT p.person_id, p.name, r.content FROM people LEFT OUTER JOIN reports r USING ()

      SELECT p.name, r.content FROM people LEFT OUTER JOIN reports ON r.content = NULL p.person_id = r.person_id;
      SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (content);

    SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);
    /*↑上の内容だと日報がNULL以外の人のデータも出てきてしまう*/
    🟡→ person_idで紐付けている？最後の(person_id)🟡
    完全にNULLの値だけ出すには？

    SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);
    /*正しく抽出できているかの確認用 person_idを使ってp.person_id, p.name, r.contentのデータを抽出します。peopleにreportsテーブルを結合させます。*/

    /*上のやつだと日報を提出したことのある人のデータまで出てきてしまうので、content = NULLで絞り込みをかける 🟠WHEREを使用する※順番を意識する*/
    ※ 本当にNULLの人のみのデータを抽出できているかを確認するため、一度自分用に3つのカラムで抽出をする。
    ⭕️SELECT p.name FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE r.content IS NULL;

    🟠NULLの絞り込みに注意 IS NULLの形を覚える🟠


/* プルリクエストで提出 復習メモ */


