set guioptions=ce
set antialias

" Tab navigation settings
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabclose<CR>

" Color scheme
" set background=dark
colorscheme solarized

if has('mac')
  if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
    set guifont=Essential\ PragmataPro:h24
  else
    set guifont=Essential\ PragmataPro:h20
  endif
endif

highlight Comment gui=italic

" disable IM while leaving insert mode
" set noimdisable
" autocmd! InsertLeave * set imdisable|set iminsert=0
" autocmd! InsertEnter * set noimdisable|set iminsert=0

" set fancy font for powerline
let g:Powerline_symbols='fancy'

set transparency=1
