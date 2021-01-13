
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

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Terminal & filesystem
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/taglist.vim'
Plug 'vifm/vifm.vim'
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
