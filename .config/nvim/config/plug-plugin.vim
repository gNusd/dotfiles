
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

" Terminal & filesystem
Plug 'Lenovsky/nuake', {'on': 'Nuake'}
Plug 'ryanoasis/vim-devicons'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-vinegar'
Plug 'camspiers/animate.vim'
Plug 'jremmen/vim-ripgrep'

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

" Search
Plug 'junegunn/vim-peekaboo'

" schemes and themes
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'chrisbra/Colorizer'

" Initialize plugin system
call plug#end()
