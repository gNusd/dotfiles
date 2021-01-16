
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: comp_spell.vim

set wildmenu				                 " Display all matches when tab complete.
set completeopt=menuone,noinsert,noselect    " Set completeopt to have a better completion experience
set shortmess+=c                             " Avoid showing message extra message when using completion
set complete+=kspell,w,b,u                 	 " Spell checking

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_chain_complete_list = {
      \ 'default' : {
      \   'default': [
      \       {'complete_items': ['lsp', 'buffers', 'tabnine', 'tmux' ]},
      \       {'mode': '<c-p>'},
      \       {'mode': '<c-n>'},
      \   ],
      \   'string' : [
      \       {'complete_items': ['path'], 'triggered_only': ['/']}]
      \   }}

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
