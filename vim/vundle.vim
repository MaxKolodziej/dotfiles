 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/Vundle.vim

 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 "Bundle 'vim-scripts/lastpos.vim'
 Bundle 'https://github.com/itchyny/lightline.vim.git'
 Bundle 'scrooloose/nerdtree'
 Bundle 'tpope/vim-rails'
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-surround'
 Bundle 'tpope/vim-abolish'
 Bundle 'kopischke/vim-fetch'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'vim-scripts/YankRing.vim'
 Bundle 'tpope/vim-eunuch'
 "Bundle 'bkad/CamelCaseMotion'
 "Bundle 'Shougo/neocomplcache.vim'
 Bundle 'slim-template/vim-slim'
 Bundle 'szw/vim-ctrlspace'
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'ludovicchabant/vim-gutentags'
 Bundle 'kristijanhusak/vim-js-file-import'
 Bundle 'dense-analysis/ale'
 Bundle 'scrooloose/vim-colon-therapy'

 Bundle "xolox/vim-misc"
 " Bundle "xolox/vim-notes"
 " Bundle 'vim-scripts/Txtfmt-The-Vim-Highlighter'
 " Bundle 'airblade/vim-gitgutter'
 Bundle 'Tumbler/highlightMarks'

 Bundle 'kien/ctrlp.vim'
 Bundle 'othree/yajs.vim'
 Bundle 'mxw/vim-jsx'
 
 Bundle 'kchmck/vim-coffee-script'

 Bundle 'git@github.com:vim-scripts/cscope.vim.git'
 " Bundle 'Shougo/neocomplcache.vim'

 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle 'honza/vim-snippets'
 Bundle "sirver/ultisnips"

 " vim-scripts repos
 "Bundle 'L9'
 Bundle 'godlygeek/tabular'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 " ...
 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

