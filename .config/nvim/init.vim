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
filetype off                 			" required
let mapleader = " "

set number relativenumber                       " Show line numbers and relativnumbers

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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

" markdown to pdf and open file in zathura
map <leader>m :!markdown-pdf % && zathura %:r.pdf<CR>

"NeoBundle Scripts-----------------------------
  if has('vim_starting')
    " Required:
      set runtimepath+=/home/gnus/.config/nvim/bundle/neobundle.vim/
      endif

      " Required:
      call neobundle#begin(expand('/home/gnus/.config/nvim/bundle'))

      " Let NeoBundle manage NeoBundle
      " Required:
      NeoBundleFetch 'Shougo/neobundle.vim'

      " Add or remove your Bundles here:
      " Deoplete
	if has('nvim')
 		NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		else
  		NeoBundle 'Shougo/deoplete.nvim'
  		NeoBundle 'roxma/nvim-yarp'
  		NeoBundle 'roxma/vim-hug-neovim-rpc'
	endif
      NeoBundle 'deoplete-plugins/deoplete-jedi'

      " Languages
      NeoBundle 'plasticboy/vim-markdown'
      NeoBundle 'rust-lang/rust.vim'
      NeoBundle 'sebastianmarkow/deoplete-rust'
      NeoBundle 'racer-rust/vim-racer'
      NeoBundle 'deoplete-plugins/deoplete-go', {'build': {'unix': 'make'}}

      " git plugins
      NeoBundle 'tpope/vim-fugitive'
      NeoBundle 'airblade/vim-gitgutter'

      " snippets
      NeoBundle 'Shougo/neosnippet.vim'
      NeoBundle 'Shougo/neosnippet-snippets'
      NeoBundle 'ctrlpvim/ctrlp.vim'
      NeoBundle 'vim-airline/vim-airline'
      NeoBundle 'vim-airline/vim-airline-themes'
      NeoBundle 'tpope/vim-surround'
      NeoBundle 'tpope/vim-commentary'
      NeoBundle 'tpope/vim-repeat'
      NeoBundle 'godlygeek/tabular'
      NeoBundle 'ervandew/supertab'
      NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf' }
      NeoBundle 'dhruvasagar/vim-table-mode'
      NeoBundle 'mhartington/oceanic-next'
      NeoBundle 'christoomey/vim-tmux-navigator'
      " You can specify revision/branch/tag.
      NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

      " Required:
      call neobundle#end()


      " Required:
      filetype plugin indent on

      " If there are uninstalled bundles found on startup,
      " this will conveniently prompt you to install them.
      NeoBundleCheck
      "End NeoBundle Scripts-------------------------

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

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:table_mode_corner="|"

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" deoplete required, last in file
let g:deoplete#enable_at_startup = 1
