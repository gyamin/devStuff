## リモートリポジトリの追加
```
$ git clone git@ghe.hoge.com:foo/aaa.git  
$ git remote add upstream git@ghe.hoge.com:aaa/bbb.git  
```

## リモートリポジトリ(upstream)のブランチをローカルにマージ

### リモートをfetchしブランチの一覧を取得
```
$ git fetch upstream
From ghe.hoge.com:AAA  
 /* [new branch]      feature/Questionnaire -> upstream/feature/Questionnaire  
```

### 取得したいブランチを確認
```
$ git branch -a  
...  
  remotes/upstream/feature/Questionnaire  
```

### git mergeを利用してローカルのブランチにマージ
```
$ git merge upstream/feature/Questionnaire  
Auto-merging xxxxxxxx/yyyyyyyyy/web/css/style.css  
Merge made by the 'recursive' strategy.  
 xxxxxxxx/yyyyyyyyy/web/xxxxxxxx-config.xml.production    |   4 +-  
 xxxxxxxx/yyyyyyyyy/web/contents/js/detail.js             |  33 ++-  
 xxxxxxxx/yyyyyyyyy/web/coupons/js/detail.js              |   6 +-  
.....  
```

### マージできたらoriginにpush
```
$ git push origin issue/questionnaire  
Counting objects: 466, done.  
Delta compression using up to 4 threads.  
Compressing objects: 100% (185/185), done.  
Writing objects: 100% (285/285), 63.76 KiB | 0 bytes/s, done.  
Total 285 (delta 182), reused 119 (delta 83)  
To git@ghe.hoge.com:foo/XYZXYZ.git  
   b119c92..25bbc80  issue/questionnaire -> issue/questionnaire  
```

## ローカルファイルのコミットが出来ていないため、エラーとなる場合の対処
git mergeを実行する際に、ローカルブランチで編集中のファイルがコミットされていないとエラーとなる。  
```
$ git merge upstream/feature/Questionnaire  
error: Your local changes to the following files would be overwritten by merge:  
	xxxxxxxx/yyyyyyyyy/web/js/globals.js  
	xxxxxxxx/yyyyyyyyy/web/js/top.js  
Please, commit your changes or stash them before you can merge.  
Aborting  
```
この場合、編集中のファイルをコミットしたくない場合で、かつマージもしたい場合は、stashコマンドを利用して、変更を一時的に保存する事が出来る。

```
$ git stash  
Saved working directory and index state WIP on issue/questionnaire: b119c92 #1250 対応。
HEAD is now at b119c92 #1250 対応。 仕様となる機能を実装。デザイン面は修正必要。  
  
$ git stash list  
stash@{0}: WIP on issue/questionnaire: b119c92 #1250 対応。 仕様となる機能を実装。デザイン面は修正必要。  
stash@{1}: On issue/questionnaire: 0220_1215  
stash@{2}: On phase2.0: 20150202_1  
```
## ローカルにリモートブランチから新しいブランチを作成する
```
$ git checkout -b feature/zzzzz upstream/feature/zzzzz  
Branch feature/zzzzz set up to track remote branch feature/zzzzz from upstream.  
Switched to a new branch 'feature/zzzzz'  
  
$ git branch  
/* feature/zzzzz  
  initial_20150219  
```

## サーバ(origin)へpush
```
$ git push origin feature/zzzzz   
Counting objects: 933, done.  
Delta compression using up to 4 threads.  
Compressing objects: 100% (493/493), done.  
Writing objects: 100% (784/784), 210.67 KiB | 0 bytes/s, done.  
Total 784 (delta 498), reused 441 (delta 238)  
To git@ghe.hoge.com:foo/XYZXYZ.git  
 * [new branch]      feature/zzzzz -> feature/zzzzz  
```

## ローカルの変更を破棄する

### 個別にファイルを指定し、変更を破棄
```$ git checkout 対象ファイル```
### 全てのファイルの変更を破棄
```$ git checkout .```

## GitHubのブランチを削除する
```
git push origin :ブランチ名  
$ git push origin :#1077  
To git@ghe.hoge.com:foo/XYZXYZ.git  
 /- [deleted]         #1077  
```

## localリポジトリでignoreファイルを設定する
.gitignoreはリポジトリ全体のignoreファイルを制御するファイルとなるが、ローカル環境は別のignoreを行いたい場合、以下のファイルに設定を追加する。
.git/info/exclude

## diff

### 編集中のファイルとリポジトリの差異
```
$ git diff
```

### ステージに移動したファイルをリポジトリの差異
```
$ git diff --cached
```

