"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _	_    __     ___                                             "
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
let mapleader = " "

set rtp+=~/.vim/bundle/Vundle.vim 		" set the runtime path to include Vundle and initialize
call vundle#begin()

set number relativenumber                       " Show line numbers and relativnumbers
set background=dark

set mouse=a                                     " Enable the use of the mouse.

autocmd BufWritePre * %s/\s\+$//e               " Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      " checks if you write over the 80 character line


autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode

" Spellchecking
set complete+=kspell
map <leader>s :setlocal spell! spelllang=sv_se<CR>
map <leader>e :setlocal spell! spelllang=en_us<CR>

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'edkolev/tmuxline.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'python-mode/python-mode'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rust-lang/rust.vim'

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

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
" fugitive
autocmd QuickFixCmdPost *grep* cwindow


" Youcompleteme
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Flake8
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show

" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

 " Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_initial_foldlevel=1

" Python-mode
let g:pymode_python = 'python3'



" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
