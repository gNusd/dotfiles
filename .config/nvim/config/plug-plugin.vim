""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALLING VIM-PLUG
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

Plug 'roxma/nvim-yarp'

  " Deoplete
Plug 'Shougo/deoplete.nvim',  {'do': ':UpdateRemotePlugins'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go'
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'deoplete-plugins/deoplete-clang'

" Other language plugins
Plug 'dense-analysis/ale'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/racer'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'nvie/vim-flake8'
Plug 'itspriddle/vim-shellcheck'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'zchee/libclang-python3'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neco-vim'

  " Terminal & filesystem
Plug 'Lenovsky/nuake'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

  " Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

  " git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

  " snippets

  " Input & text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'

  " Search
Plug 'ctrlpvim/ctrlp.vim'

   " schemes and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
" Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'


" Initialize plugin system
call plug#end()
