
""""  "    " "    "  """"  Year: 2019
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
""""  "    "  """"   """"  FILE: plug-plugins.vim

""""""""""""""""""
" INSTALLING VIM-PLUG
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
""""""""""""""""""

call plug#begin('~/.config/nvim/plugged/')

Plug 'roxma/nvim-yarp'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }

Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete-lsp'
Plug 'Chiel92/vim-autoformat'
" Plug 'sebastianmarkow/deoplete-rust'
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'deoplete-plugins/deoplete-go'
" Plug 'deoplete-plugins/deoplete-zsh'
" Plug 'deoplete-plugins/deoplete-clang'

" Other language plugins
" Plug 'dense-analysis/ale'
" Plug 'plasticboy/vim-markdown'
" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/racer'
" Plug 'nvie/vim-flake8'
" Plug 'itspriddle/vim-shellcheck'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'zchee/libclang-python3'
" Plug 'davidhalter/jedi-vim'
" Plug 'Shougo/neco-vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Terminal & filesystem
Plug 'Lenovsky/nuake', {'on': 'Nuake'}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/taglist.vim'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-vinegar'
Plug 'camspiers/animate.vim'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tveskag/nvim-blame-line'

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
Plug 'fcpg/vim-waikiki'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-peekaboo'

" schemes and themes
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'chrisbra/Colorizer'

Plug 'ThePrimeagen/vim-be-good'
" Initialize plugin system
call plug#end()
