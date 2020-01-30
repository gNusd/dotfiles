"/***************************************************/
"/*                            _                    */
"/*   __ _ _ __  _   _ ___  __| | __/\__     __/\__ */
"/*  / _` | '_ \| | | / __|/ _` | \    /_____\    / */
"/* | (_| | | | | |_| \__ \ (_| | /_  _\_____/_  _\ */
"/*  \__, |_| |_|\__,_|___/\__,_|   \/         \/   */
"/*  |___/                                          */
"/*  _       _ _         _                          */
"/* (_)_ __ (_) |___   _(_)_ __ ___                 */
"/* | | '_ \| | __\ \ / / | '_ ` _ \                */
"/* | | | | | | |_ \ V /| | | | | | |               */
"/* |_|_| |_|_|\__(_)_/ |_|_| |_| |_|               */
"/*                                                 */
"/***************************************************/

set nocompatible 		             	" be iMproved, required
let mapleader = " "

map <ctrl>h <ctrl>w h
map <ctrl>l <ctrl>w l
map <ctrl>j <ctrl>w j
map <ctrl>k <ctrl>w k

set encoding=UTF-8
set shell=bash\ -l

set number relativenumber                       " Show line numbers and relativnumbers

set tabstop=4
set mouse=                                     " Disable mouse. Enable the use of the mouse mouse=a.
set splitbelow splitright 					   " adds new window split to the right annd below

autocmd BufWritePre * %s/\s\+$//e               " Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      " checks if you write over the 80 character line

" mode indicators
autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode

" block arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

map <leader>j :bprevious!<cr>
map <leader>k :bnext!<cr>
map <leader>w :ene<CR>:bw #<CR>

" Spell checking
set complete+=kspell,w,b,u,U
map <leader>s :setlocal spell! spelllang=sv spellfile=~/.config/nvim/spell/sv.utf-8.add<CR>
map <leader>e :setlocal spell! spelllang=en_us spellfile=~/.config/nvim/spell/en.utf-8.add<CR>

" remap key connected to spell checks
nmap <leader>c z=
nmap <leader>N [s
nmap <leader>n ]s
nmap <leader>a zg
nmap <leader>d zug

" Reload init.vim
map <leader>r :source ~/.config/nvim/init.vim<CR>

" Permanent undo
set undodir=~/.cache/nvim/undodir/
set undofile

" compile java
map <leader>z :!javac %<CR><CR>
map <leader>zq  :!javac %<CR><CR> :q<CR>

" compile c & cpp
map <leader>x :!gcc % -o %:r <CR><CR>

" npm install -g mdpdf
" markdown to pdf and open file in zathura
map <leader>m :!mdpdf %<CR><CR>
map <leader>mp :!mdpdf % && zathura %:r.pdf &<CR><CR>

nnoremap <leader>§ :Nuake<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
" When switching to terminal windows it goes into insert mode automatically
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set wildignore+=*.a,*.o,*.gif,*.jpg,*.png,.git,*.swp,*.tmp,*.class

source $HOME/repositories/dotfiles/.config/nvim/config/plug-plugin.vim
"vim-plug
map <leader>i :PlugInstall<cr>
map <leader>u :PlugUpdate<cr>
map <leader>uu :PlugUpgrade<cr>

" Required:
filetype plugin indent on
syntax enable


" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme tender

" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
call deoplete#custom#option('smart_case', v:true)
" call deoplete#custom#source('buffer', 'rank', 9999)

" clang
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
"let g:deoplete#sources#clang#clang_header = '/usr/include/lib/clang'

" vim table mode
map <leader><tab> :TableModeToggle <cr>
let g:table_mode_corner="|"

" supertab
let g:SuperTabDefaultCompletionType = "context"

" rust & racer
let g:deoplete#sources = {'rust': ['ale', 'racer']}
let g:deoplete#sources#rust#racer_binary="/home/user/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/home/gnus/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20

" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='deus theme'

" gitgutter
let g:gitgutter_enabled = 1
nmap <leader>g :GitGutterToggle<CR>

" ctrlp
nnoremap <leader>, :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrp_by_filename = 1
let g:ctrlp_custom_ignore = 'target\|git'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" tabular
let g:table_mode_corner="|"

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <leader>f :NERDTreeToggle<CR>
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeShowIgnoredStatus = 1
" vimscript
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"ale
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0
let g:ale_rust_rls_executable = '/home/gnus/.cargo/bin'

" Setup compilers for languages

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['autopep8', 'pylint'],
      \  'java': ['javac'],
      \  'rust': ['rustfmt'],
      \  'shell': ['sh']
      \ }

" Theme
syntax enable
colorscheme nord

let g:AutoPairsFlyMode = 1

" Alias files
source $HOME/repositories/dotfiles/.config/nvim/config/alias.vim

" deoplete required, last in file
let g:deoplete#enable_at_startup = 1
