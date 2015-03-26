
## データベースのユーザを作成
`use データベース名`でデータベースを指定後、createUserコマンドでユーザを作成。`db:"データベース名"`でデータベースを指定すると、そのデータベースで有効なユーザが作成できる。

+ 一般ユーザ作成書式
```
db.createUser(
{
    user: 'ユーザ名',
    pwd: 'パスワード',
    roles: [
        { role: "ロール", db: "コレクション名"}
     ]
}
)
```

+ ユーザ作成例
```
> use tutorial
switched to db tutorial
> db.createUser(
... {
...     user: 'test',
...     pwd: 'testPwd',
...     roles: [
...         { role: "readWrite", db: "tutorial"} 
...      ]
... }
... )
Successfully added user: {
    "user" : "test",
    "roles" : [
        {
            "role" : "readWrite",
            "db" : "tutorial"
        }
    ]
}
```

+ 接続
```
$ mongo loc_dev1/tutorial -u test -p testPwd
MongoDB shell version: 3.0.0
connecting to: loc_dev1/tutorial
```

## 挿入とクエリ

+ 書式  
`db.users.insert({ username: "jones" })`

+ 実行例
```
> db.users.insert({ username: "jones" })
WriteResult({ "nInserted" : 1 })
```

+ insertが実行されると自動的にcollectionも作成される。
```
> show collections
system.indexes
users
```

+ クエリ    
db.collection.find()でcollectionのデータを検索できる。
```
> db.users.find()
{ "_id" : ObjectId("550fb5b93fb0ae1ce2a9370d"), "username" : "jones" }
```

+ クエリセレクタ    
find()にセレクタを指定することで、条件を指定したクエリを実行できる。
```
> db.users.find({username: "jones"})
{ "_id" : ObjectId("550fb5b93fb0ae1ce2a9370d"), "username" : "jones" }
```

## 更新
+ 更新を行うには、少なくとも２個の引数が必要。１個目の引数は更新対象のドキュメントを指定するもの。
```
> db.users.update({username: "smith"}, {$set: {country: "Canada"}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({username: "smith"})
{ "_id" : ObjectId("550fb99a3fb0ae1ce2a9370e"), "username" : "smith", "country" : "Canada" }
```
```
> db.users.update({username: "smith"},
... { $set: 
...     {favorites:
...         {
...             cities: ["Chicago", "Cheyenne"],
...             movies: ["Casablanca", "The Sting"]
...         }
...     }
... }
... )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({username: "smith"})
{ "_id" : ObjectId("550fb99a3fb0ae1ce2a9370e"), "username" : "smith", "favorites" : { "cities" : [ "Chicago", "Cheyenne" ], "movies" : [ "Casablanca", "The Sting" ] } }
```

+ 項目の削除は、$unsetを利用。
```
> db.users.update({username: "smith"}, {$unset: {country: 1}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find({username: "smith"})
{ "_id" : ObjectId("550fb99a3fb0ae1ce2a9370e"), "username" : "smith" }
```


+ より複雑なドキュメントの検索  
ドットで区切ることでより深い階層を指定したクエリを実行できる。
```
> db.users.find({"favorites.movies": "Casablanca"})
{ "_id" : ObjectId("550fb99a3fb0ae1ce2a9370e"), "username" : "smith", "favorites" : { "cities" : [ "Chicago", "Cheyenne" ], "movies" : [ "Casablanca", "The Sting" ] } }
{ "_id" : ObjectId("550fb5b93fb0ae1ce2a9370d"), "username" : "jones", "favorites" : { "movies" : [ "Casablanca", "Rocky" ] } }
```

+ ドキュメントへのデータ追加    
上記のfavorites.moviesに好きな映画を追加する場合。$setも利用できるが、$setだと配列を再度設定する必要がある。
この場合は、$push、$addToSetを利用するのがいい。
```
> db.users.update({"favorites.movies": "Casablanca"}, {$addToSet: {"favorites.movies": "The Maltese Falcon"}}, false, true)
WriteResult({ "nMatched" : 2, "nUpserted" : 0, "nModified" : 2 })
> db.users.find()
{ "_id" : ObjectId("550fb99a3fb0ae1ce2a9370e"), "username" : "smith", "favorites" : { "cities" : [ "Chicago", "Cheyenne" ], "movies" : [ "Casablanca", "The Sting", "The Maltese Falcon" ] } }
{ "_id" : ObjectId("550fb5b93fb0ae1ce2a9370d"), "username" : "jones", "favorites" : { "movies" : [ "Casablanca", "Rocky", "The Maltese Falcon" ] } }
```

## データの削除
データの削除には、remove()を利用する。

+ すべてのデータを削除
```
> db.users.remove()
```

+ 削除対象を指定
```
> db.users.remove({"favorites.cities": "Cheyenne"})
```

+ 補足
removeではコレクションは削除されない。sqlのdelete や truncate tableと同様。コレクションを削除するにはdropを利用する。




