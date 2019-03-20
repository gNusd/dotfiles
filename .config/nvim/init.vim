
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

set number relativenumber                       " Show line numbers and relativnumbers
set background=dark

set mouse=a                                     " Enable the use of the mouse.

autocmd BufWritePre * %s/\s\+$//e               " Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)      " checks if you write over the 80 character line


autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode

"

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
      NeoBundle 'Shougo/neosnippet.vim'
      NeoBundle 'Shougo/neosnippet-snippets'
      NeoBundle 'tpope/vim-fugitive'
      NeoBundle 'ctrlpvim/ctrlp.vim'
      " Deoplete
	if has('nvim')
 		NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		else
  		NeoBundle 'Shougo/deoplete.nvim'
  		NeoBundle 'roxma/nvim-yarp'
  		NeoBundle 'roxma/vim-hug-neovim-rpc'
	endif
      NeoBundle 'vim-airline/vim-airline'
      NeoBundle 'vim-airline/vim-airline-themes'
      NeoBundle 'deoplete-plugins/deoplete-jedi'
      NeoBundle 'tpope/vim-surround'
      NeoBundle 'tpope/vim-commentary'
      NeoBundle 'plasticboy/vim-markdown'
      NeoBundle 'godlygeek/tabular'
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

let g:deoplete#enable_at_startup = 1
