" color molokai

filetype off
" call pathogen#infect()
" call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
" set scrolloff=3
" set autoindent
" set showmode
" set showcmd
" set hidden
" set wildmenu
" set wildmode=list:longest
" set visualbell
" set cursorline
" set ttyfast
" set ruler
" set backspace=indent,eol,start
" set laststatus=2
" set relativenumber
" set undofile

set relativenumber 

let mapleader = ","

" nnoremap / /\v
" vnoremap / /\v
" set ignorecase
" set smartcase
" set gdefault
" set incsearch
" set showmatch
" set hlsearch
" nnoremap <leader><space> :noh<cr>
" nnoremap <tab> %
" vnoremap <tab> %

" nnoremap <esc> :noh<return><esc>
nnoremap <silent> <C-l> :noh<CR><C-l>

" toggle between relative and absolute line numbers
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <f4> :call g:ToggleNuMode()<cr>


set wrap
set textwidth=79
" set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" au FocusLost * :wa

nnoremap <leader>w <C-w>v<C-w>l


nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l



set wildignore+=*.o,*.obj,.git,vendor,*.log,tmp,*~,.sass-cache


map   <silent> <F5> mmgg=G'm
imap  <silent> <F5> <Esc> mmgg=G'm

let g:NERDTreeWinSize = 40 

vnoremap < <gv
vnoremap > >gv

" ctrlp plugin config
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.sass-cache$|\-svn$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40

" vim conque plugin
let g:ruby_conque_rspec_command='bundle exec rspec'

" theme // appearance
if has("gui_running")
  set guifont=Menlo\ Regular:h10
  " colorscheme molokai
  " color molokai
  " set background=light
  set background=dark
  
  map <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

endif
