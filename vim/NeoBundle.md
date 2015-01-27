# vim パッケージ管理ツールNeo Bundleの利用

## インストール
> $ mkdir -p ~/.vim/bundle
> $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

## .vimrcの設定
> " --------------------
> " Neo Bundle Setting Start
> " --------------------
> " Note: Skip initialization for vim-tiny or vim-small.
> if !1 | finish | endif
> 
> if has('vim_starting')      
>   if &compatible
>     set nocompatible               " Be iMproved
>   endif
> 
>   " Required:
>   set runtimepath+=~/.vim/bundle/neobundle.vim/
> endif
> 
> " Required:
> call neobundle#begin(expand('~/.vim/bundle/'))
> 
> " Let NeoBundle manage NeoBundle
> " Required:
> NeoBundleFetch 'Shougo/neobundle.vim'
> 
> " My Bundles here:
> " Refer to |:NeoBundle-examples|.
> " Note: You don't set neobundle setting in .gvimrc!
> 
> call neobundle#end()
> 
> " Required:
> filetype plugin indent on
> 
> " If there are uninstalled bundles found on startup,
> " this will conveniently prompt you to install them.
> NeoBundleCheck
> " --------------------
> " Neo Bundle Setting End
> " --------------------

