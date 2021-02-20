
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
set shell=/bin/bash

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

"·bind:·"<leader>v"·desc:·"open·file·from·vifm·in·vertical·split"
noremap <leader>v :VsplitVifm<CR>
"·bind:·"<leader>h"·desc:·"open·file·from·vifm"
noremap <leader>, :Edit Vifm .<CR>
" bind: "<leader>§" desc: "toggle terminal"
nnoremap <leader>§ :Nuake<CR>
" bind: "<leader>T" desc: "Open terminal in vertical split"
nnoremap <leader>T :vnew term://bash <CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set wildignore+=*.a,*.o,*.gif,*.jpg,*.png,.git,*.swp,*.tmp,*.class

source $HOME/repositories/dotfiles/.config/nvim/config/plug-plugin.vim
" Alias files
source $HOME/repositories/dotfiles/.config/nvim/config/alias.vim

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

set completeopt-=preview

" vim table mode
" bind: "<leader><tab>" desc: "toggle table mode"
map <leader><tab> :TableModeToggle <cr>
let g:table_mode_corner="|"

" supertab
let g:SuperTabDefaultCompletionType = "context"

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

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" bind:·"<leader>m"·desc:·"search·with·ripgrep"
 nnoremap <leader>m :Rg<Space>

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"
