"***************************************************************************
"*                            _          _       _ _         _             *
"*   __ _ _ __  _   _ ___  __| | __/\__ (_)_ __ (_) |___   _(_)_ __ ___    *
"*  / _` | '_ \| | | / __|/ _` | \    / | | '_ \| | __\ \ / / | '_ ` _ \   *
"* | (_| | | | | |_| \__ \ (_| | /_  _\ | | | | | | |_ \ V /| | | | | | |  *
"*  \__, |_| |_|\__,_|___/\__,_|   \/   |_|_| |_|_|\__(_)_/ |_|_| |_| |_|  *
"*  |___/                                                                  *
"*                                                                         *
"*                     https://github.com/gnusd                            *
"***************************************************************************

set nocompatible 		             	" be iMproved, required
"##<leader>:Space
let mapleader = " "

" block arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" mapping Alt + hjkl to left, right, down, up in insert mode
"##<alt>hjkl:left, right, up and down in insert mode
inoremap <buffer><a-h> <esc>h i
inoremap <buffer><a-l> <esc>l i
inoremap <buffer><a-j> <esc>j i
inoremap <buffer><a-k> <esc>k i

" remapping window navigation
"##<ctrl>hjkl:window navigation left, right, up and down in normal mode
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" mapping window navigaton in insert mode
"##<ctrl>hjkl:window navigation left, right, up and down in insert mode
inoremap <buffer> <c-h> <esc><c-w>h i
inoremap <buffer> <c-l> <esc><c-w>l i
inoremap <buffer> <c-j> <esc><c-w>j i
inoremap <buffer> <c-k> <esc><c-w>k i

set encoding=UTF-8
set shell=/usr/bin/zsh

set number relativenumber                       " Show line numbers and relativnumbers

set tabstop=4
set mouse=                                     " Disable mouse. Enable the use of the mouse mouse=a.
set splitbelow splitright 					   " adds new window split to the right annd below
set confirm  									"confirm changes (Yes, No, Cancel) instead of error

autocmd BufWritePre * %s/\s\+$//e               " Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      " checks if you write over the 80 character line

" mode indicators
autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode
set path+=**							   		" Searches current directory recursively.
set wildmenu 									" Display all matches when tab complete.

" Closing all but current buffer
function! CloseAllBufferButCurrent()
		:%bd|e#
endfunction

" Buffer handeling
"##<leader><shift>j:previous buffer/document
map <leader>J :bprevious <CR>
"##<leader>j:previous buffer/document without saving
map <leader>j :bprevious! <CR>
"##<leader><shift>k:next buffer/document
map <leader>K :bnext <CR>
"##<leader>k:next buffer/document without saving
map <leader>k :bnext! <CR>
"##<leader>w:close buffer/document
map <leader>w :bd <CR>
"##<leader><shift>w:close buffer/document without saving
map <leader>W :bd! <CR>
"##<leader>q:close all buffers/documents but the active one
map <leader>q :call CloseAllBufferButCurrent() <CR>

" Spell checking
set complete+=kspell,w,b,u

"##<leader>s:swedish spelling check
map <leader>s :setlocal spell! spelllang=sv spellfile=~/.config/nvim/spell/sv.utf-8.add<CR>
"##<leader>e:english spelling check
map <leader>e :setlocal spell! spelllang=en_us spellfile=~/.config/nvim/spell/en.utf-8.add<CR>

" remap key connected to spell checks
"##<leader>c:bring up suggestions
nmap <leader>c z=
"##<leader><shift>n:previous word
nmap <leader>N [s
"##<leader>n:next word
nmap <leader>n ]s
"##<leader>a:add word to dictionary
nmap <leader>a zg
"##<leader>a:delete word from dictionary
nmap <leader>d zug

" Reload init.vim
"##<leader>r:reload init.vim
map <leader>r :source ~/.config/nvim/init.vim<CR>

" Permanent undo & undotree
set undodir=~/.cache/nvim/undodir/
set undofile
"##<leader>å:toggle undotree
map <leader>å :UndotreeToggle<CR>

let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '*'

" compile java
"##<leader>z:compile java
map <leader>z :!javac % <CR><CR>

" compile c & cpp
"##<leader>x:compile with gcc
map <leader>x :!gcc % -o %:r <CR><CR>

" npm install -g mdpdf
" markdown to pdf and open file in zathura
"##<leader>m:export markdown file to pdf
map <leader>m :!mdpdf %<CR><CR>
"##<leader><shift>m:export markdown file to pdf and open in zathura
map <leader>M :!mdpdf % && zathura %:r.pdf &<CR><CR>

"##<leader>l:open file from vifm in vertical split
noremap <leader>l :VsplitVifm<CR>
"##<leader>h:open file from vifm in horizontal split
noremap <leader>h :SplitVifm<CR>
"##<leader>§:toggle terminal
nnoremap <leader>§ :Nuake<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set wildignore+=*.a,*.o,*.gif,*.jpg,*.png,.git,*.swp,*.tmp,*.class

source $HOME/repositories/dotfiles/.config/nvim/config/plug-plugin.vim
"vim-plug
"##<leader>i:install plugins with vim-plug
map <leader>i :PlugInstall<cr>
"##<leader>u:update plugins with vim-plug
map <leader>u :PlugUpdate<cr>
"##<leader>uu:upgrade plugins with vim-plug
map <leader>uu :PlugUpgrade<cr>

" Required:
filetype plugin indent on
syntax enable

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set background=dark

" gruvbox-material
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_disable_italic_comment = 1

" Theme
syntax enable
colorscheme gruvbox-material

"lightline
let g:lightline = { 'colorscheme': 'gruvbox_material' }
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
call deoplete#custom#option('smart_case', v:true)

" clang
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'

" vim table mode
"##<leader><tab>:toggle table mode
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
let g:java_highlight_functions = 1

" gitgutter
let g:gitgutter_enabled = 1

" vim fugitive
"##<leader>g:git browser
nmap <leader>g :Git<CR>
"##<leader>gc:git commit menu
nmap <leader>gc :Gcommit<CR>
"##<leader>gd:git diff menu
nmap <leader>gd :Gdiffsplit<CR>
"##<leader>gb:git blame menu
nmap <leader>gb :Gblame<CR>

" blame line
nnoremap <silent> <leader>G :ToggleBlameLine<CR>

" ctrlp
"##<leader>,:bring up CtrlP for search
nnoremap <leader>, :CtrlP<CR>
"##<leader>b:bring up CtrlP for searching in the buffers
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrp_by_filename = 1
let g:ctrlp_custom_ignore = 'target\|git'
let g:ctrlp_show_hidden = 1
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" taglist
"##<leader>t:toggle tag list menu
nnoremap <leader>t :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_WinWith = 50
let Tlist_Show_Menu = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'


" Floating window (neovim)
function! s:layout()
  let buf = nvim_create_buf(v:false, v:true)

  let height = &lines - (float2nr(&lines / 3))
  let width = float2nr(&columns - (&columns * 2 / 3))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 2,
        \ 'col': 8,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'

"netrw
"##<leader>f:toggle side file browser
map <leader>f :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0

" animate
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

"ale
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'
let g:syntastic_ignore_files = ['.*\.lst', '~/nextcloud/dokument/inköpslistor/']

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
      \  'shell': ['sh'],
      \  'c':['gcc']
      \ }

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" Writing
"##<leader>-:distraction-free writing in vim
map <silent> <leader>- :Goyo \| set bg=dark \| set linebreak<CR>

" Alias files
source $HOME/repositories/dotfiles/.config/nvim/config/alias.vim

" deoplete required, last in file
let g:deoplete#enable_at_startup = 1
