
""""  "    " "    "  """"  Year: 2020
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
""""  "    "  """"   """"

set nocompatible						" be iMproved, required
" bind: "<leader> Space" desc: "leader mod key"
let mapleader = " "

" block arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" mapping Alt + hjkl to left, right, down, up in insert mode
" bind: "<alt>hjkl" desc: "left, right, up and down in insert mode"
inoremap <buffer><a-h> <esc>h i
inoremap <buffer><a-l> <esc>l i
inoremap <buffer><a-j> <esc>j i
inoremap <buffer><a-k> <esc>k i

" remapping window navigation
" bind: "<ctrl>hjkl" desc: "window navigation left, right, up and down in normal mode"
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

map <silent><c-s> :wincmd r <CR>

nnoremap <silent> <leader><up> :call MaximizeToggle()<CR>


function! MaximizeToggle()
		if exists("s:maximize_session")
				exec "source " . s:maximize_session
				call delete(s:maximize_session)
				unlet s:maximize_session
				let &hidden=s:maximize_hidden_save
				unlet s:maximize_hidden_save
		else
				let s:maximize_hidden_save = &hidden
				let s:maximize_session = tempname()
				set hidden
				exec "mksession! " . s:maximize_session
				only
		endif
endfunction

" mapping window navigaton in insert mode
" bind: "<ctrl>hjkl" desc: "window navigation left, right, up and down in insert mode"
inoremap <buffer> <c-h> <esc><c-w>h i
inoremap <buffer> <c-l> <esc><c-w>l i
inoremap <buffer> <c-j> <esc><c-w>j i
inoremap <buffer> <c-k> <esc><c-w>k i

map <leader>ww gg2jVG :sort <CR>

set encoding=UTF-8
set shell=/usr/bin/zsh

set number relativenumber                       " Show line numbers and relativnumbers

set tabstop=4
set mouse=                                     " Disable mouse. Enable the use of the mouse mouse=a.
set splitbelow splitright					   " adds new window split to the right annd below
set confirm										"confirm changes (Yes, No, Cancel) instead of error

" clipboard
" bind: "<leader>y" desc: "Yank to clipboard"
noremap <silent><leader>y :w !xclip -selection clipboard<CR><CR>
" bind: "<leader>p" desc: "Paste from clipboard"
noremap <silent><leader>p :r !xclip -o -selection clipboard<CR>

if exists('##TextYankPost')
		autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 750)
endif
autocmd BufWritePre * %s/\s\+$//e               " Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      " checks if you write over the 80 character line

" mode indicators
autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode
set path+=**									" Searches current directory recursively.
set wildmenu									" Display all matches when tab complete.

" Closing all but current buffer
function! CloseAllBufferButCurrent()
		:%bd|e#
endfunction

" Buffer handeling
" bind: "<leader><shift>j" desc: "previous buffer/document"
map <leader>J :bprevious <CR>
" bind: "<leader>j" desc: "previous buffer/document without saving"
map <leader>j :bprevious! <CR>
" bind: "<leader><shift>k" desc: "next buffer/document"
map <leader>K :bnext <CR>
" bind: "<leader>k" desc: "next buffer/document without saving"
map <leader>k :bnext! <CR>
" bind: "<leader>w" desc: "close buffer/document"
map <leader>w :bd <CR>
" bind: "<leader><shift>w" desc: "close buffer/document without saving"
map <leader>W :bd! <CR>
" bind: "<leader>q" desc: "close all buffers/documents but the active one"
map <leader>q :call CloseAllBufferButCurrent() <CR>

" Spell checking
set complete+=kspell,w,b,u

" bind: "<leader>s" desc: "swedish spelling check"
map <leader>s :setlocal spell! spelllang=sv spellfile=~/.config/nvim/spell/sv.utf-8.add<CR>
" bind: "<leader>e" desc: "english spelling check"
map <leader>e :setlocal spell! spelllang=en_us spellfile=~/.config/nvim/spell/en.utf-8.add<CR>

" remap key connected to spell checks
" bind: "<leader>c" desc: "bring up suggestions"
nmap <leader>c z=
" bind: "<leader><shift>n" desc: "previous word"
nmap <leader>N [s
" bind: "<leader>n" desc: "next word"
nmap <leader>n ]s
" bind: "<leader>a" desc: "add word to dictionary"
nmap <leader>a zg
" bind: "<leader>a" desc: "delete word from dictionary"
nmap <leader>d zug

" Reload init.vim
" bind: "<leader>r" desc: "reload init.vim"
map <leader>r :source ~/.config/nvim/init.vim<CR>

" Permanent undo & undotree
set undodir=~/.cache/nvim/undodir/
set undofile
" bind: "<leader>å" desc: "toggle undotree"
map <leader>å :UndotreeToggle<CR>

let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_TreeNodeShape = '*'


function! Compile()
		if (&ft=="rust")
				:!cargo build
		elseif (&ft=="java")
				:!javac %
		elseif (&ft=='c' || &ft=='cpp')
				:!gcc % -o %:r
		endif
endfunction

map <silent> <leader>z :call Compile()<CR><CR>

" npm install -g mdpdf
" markdown to pdf and open file in zathura
" bind: "<leader>m" desc: "export markdown file to pdf"
map <leader>m :!mdpdf %<CR><CR>
" bind: "<leader><shift>m" desc: "export markdown file to pdf and open in zathura"
map <leader>M :!mdpdf % && zathura %:r.pdf &<CR><CR>

" Vim-Instant-Markdown
" Turns off auto preview
let g:instant_markdown_autostart = 0
" Uses qutebrowser for preview
let g:instant_markdown_browser = "qutebrowser"

" bind: "<leader>md" desc: "Starts preview of .md file in qutebrowser"
map <leader>md :InstantMarkdownPreview<CR>
" bind: "<leader>ms" desc: "Stops preview of .md files"
map <leader>ms :InstantMarkdownStop<CR>

" bind: "<leader>l" desc: "open file from vifm in vertical split"
noremap <leader>l :VsplitVifm<CR>
" bind: "<leader>h" desc: "open file from vifm in horizontal split"
noremap <leader>h :SplitVifm<CR>
" bind: "<leader>§" desc: "toggle terminal"
nnoremap <leader>§ :Nuake<CR>
" bind: "<leader>T" desc: "Open terminal in vertical split"
nnoremap <leader>T :vnew term://bash <CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set wildignore+=*.a,*.o,*.gif,*.jpg,*.png,.git,*.swp,*.tmp,*.class

source $HOME/repositories/dotfiles/.config/nvim/config/plug-plugin.vim
"vim-plug
" bind: "<leader>i" desc: "install plugins with vim-plug"
map <leader>i :PlugInstall<cr>
" bind: "<leader>u" desc: "update plugins with vim-plug"
map <leader>u :PlugUpdate<cr>
" bind: "<leader>uu" desc: "upgrade plugins with vim-plug"
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
"let g:deoplete#auto_complete_start_length = 1
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'

" vim table mode
" bind: "<leader><tab>" desc: "toggle table mode"
map <leader><tab> :TableModeToggle <cr>
let g:table_mode_corner="|"

" supertab
let g:SuperTabDefaultCompletionType = "context"

" rust & racer

let g:deoplete#sources#rust#racer_binary="$HOME/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20
" bind: "gd" desc: "go to definition in rust"
nmap <buffer> gd <plug>DeopleteRustGoToDefinitionDefault
" bind: "K" desc: "show documentation in rust"
nmap <buffer> K  <plug>DeopleteRustShowDocumentation

" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
let g:java_highlight_functions = 1

" gitgutter
let g:gitgutter_enabled = 1

" vim fugitive
" bind: "<leader>g" desc: "git browser"
nmap <leader>g :Git<CR>
" bind: "<leader>gc" desc: "git commit menu"
nmap <leader>gc :Gcommit<CR>
" bind: "<leader>gd" desc: "git diff menu"
nmap <leader>gd :Gdiffsplit<CR>
" bind: "<leader>gb" desc: "git blame menu"
nmap <leader>gb :Gblame<CR>

" blame line
" bind: "<leader>G" desc: "toggle on and off git blame info on the line cursor is on"
nnoremap <silent> <leader>G :ToggleBlameLine<CR>

" ctrlp
" bind: "<leader>," desc: "bring up CtrlP for search"
nnoremap <leader>, :CtrlP<CR>
" bind: "<leader>b" desc: "bring up CtrlP for searching in the buffers"
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
" bind: "<leader>t" desc: "toggle tag list menu"
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
" bind: "<leader>f" desc: "toggle side file browser"
map <leader>f :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0

" animate
" bind: "<ctrl><up>" desc: "move split up"
nnoremap <silent> <C-Up>    :call animate#window_delta_height(10)<CR>
" bind: "<ctrl><down>" desc: "move split down"
nnoremap <silent> <C-Down>  :call animate#window_delta_height(-10)<CR>
" bind: "<ctrl><left>" desc: "move split left"
nnoremap <silent> <C-Left>  :call animate#window_delta_width(10)<CR>
" bind: "<ctrl><right>" desc: "move split right"
nnoremap <silent> <C-Right> :call animate#window_delta_width(-10)<CR>

"Change 2 split windows from vert to horiz or horiz to vert
" bind: "<leader>th" desc: "Change layout from vertical to horizontal"
map <leader>th <C-w>t<C-w>H
" bind: "<leader>tk" desc: "Change layout from horizontal to vertical"
map <leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\
"ale
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" disable linting of files
" autocmd BufEnter *.lst ALEDisable

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
						\  'rust': ['cargo', 'rustfmt'],
						\  'shell': ['sh'],
						\  'c':['gcc']
						\ }

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" Writing
" bind: "<leader>-" desc: "distraction-free writing in vim"
map <silent> <leader>- :Goyo \| set bg=dark \| set linebreak<CR>

" Alias files
source $HOME/repositories/dotfiles/.config/nvim/config/alias.vim

" setup rust_analyzer LSP (IDE features)

lua require'nvim_lsp'.rust_analyzer.setup{}
lua require'nvim_lsp'.rls.setup{}
lua require'nvim_lsp'.bashls.setup{}
lua require'nvim_lsp'.vimls.setup{}
lua require'nvim_lsp'.gopls.setup{}
lua require'nvim_lsp'.pyls.setup{{settings={python={linting={enabled=true}}}}}


" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype sh setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc


" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" customise deoplete                                                                                                                                                     " maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

"TODO: clippy on write
autocmd BufWrite * :Autoformat

nnoremap <leader>9 :!cargo clippy

nnoremap <silent> ;dc :call lsp#text_document_declaration()<CR>
nnoremap <silent> ;df :call lsp#text_document_definition()<CR>
nnoremap <silent> ;h  :call lsp#text_document_hover()<CR>
nnoremap <silent> ;i  :call lsp#text_document_implementation()<CR>
nnoremap <silent> ;s  :call lsp#text_document_signature_help()<CR>
nnoremap <silent> ;td :call lsp#text_document_type_definition()<CR>

" deoplete required, last in file
let g:deoplete#enable_at_startup = 1
