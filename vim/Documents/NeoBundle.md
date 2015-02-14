# プラグイン管理 NeoBundleの導入

## NeoBundleのインストール
>$ mkdir -p ~/.vim/bundle
>$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## .vimrcのセットアップ
.vimrcに以下の設定を追加する
ihttps://github.com/Shougo/neobundle.vim
>" =====================================
>" Neo Bundle Setting Start.
>" =====================================
>" Note: Skip initialization for vim-tiny or vim-small.
>if !1 | finish | endif
>
>if has('vim_starting')
>  if &compatible
>    set nocompatible               " Be iMproved
>  endif
>
>  " Required:
>  set runtimepath+=~/.vim/bundle/neobundle.vim/
>endif
>
>" Required:
>call neobundle#begin(expand('~/.vim/bundle/'))
>
>" Let NeoBundle manage NeoBundle
>" Required:
>NeoBundleFetch 'Shougo/neobundle.vim'
>
>" My Bundles here:
>" Refer to |:NeoBundle-examples|.
>" Note: You don't set neobundle setting in .gvimrc!
>
>call neobundle#end()
>
>" Required:
>filetype plugin indent on
>
>" If there are uninstalled bundles found on startup,
>" this will conveniently prompt you to install them.
>NeoBundleCheck
>" =====================================
>" Neo Bundle Setting End.
>" =====================================

## 利用するプラグインを設定
NeoBundle [プラグイン名]の設定を、以下のように追加する。
>" My Bundles here:
>" Refer to |:NeoBundle-examples|.
>" Note: You don't set neobundle setting in .gvimrc!
>NeoBundle 'kannokanno/previm'

## プラグインのインストール

### 方法1
vimを起動すると、以下のようにbundleのインストールが確認される。
ここでyesを選択。
>Not installed bundles:  ['previm']
>Install bundles now?
>(y)es, [N]o: 

### 方法2
vimを起動し、以下のコマンドを実行する。
>:NeoBundleInstall
>[neobundle/install] Update done: (2015/01/28 11:20:05)

## プレビューの起動
markdownファイルをvimで開き（編集中も）、:PrevimOpenを実行する。

※E492: Not an editor command: PrevimOpenとエラーが出る場合
拡張子が.mdのファイルはデフォルトではmarkdownと認識されない。
.vimrcに以下の設定を追加し、.mdファイルもmarkdownとして認識させる事で、PrevimOpenが利用できる。
>augroup PrevimSettings                                  " previmでプレビュー対象のmarkdownファイルの拡張子を設定
>    autocmd!
>    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
>augroup END

※open-browser.vimがインストールされている場合、PrevimOpenのみでプレビューを起動可能。
open-browser.vimを利用しない場合は、let g:previm_open_cmd = 'open -a Firefox' などの設定を.vimrcに設定する必要がある。




