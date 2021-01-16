
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: term.vim

" bind: "<leader>l" desc: "open file from vifm in vertical split"
noremap <leader>l :VsplitVifm<CR>
" bind: "<leader>h" desc: "open file from vifm in horizontal split"
noremap <leader>h :SplitVifm<CR>
" bind: "<leader>h" desc: "open file from vifm"
noremap <leader>, :Edit Vifm .<CR>

" bind: "<leader>§" desc: "Open terminal in horizontal split"
nnoremap <leader>§ :new term://zsh <CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"netrw
" bind: "<leader>f" desc: "toggle side file browser"
map <leader>f :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0

