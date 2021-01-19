 """"  "    " "    "  """"  Year: 2019
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"


set nocompatible						        " be iMproved, required
" bind: "<leader> Space" desc: "leader modification key"
let mapleader = " "
set encoding=UTF-8
set shell=/usr/bin/zsh
set number relativenumber 						" Show line numbers and relativnumbers
set tabstop=4 									" Tabs 4 spaces
set mouse= 			 							" Disable mouse. Enable the use of the mouse mouse=a.
set splitbelow splitright						" adds new window split to the right annd below
set confirm										" confirm changes (Yes, No, Cancel) instead of error
set fillchars+=vert:\ 							" Removes pipes that act as seperators on splits
set path+=**									" Searches current directory recursively.
set undodir=~/.cache/nvim/undodir/ 				" Setting undodir
set undofile 									" setting undofile for permanent undo
set wildignore+=*.a,*.o,*.gif,*.jpg,*.png,.git,*.swp,*.tmp,*.class 	" file to ignore
set listchars=tab:>-,trail:·,extends:>,precedes:<,space:· 	" show tabs and spaces, not using end of line (eol:⏎,)
set list

autocmd BufWritePre * %s/\s\+$//e 				" Remove trailing whitespace
call matchadd('ColorColumn', '\%81v', 100)		" checks if you write over the 80 character line

" clipboard
" bind: "<leader>y" desc: "Yank to clipboard"
noremap <silent><leader>y :w !xsel -i -b<CR><CR>
" bind: "<leader>p" desc: "Paste from clipboard"
noremap <silent><leader>p :r !xsel -o -b<CR>

let g:highlightedyank_highlight_duration = 1000
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" mode indicators
autocmd InsertEnter * set cul                    " cursor in insertmode
autocmd InsertLeave * set nocul                  " cursor in normalmode

" bind: "<leader>r" desc: "reload init.vim"
map <leader>r :source ~/.config/nvim/init.vim<CR>

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

source $HOME/.local/git/dotfiles/.config/nvim/config/plug-plugin.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/lsp.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/alias.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/completion.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/nav.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/git.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/theme.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/buffer.vim
source $HOME/.local/git/dotfiles/.config/nvim/config/term.vim

" Required:
filetype plugin indent on
syntax enable

" vim table mode
" bind: "<leader><tab>" desc: "toggle table mode"
map <leader><tab> :TableModeToggle <cr>
let g:table_mode_corner="|"

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

" markdown preview
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle

" auto close
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
