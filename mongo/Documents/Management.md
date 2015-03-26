# ユーザ追加

### adminユーザの作成
mongodbではadminデータベースにユーザを追加することで、adminユーザを作成することができる。
adminユーザはデータベース全体のユーザとなる。

#### 書式
```JavaScript
db.createUser(
{
    user : "hoge",
    pwd: "hogePwd",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
}
)
```

#### 実行
```JavaScript
> use admin
switched to db admin
> db.createUser(
... {
...     user : "hoge",
...     pwd: "hogePwd",
...     roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
... }
... )
Successfully added user: {
	"user" : "hoge",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
```

### auth=trueの場合の接続
#### 書式

```mongo [host/dbname] -u "userName" -p "password"```

### ローカルから接続

```
$ mongo admin -u hoge -p hogePwd
MongoDB shell version: 2.6.8
connecting to: admin
```

### リモートから接続

```
$ mongo 192.168.56.101/admin -u hoge -p hogePwd
MongoDB shell version: 3.0.0
connecting to: 192.168.56.101/admin
```

### 認証できていない場合

```
$ mongo admin
MongoDB shell version: 2.6.8
connecting to: admin
> db.system.users.find()
error: { "$err" : "not authorized for query on admin.system.users", "code" : 13 }
```

### ユーザの確認
```
db.system.users.find()
> db.system.users.find()
{ "_id" : "admin.hoge", "user" : "hoge", "db" : "admin", "credentials" : { "MONGODB-CR" : "260191f3425ac346a26897a9501a0d14" }, "roles" : [ { "role" : "userAdminAnyDatabase", "db" : "admin" } ] }

> show users
{
	"_id" : "admin.hoge",
	"user" : "hoge",
	"db" : "admin",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
```

### ユーザの削除
```
db.dropUser("userName")
> db.dropUser("hoge")
true
```

# OS Xからのサーバへの接続

### mongoのインストール
```
brew update
brew install mongodb
```

### リモートmongoDBに接続
```
$ mongo 192.168.56.101/admin -u hoge -p hogePwd
MongoDB shell version: 3.0.0
connecting to: 192.168.56.101/admin
> 
```
