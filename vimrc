set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/vim-slumlord'
Plugin 'aklt/plantuml-syntax'
"""""""" Python """""""""""""
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on
"""""""""""""""""""""""""""""

function CPPQuotesToBraces()
    let save_cursor = getpos(".")
    :s/"/</
    :s/.*\zs"/>/
    call setpos('.', save_cursor)
endfunction

function CPPBracesToQuotes()
    let save_cursor = getpos(".")
    :s/</"/
    :s/>/"/
    call setpos('.', save_cursor)
endfunction

let @l='call CPPQuotesToBraces()'
let @g='call CPPBracesToQuotes()'

"  let @l=':s/"/</'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
set clipboard=unnamedplus

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" colorscheme Chasing_Logic
colorscheme ron
syntax on
set number
set tabstop=2
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback
