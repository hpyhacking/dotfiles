" Leader
let mapleader = ","

set nocompatible
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

syntax on

" Declare bundles are handled via Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Define bundles via Github repos
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/genutils'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'

filetype plugin indent on


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

set tabstop=2
set shiftwidth=2 
set softtabstop=2
set expandtab

set number
set numberwidth=5

set cursorline
set cursorcolumn
hi CursorLine cterm=NONE ctermbg=237
hi CursorColumn cterm=NONE ctermbg=237

" Always show the statusline
set laststatus=2
" Necessary to show unicode glyphs
set encoding=utf-8

"" Map Goyo toggle to <Leader> + spacebar
nnoremap <leader><space> :Goyo 100<CR>  

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

" EasyMotion
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

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
" =================================================

" NERDTree
" =================================================
nnoremap <leader><tab> :NERDTreeToggle<CR>
nnoremap <leader>c<tab> :NERDTreeFind<CR>
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowBookmarks=0
let g:NERDTreeWinSize=22
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeIgnore = ['build$', 'bower_components$', 'node_modules$']

set wildignore+=log,Mnesia.*,ebin,.git,tmp
set wildignore+=*.jpg,*.png,*.beam,*.dump,*.log
" =================================================

" Snippets reload when saving
autocmd! BufWritePost *.snippets call ReloadAllSnippets()
" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
