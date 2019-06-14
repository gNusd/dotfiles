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

set encoding=UTF-8

set number relativenumber                       " Show line numbers and relativnumbers

set tabstop=4
set mouse=                                     " Disable mouse. Enable the use of the mouse mouse=a.

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

" Spell checking
set complete+=kspell
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

" npm install -g markdown-pdf
" markdown to pdf and open file in zathura
map <leader>m :!markdown-pdf % && zathura %:r.pdf &<CR><CR>

" treminal window at the bottom, F4 to invoke
let g:term_buf = 0
function! Term_toggle()
  1wincmd w
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    rightbelow new
    12winc -
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("bash", {"detach": 0})
      let g:term_buf = bufnr("")
    endtry
    set laststatus=0
    startinsert!
  endif
endfunction
nnoremap <leader>t :call Term_toggle()<cr>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
" When switching to terminal windows it goes into insert mode automatically
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/gnus/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/gnus/.cache/dein')
  call dein#begin('/home/gnus/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/gnus/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('deoplete-plugins/deoplete-go')

" Languages
  call dein#add('plasticboy/vim-markdown')
  call dein#add('rust-lang/rust.vim')
  call dein#add('JamshedVesuna/vim-markdown-preview')
  call dein#add('nvie/vim-flake8')

" git plugins
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

" snippets
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-repeat')
  call dein#add('godlygeek/tabular')
  call dein#add('ervandew/supertab')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf' })
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ryanoasis/vim-devicons')

  " schemes and themes
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('mhartington/oceanic-next')
  " call dein#add('joshdick/onedark.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" markdown preview
let vim_markdown_preview_toggle=0
let vim_markdown_preview_hotkey='<leader>p'
let vim_markdown_preview_browser='Firefox'

" racer
let g:deoplete#sources#rust#racer_binary="/home/user/.cargo/bin/racer"
let g:deoplete#sources#rust#rust_source_path="/home/gnus/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='oceanicnext'

" gitgutter
let g:gitgutter_enabled = 1
nmap <leader>g :GitGutterToggle<CR>
" ctrlp
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" set runtimepath^=~/.vim/bundle/ctrlp.vim
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

" Theme
syntax enable
colorscheme OceanicNext

" deoplete required, last in file
let g:deoplete#enable_at_startup = 1
