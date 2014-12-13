" be iMproved
set nocompatible

" disable file type detection
filetype off

" make it 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif


" extend runtime path (rpt==runtimepath)
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

""
"" CORE
""
Plugin 'gmarik/Vundle.vim'
" vundle uses git:// instead of https:// when building full path
let g:vundle_default_git_proto = 'git'

Plugin 'mileszs/ack.vim'
"use the platinum searcher instead of ack
let g:ackprg = 'pt --nogroup --nocolor'

" wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-endwise'

" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'
autocmd vimenter * if !argc() | NERDTree | endif

" Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|CVS$\|\.svn$\|target$',
  \ 'file': '\.class$\|\.so$',
  \ }
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 10

" vim plugin to quickly switch between buffers
Plugin 'troydm/easybuffer.vim'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" A fancy start screen for Vim.
Plugin 'mhinz/vim-startify'

" Perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'

Plugin 'scrooloose/nerdcommenter'

" required by vim-textobj-rubyblock
Plugin 'kana/vim-textobj-user'

""
"" GIT
""
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/splice.vim'
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_eager = 0 "run gitgutter only on file read & save

""
"" RUBY
""
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rails'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ecomba/vim-ruby-refactoring'
" A vim plugin for running your Ruby tests
Plugin 'skalnik/vim-vroom'
Plugin 'briancollins/vim-jst'


""
"" GO
""
"Bundle 'fatih/vim-go'
"au FileType go nmap <Leader>i <Plug>(go-info)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)

""
"" HAML
""
Plugin 'tpope/vim-haml'

""
"" COFFEESCRIPT
""
Plugin 'kchmck/vim-coffee-script'

""
"" CSS
""
Plugin 'groenewege/vim-less'

""
"" MARKDOWN
""
Plugin 'tpope/vim-markdown'

""
"" VISUALS
""
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'cocopon/iceberg.vim'
Plugin 'mlitwiniuk/vim-abra'

Plugin 'bling/vim-airline'
" enable airline
let g:airline#extensions#tabline#enabled = 1

""
"" OTHERS
""

"" After all bundles
call vundle#end()
filetype plugin indent on

""
"" CORE SETTINGS
""
set encoding=utf-8

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

set number
set relativenumber
set numberwidth=4

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise

set list
set listchars=tab:▸\ ,eol:¬

" hide buffer, do not abbandon it
set hidden

" disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" F2 saves files
inoremap <F2> <C-O>:update<CR>
nnoremap <F2> :w<CR>

" F3 changes paste mode
set pastetoggle=<F3>

" F4 remapped few lines lower

" save when focus is lost
au FocusLost * :wa

" Ctrl+s saves as well
inoremap <C-S> <C-O>:update<CR>
nnoremap <C-S> :w<CR>

" Ctrl+q enables visual mode
noremap <C-Q> <C-V>

" add some files to ignored
set wildignore+=*.o,*.obj,.git,vendor,*.log,tmp,*~,.sass-cache,*.png,*.jpg,*.gif,public

function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <F4> :call g:ToggleNuMode()<cr>

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

"map <leader>r :so %<CR> " reload opened vim config
" needed only while editing new vimrv
"map <leader>bu :PluginInstall<CR>

" switching between windows
nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" split window vertically and focus new one
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" clear search result highlight
noremap <silent>// :nohls<CR>

" show NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" show CtrlP menu
noremap <leader>p :CtrlP<CR>
" show CtrlP menu for buffer
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

" vroom config
let g:vroom_use_spring = 1
let g:vroom_test_unit_command = 'testunit'

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
colorscheme abra
" always display airline (no split needed)
set laststatus=2
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 0

if has("gui_running")
  if has("mac") || has("macunix")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h11
    " disable scrollbars
    set guioptions-=L
  endif
endif

"" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview


