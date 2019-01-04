"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _  _    __     ___                                             "
"  _| || |_  \ \   / (_)_ __ ___  _ __ ___  __/\__     __/\__       "
" |_  ..  _|  \ \ / /| | '_ ` _ \| '__/ __| \    /_____\    /       "
" |_      _|  _\ V / | | | | | | | | | (__  /_  _\_____/_  _\       "
"   |_||_|   (_)\_/  |_|_| |_| |_|_|  \___|   \/         \/         "
"                                                                   "
"                            _  _                                   "
"   __ _ _ __  _   _ ___   _| || |_                                 "
"  / _` | '_ \| | | / __| |_  ..  _|                                "
" | (_| | | | | |_| \__ \ |_      _|                                "
"  \__, |_| |_|\__,_|___/   |_||_|                                  "
"  |___/                                                            "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 		             	" be iMproved, required
filetype off                 			" required

set rtp+=~/.vim/bundle/Vundle.vim 		" set the runtime path to include Vundle and initialize
call vundle#begin()

set number relativenumber                       " Show line numbers and relativnumbers
set background=dark                             " When set to "dark", Vim will try to use colors that look good on a dark background.
						" When set to "light", Vim will try to use colors that look good on a light background. Any other value is illegal.

set mouse=a                                     " Enable the use of the mouse.
let g:vim_markdown_initial_foldlevel=1
autocmd BufWritePre * %s/\s\+$//e               "Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      "checks if you write over the 80 character line


:autocmd InsertEnter * set nocul                " cursor in insertmode
:autocmd InsertLeave * set cul                  " cursor in normalmode


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Gabirel/molokai'
Plugin 'plasticboy/vim-markdown'

" set the runtime path to include Vundle and initialize
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Setup davidhalter/jedi-vim
:set omnifunc=jedi#completions
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
