## 構築
事前にマイグレーションでDBを作成しておく

データベース設定をMySQLに変更する。
jdbc:mysql://localhost:3306/etude_for_rails_xtea_development
root
password

接続先変更後にモジュール一括作成を実行する

システム管理ユーザーを登録する

|IDUSER	| TXNAME         | TXPASSWORD                       | DTVALID    | DTEXPIRE   | TXEMAIL | TXMENUS | NREMPLOYEE | UPDCOUNTER |
|:------|-------:        |:----------:                      |:-----------:|:---------:|:-------:|:-------:|:----------:|:----------:|
| 00000	| admin          | f1b708bba17f1ce948dc979f4d7092bc	| 2000/01/01 | 9999/12/31 |         | ALL     |            |            |

`/etc/mysql/mysql.conf.d/charset.conf`に以下を追加してサービスを再起動する
```text
[mysqld]
character-set-server=utf8
[client]
default-character-set=sjis
```
```sql
mysql> show variables like "chara%";
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | sjis                       |
| character_set_connection | sjis                       |
| character_set_database   | utf8                       |
| character_set_filesystem | binary                     |
| character_set_results    | sjis                       |
| character_set_server     | utf8                       |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.00 sec)
```

## 配置
schema.rbの作成
```bash
rails db:schema:dump
rails db:structure:dump
```

マイグレーションファイルの作成
```bash
rails g migration create_tables
```
`schema.rb`の内容をコピペする
```bash
rails db:migrate
```

モデルの作成
```bash
rails g model department --migration false
rails g model department_hierarchy --migration false
rails g model employee --migration false
rails g model employee_department --migration false
rails g model customer --migration false
rails g model product --migration false
rails g model order --migration false
rails g model order_detail --migration false
```

## 運用

```bash
nkf -w --overwrite CreateTables20180331161501.sql
```

## 参照
+ [Rails - schema.rb（既存DBを使ったアプリ作成）](https://qiita.com/edo1z/items/a0bf22b294406f00ec7c)
+ [rails 既存DBを使ってrailsしてみた。](http://hmu29.hatenablog.com/entry/2014/02/14/001513)
+ [Composite Primary Keys for ActiveRecords](https://github.com/composite-primary-keys/composite_primary_keys)
+ [Docker Composeを使ってLAMP環境を立ち上げる](https://qiita.com/naga3/items/d1a6e8bbd0799159042e)
+ [mysqlで文字コードをutf8にセットする](https://qiita.com/YusukeHigaki/items/2cab311d2a559a543e3a)
+ [文字コードの設定](https://www.dbonline.jp/mysql/myini/index3.html)
+ [最速で日本語環境のMySQL Dockerコンテナを建てる方法](https://qiita.com/muff1225/items/48e0753e7b745ec3ecbd)
+ [MYSQL 文字コード確認](https://qiita.com/yukiyoshimura/items/d44a98021608c8f8a52a)
+ [Docker volumeの削除](https://qiita.com/Ikumi/items/b319a12d7e2c9f7b904d)
+ [事前にデータ投入をした MySQL Docker イメージを作る場合は /docker-entrypoint-initdb.d を活用すると便利](http://kakakakakku.hatenablog.com/entry/2017/11/08/193031)
+ [[Vagrant][MySQL]Vagrant上のMySQLにホストOSから接続する(Portforward編)](http://d.hatena.ne.jp/takeR/20150914/1442221298)

