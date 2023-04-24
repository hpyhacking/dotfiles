set nocompatible
filetype off

" Declare bundles are handled via Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Define bundles via Github repos
Plugin 'vim-scripts/genutils'

Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

" Leader
let mapleader = ","

syntax on

set nobackup
set noswapfile
set history=100
set ruler
set showcmd
set hlsearch
set incsearch
set backspace=indent,eol,start
set imi=0 ims=0
set shell=/bin/zsh
set clipboard=unnamed
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab
set number
set numberwidth=5
set cursorline
set cursorcolumn
set foldmethod=manual
set ttyfast
set ttyscroll=3
set lazyredraw

hi CursorLine cterm=NONE ctermbg=237
hi CursorColumn cterm=NONE ctermbg=237

" Always show the statusline
set laststatus=2
" Necessary to show unicode glyphs
set encoding=utf-8

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Cancel highlight search result
noremap <silent> <leader>nh :nohlsearch<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" Remap cmd + s to save
" Remap cmd + c to close the other buffers
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
map <D-s> :w<CR>
map <C-c> :on<CR>

" Disable arrow 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move to beginning of non-whitespace
nnoremap 0 ^
nnoremap ^ 0

" Ctrlp
" =================================================
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max = 1000
let g:ctrlp_custom_ignore = {
  \ 'dir':  'rel$\|vendor$\|\.sass-cache$\|deps$\|\.eunit$\|\.git$\|\.hg$\|\.svn$\|log$\|ebin$\|bin$\|^Mnesia\.\|chicago_boss$\|node_modules$\|bower_components$',
  \ 'file': '\.jpg$\|\.png$\|\.mp3$\|\.beam$\|\.dump$\|\.log$\|\.DS_Store$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
  nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc
func! s:DeleteBuffer()
  exec "bd" fnamemodify(getline('.')[2:], ':p')
  exec "norm \<F5>"
endfunc

" NERDTree
" =================================================
nnoremap <leader><tab> :NERDTreeToggle<CR>
nnoremap <leader>c<tab> :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeIgnore = ['build$', 'bower_components$', 'node_modules$']

set wildignore+=log,Mnesia.*,ebin,.git,tmp
set wildignore+=*.jpg,*.png,*.beam,*.dump,*.log
" =================================================

" Ack 
" =================================================
" use @ggreer/the_silver_searcher in backend for searching
let g:ackprg = '/opt/homebrew/bin/ag --nogroup --nocolor --column'

" Airline
if has("gui_running")
  let g:airline_theme = 'solarized'
  let g:airline_powerline_fonts = 1
  let g:airline_right_sep = ''
  let g:airline_left_sep = ''
else
  let g:airline_symbols_ascii = 1
endif

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'c' : 'C',
  \ 'v' : 'V',
  \ 'V' : 'V',
  \ '' : 'V',
  \ 's' : 'S',
  \ 'S' : 'S',
  \ '' : 'S',
  \ }

let g:airline#extensions#whitespace#checks = []
let g:airline_section_y = airline#section#create_right(['%{printf("%s%s",&fenc,&ff!="unix"?":".&ff:"")}'])
let g:airline_section_z = airline#section#create_right(['%3l:%2c'])
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline_solarized_bg='dark'
