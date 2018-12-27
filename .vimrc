" .vimrc gnus@telia.com
" My .vimrc is a collection from other people's .vimrc
" Special thanks to LukeSmithxyz, mbrochh and http://vimdoc.sourceforge.net/htmldoc/options.html
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"      __   _(_)_ __ ___  _ __ ___
"      \ \ / / | '_ ` _ \| '__/ __|
"   _   \ V /| | | | | | | | | (__
"  |_|   \_/ |_|_| |_| |_|_|  \___|
"

" <leaderkey>
let mapleader = " "

set tabstop=4                                   " Number of spaces that a <Tab> in the file counts for.

set shiftwidth=4                                " Number of spaces to use for each step of (auto)indent.

set expandtab                                   " Use the appropriate number of spaces to insert a <Tab>. Spaces are used in indents with the '>' and '<' commands and when 'autoindent' is on. To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.

set smarttab                                    " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set showcmd                                     " Show (partial) command in status line.

set number relativenumber                       " Show line numbers and relativnumbers

set showmatch                                   " When a bracket is inserted, briefly jump to the matching one. The jump is only done if the match can be seen on the screen. The time to show the match can be set with 'matchtime'.

set hlsearch                                    " When there is a previous search pattern, highlight all its matches.

set incsearch                                   " While typing a search command, show immediately where the so far typed pattern matches.

set ignorecase                                  " Ignore case in search patterns.

set smartcase                                   " Override the 'ignorecase' option if the search pattern contains upper case characters.

set backspace=2                                 " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode. This is a list of items, separated by commas. Each item allows a way to backspace over something.

set autoindent                                  " Copy indent from current line when starting a new line (typing <CR> in Insert mode or when using the "o" or "O" command).

set textwidth=100                               " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.

set formatoptions=c,q,r,t                       " This is a sequence of letters which describes how
                                                " automatic formatting is to be done.
                                                "
                                                " letter    meaning when present in 'formatoptions'
                                                " ------    ---------------------------------------
                                                " c         Auto-wrap comments using textwidth, inserting
                                                "           the current comment leader automatically.
                                                " q         Allow formatting of comments with "gq".
                                                " r         Automatically insert the current comment leader
                                                "           after hitting <Enter> in Insert mode.
                                                " t         Auto-wrap text using textwidth (does not apply
                                                "           to comments)

set ruler                                       " Show the line and column number of the cursor position, separated by a comma.

set background=dark                             " When set to "dark", Vim will try to use colors that look good on a dark background. When set to "light", Vim will try to use colors that look good on a light background. Any other value is illegal.

set mouse=a                                     " Enable the use of the mouse.

set modeline
set clipboard=unnamedplus
set splitbelow splitright                       "Resets the default open split
set wildmenu
set wildmode=list:longest,full                  "tab complitian

let g:vim_markdown_initial_foldlevel=1

map œ :setlocal spell!<CR>
autocmd BufWritePre * %s/\s\+$//e               "Remove trailing whitespace

call matchadd('ColorColumn', '\%81v', 100)      "checks if you write over the 80 character line

call pathogen#infect()
filetype plugin indent on
syntax on

" powerline
set rtp+=/usr/share/powerline/bindings/vim/
" Always show statusline
set laststatus=2
"Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for vim-ecliptic
" cd ~/.vim/bundle
" git clone git://github.com/richsoni/vim-ecliptic.git
let g:ecliptic_prefix = 'c'

" Setting for syntastic
" cd ~/.vim/bundle
" git clone https://github.com/vim-syntastic/syntastic.git
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Setting for vim-clevertab
" cd ~/.vim/bundle/
" git clone https://github.com/neitanod/vim-clevertab.git

inoremap <silent><tab> <c-r>=CleverTab#Complete('start')<cr>
                      \<c-r>=CleverTab#Complete('tab')<cr>
                      \<c-r>=CleverTab#Complete('ultisnips')<cr>
                      \<c-r>=CleverTab#Complete('keyword')<cr>
                      \<c-r>=CleverTab#Complete('neocomplete')<cr>
                      \<c-r>=CleverTab#Complete('omni')<cr>
                      \<c-r>=CleverTab#Complete('stop')<cr>
inoremap <silent><s-tab> <c-r>=CleverTab#Complete('prev')<cr>
