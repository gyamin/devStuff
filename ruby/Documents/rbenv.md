# rbenv環境の構築

## はじめに
ローカル環境で複数のrubyバージョン、gem環境を管理する為のツールとしてrbenvを導入する手順を記載する。rbenvを導入すると、複数のrubyのバージョンやgem環境を管理する事ができ、プロジェクトに応じて切り替える事ができるようになる。

## 前提条件
OSがOSXであること。  
  
## rbenvのセットアップ  
### インストール  
homebrewでrbenvをインストールする。  
※その他のインストール方法は、https://github.com/sstephenson/rbenv#installationを参照。  
>$ brew update    
>$ brew install rbenv ruby-build    
>==> Downloading https://github.com/sstephenson/rbenv/archive/v0.4.0.tar.gz    
  
### .bash_profileの設定  
rbenvが実行できるよう、rbenvを利用するユーザの.bash_profileに以下の設定を行う。  
>eval "$(rbenv init -)"  
  
### rbenvの動作確認  
.bash_profileを読み込みコマンドが実行できるか確認。rbenv -vでバージョンが表示されれば、動作している。  
>$ source .bash_profile    
>$ rbenv -v    
>rbenv 0.4.0    
  
## rbenvで複数のrubyを管理する  
### rbenvでインストール可能なrubyのリストを取得する  
>$ rbenv install -l  
>Available versions:  
>  1.8.6-p383  
>  1.8.6-p420  
>  1.8.7-p249  
>  1.8.7-p302  
>  1.8.7-p334  
>  1.8.7-p352  
>  1.8.7-p357  
>  1.8.7-p358  
>  1.8.7-p370  
>  1.8.7-p371  
>  1.8.7-p374  

### 特定のrubyのインストール
rbenv installでインストールしたいrubyをインストールする。
>$ rbenv install 2.0.0-p353  
>Downloading ruby-2.0.0-p353.tar.gz...  
>-> http://dqw8nmjcqpjn7.cloudfront.net/78282433fb697dd3613613ff55d734c1  
>Installing ruby-2.0.0-p353…  

rbenv versionsでrbenvで管理されているrubyの一覧を表示。
>$ rbenv versions  
>× system (set by /Users/User/.rbenv/version)  
>  2.0.0-p353  

## gemsetのセットアップ
gemsetはgemを複数管理する為のツール。複数の開発プロジェクトでgemが異なる場合に非常に便利。

### インストール
>$ brew install rbenv-gemset  
>==> Downloading https://github.com/jf/rbenv-gemset/archive/v0.5.4.tar.gz  


## rbenv/gemsetを利用したプロジェクト環境
rbenvではディレクトリ単位で利用するruby/gemsetを設定することができる。この機能を利用しプロジェクト固有の環境を作成する方法を記載する。

### プロジェクトディレクトリを作成
>$ mkdir testApp

### プロジェクトディレクトリのrubyを設定する
設定可能なrubyバージョンを表示  
**コマンド: rbenv versions**
>$ rbenv versions
>× system (set by /Users/User/.rbenv/version)  
>  2.1.4  
>  jruby-1.7.10  

ディレクトリで利用するrubyを設定  
**コマンド: rbenv local rubyバージョン**
>$ cd testApp/  
>$ rbenv local 2.1.4  

ディレクトリのrubyバージョンを確認  
>$ rbenv versions  
>  system  
>× 2.1.4 (set by /Users/User/Develop/Work/testApp/.ruby-version)   

testAppディレクトリ内の.ruby-versionファイルでruby-2.1.4が利用されている事がわかる。

### プロジェクトディレクトリのgemsetを設定する
プロジェクトディレクトリ内に、.rbenv-gemsetsファイルを作成し、gemsがインストールされるディレクトリを設定する。
プロジェクト毎にgemsを分けたいので、.getsを設定するのが定石。
>$ echo ".gems" > .rbenv-gemsets

gemsのディレクトリを確認  
**コマンド:rbenv gemset active**
>$ rbenv gemset active  
>.gems global  

testApp内で利用されるgemsはtestApp/.gemsディレクトリ内のgemsに設定されていることがわかる。


## プロジェクト環境の作成例
### サンプルプロジェクトの概要

| 項目              | 値            |
|---                |---            |
| ディレクトリ      | testApp       |
| rubyバージョン    | 2.1.4         |
| rails             | 4.1.8         |
| pry               | 最新          |

### 環境構築

#### rubyのインストール
>$ rbenv install -l  
>Available versions:  
>...  
>  2.1.2  
>  2.1.3  
>  2.1.4  
>...  
>$ rbenv install 2.1.4  
>$ rbenv versions  
>× system (set by /Users/User/.rbenv/version)  
>  2.1.4  
  
#### プロジェクトディレクトリ設定
>$ mkdir testApp  
>$ cd testApp/  
>$ rbenv local 2.1.4  
>$ rbenv versions  
>  system  
>× 2.1.4 (set by /Users/User/Develop/Work/testApp/.ruby-version)  
>$ echo ".gems" > .rbenv-gemsets  
>$ rbenv gemset active  
>.gems global  
  
#### bundlerを利用したgem管理

**bundlerをインストール**
>$ rbenv exec gem install bundler  
>$ rbenv rehash  
>$ rbenv exec bundle init  
>Writing new Gemfile to /Users/User/Develop/Work/testApp/Gemfile  

**利用するgemをGemfileに設定**  
>$ vim Gemfile   
>¥# A sample Gemfile  
>source "https://rubygems.org"  
>  
>¥# gem "rails"  
>gem "rails", "4.1.8"  
>gem "pry"  
  
**bundle installでGemfileに設定したgemをインストール**  
>$ rbenv exec bundle install  
>...  
>Installing rake 10.4.2  
>Installing i18n 0.7.0  
>...  
>$ rbenv exec bundle list  
>Gems included by the bundle:  
>  * actionmailer (4.1.8)  
>  * actionpack (4.1.8)  
>  * actionview (4.1.8)  
>...  

## 参考
http://qiita.com/egopro/items/aba12261c053eecd6d19

