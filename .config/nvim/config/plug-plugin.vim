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
Plug 'Shougo/deoplete.nvim'
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
Plug 'nvie/vim-flake8'
Plug 'itspriddle/vim-shellcheck'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'zchee/libclang-python3'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/neco-vim'

  " Terminal & filesystem
Plug 'Lenovsky/nuake', {'on': 'Nuake'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/taglist.vim'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-vinegar'

  " Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

  " git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

  " snippets

  " Input & text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle '}
Plug 'mbbill/undotree'
Plug 'tmsvg/pear-tree'

  " Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


  " Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-peekaboo'

" schemes and themes
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

" Initialize plugin system
call plug#end()
