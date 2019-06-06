# ドメイン間のPOSTデータ受け渡し検証

## 概要
http://a.co.jp/test.html にGETパラメータでパラメータを渡すと、
test.htmlがformにGETパラメータをセットしhttp://b.co.jp/testに
POSTでSUBMIT。b.co.jp側でデータが取得できるかを確認する。

## セットアップ
```
$ cd lang/node/20190606/server
$ nodenv install 12.4.0
$ npm install
```