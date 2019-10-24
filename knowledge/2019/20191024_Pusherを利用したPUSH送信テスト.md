# Pusher を利用したPUSHのテスト

## 概要
iOSアプリにPUSHをする際、証明書(p12)ファイルを利用してPUSH送信をする場合がある。        
PUSHができるかを確認するためのツールとしてPusherが利用できる。      
[GitHub](https://github.com/noodlewerk/NWPusher)

## インストール
`brew cask install pusher`

## 利用方法
利用方法は簡単。    
- 1. PUSH証明書(p12)ファイルを選択
- 2. Should use sandbox environment のチェックを外す
- 3. デバイストークンをhex文字列で設定
- 4. ペイロードを設定
- 5. Push ボタンを押す