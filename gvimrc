set guioptions=ce
set antialias

" Tab navigation settings
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabclose<CR>

" Color scheme
set background=dark
colorscheme solarized

set guifont=PragmataPro\ Mono:h24

highlight Comment gui=italic

" disable IM while leaving insert mode
" set noimdisable
" autocmd! InsertLeave * set imdisable|set iminsert=0
" autocmd! InsertEnter * set noimdisable|set iminsert=0

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='distinguished'
let g:airline#extensions#whitespace#enabled = 0
