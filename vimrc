" be iMproved
set nocompatible

" disable file type detection
filetype off

" extent runtimepath (rpt==runtimepath)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""
"" CORE
""
Bundle 'gmarik/vundle'
" vundle uses git:// instead of https:// when building full path
let g:vundle_default_git_proto = 'git'

Bundle 'mileszs/ack.vim'
"use the silver searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Bundle 'tpope/vim-endwise'

" quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" A tree explorer plugin for vim.
Bundle 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>

" Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|CVS$\|\.svn$\|target$',
  \ 'file': '\.class$\|\.so$',
  \ }
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 10

" vim plugin to quickly switch between buffers
Bundle 'troydm/easybuffer.vim'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'

" A fancy start screen for Vim.
Bundle 'mhinz/vim-startify'

" Perform all your vim insert mode completions with Tab
Bundle 'ervandew/supertab'

Bundle 'scrooloose/nerdcommenter'

" required by vim-textobj-rubyblock
Bundle 'kana/vim-textobj-user'

""
"" GIT
""
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/splice.vim'
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_eager = 0 "run gitgutter only on file read & save

""
"" RUBY
""
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'


""
"" HAML
""
Bundle 'tpope/vim-haml'

""
"" COFFEESCRIPT
""
Bundle 'kchmck/vim-coffee-script'

""
"" VISUALS
""
Bundle 'w0ng/vim-hybrid'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'

Bundle 'bling/vim-airline'
" enable airline
let g:airline#extensions#tabline#enabled = 1


"" After all bundles
filetype plugin indent on

""
"" CORE SETTINGS
""
" change the terminal's title
set title
" Disable (visual) bell
set visualbell
set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" there are other tools for making backups
set nobackup
set noswapfile

if has("gui_running")
  " no reason not to use mouse
  set mouse=a
end

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set relativenumber
set numberwidth=4

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise

set list
set listchars=tab:▸\ ,eol:¬

set pastetoggle=<F2>

" disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save when focus is lost
au FocusLost * :wa

" split window vertically and focus new one
nnoremap <leader>w <C-w>v<C-w>l

" add some files to ignored
set wildignore+=*.o,*.obj,.git,vendor,*.log,tmp,*~,.sass-cache,*.png,*.jpg,*.gif,public

function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <f4> :call g:ToggleNuMode()<cr>

autocmd BufWritePre * :%s/\s\+$//e

set foldlevelstart=0
set foldmethod=syntax
au FileType ruby setlocal foldmethod=syntax

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za
"
" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

""
"" CUSTOMIZATIONS
""
" set <leader>
let mapleader=","

map <leader>r :so %<CR> " reload vim config - just for now
map <leader>bu :BundleInstall<CR>

" switching between windows
nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" clear search result highlight
noremap <silent>// :nohls<CR>

map <leader>p :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>
" Rails pecific mappings
map <leader>jm :CtrlP app/models<CR>
map <leader>jc :CtrlP app/controllers<CR>
map <leader>jv :CtrlP app/views<CR>
map <leader>jh :CtrlP app/helpers<CR>
map <leader>jl :CtrlP lib<CR>
map <leader>ja :CtrlP app/assets<CR>
map <leader>jp :CtrlP public<CR>
map <leader>js :CtrlP spec<CR>
map <leader>jf :CtrlP fast_spec<CR>
map <leader>jd :CtrlP db<CR>
map <leader>jC :CtrlP config<CR>
map <leader>jV :CtrlP vendor<CR>
map <leader>jF :CtrlP factories<CR>
map <leader>jT :CtrlP test<CR>

map <leader>l :EasyBufferToggle<CR>

" nerdcommenter
map <leader>/ :call NERDComment(0, "invert")<cr>
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>
map <D-/> :call NERDComment(0, "invert")<cr>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

""
"" LOOK AND FEEL
""
syntax enable
set background=dark
colorscheme hybrid
" always display airline (no split needed)
set laststatus=2
let g:airline_powerline_fonts = 0

if has("gui_running")
  if has("mac") || has("macunix")
    set guifont=Anonymous\ Pro:h11
  endif
endif


