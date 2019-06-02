" be iMproved
set nocompatible

" speed up redrawing??
set lazyredraw

set ttyfast

" disable file type detection
filetype off

" make it 256 colors
set t_Co=256
" enable 24 bit color support
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
if has('nvim')
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end

" Adjust keycode timeout length
set ttimeoutlen=100

" Let backspace behave... normally
set backspace=2

" neovim hacks
" NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
  set matchtime=0
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
"use the silver searcher instead of ack
let g:ackprg = 'ag --vimgrep'

" wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plugin 'tpope/vim-endwise'

" quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat' " To repeat surrounds

" Copy yanked text to clipper / clipboard automatically
Plugin 'wincent/vim-clipper'
let g:ClipperAuto=1

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'
"autocmd vimenter * if !argc() | NERDTree | endif


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" vim plugin to quickly switch between buffers
Plugin 'troydm/easybuffer.vim'

Plugin 'scrooloose/nerdcommenter'

" required by vim-textobj-rubyblock
Plugin 'kana/vim-textobj-user'

" Universal ctags / gutentgs
Plugin 'ludovicchabant/vim-gutentags'

" tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_sort = 1
let g:tagbar_case_insensitive = 1
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }


" fzf - use that for ctags
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
nnoremap _ :Tags<CR>

" Alignment
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Indentation
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5

" Helpers for UNIX
Plugin 'tpope/vim-eunuch'

" implementation of the PlainTasks forma
Plugin 'elentok/plaintasks.vim'

Plugin 'djoshea/vim-autoread'
""
"" GIT
""
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 0 "run gitgutter only on file read & save
let g:gitgutter_enabled = 1

""
"" LANGUAGE SUPPORT
""
Plugin 'vim-syntastic/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_quiet_messages = { "level": "warnings" }

""
"" COFFEE SCRIPT
""
Plugin 'kchmck/vim-coffee-script'

""
"" CRYSTAL
""
Plugin 'rhysd/vim-crystal'


""
"" JAVASCRIPT
""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

""
"" GO
""

""
"" RAILS
""
Plugin 'vim-ruby/vim-ruby'
Plugin 'keith/rspec.vim'
Plugin 'tpope/vim-rails'
""
"" YAML
""
Plugin 'digitalrounin/vim-yaml-folds'

" omni completion settings
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1


""
"" VISUALS
""
Plugin 'chriskempson/base16-vim'


" enable airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_section_c = "%t"
let g:airline_powerline_fonts=1
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ryanoasis/vim-devicons'

let g:airline_powerline_fonts = 1

""
"" TMUX
""
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'sjl/vitality.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tmux-plugins/vim-tmux-focus-events'

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
"autocmd GUIEnter * set visualbell t_vb=

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
set colorcolumn=80

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

" jj returns to normal
inoremap jj <ESC>

" disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" F2 saves files
inoremap <F2> <C-O>:update<CR>
nnoremap <F2> :w<CR>

" F3 changes paste mode
set pastetoggle=<F3>

" F4 remapped few lines below

" save when focus is lost
au FocusLost * :wa

" Ctrl+s saves as well
inoremap <C-S> <C-O>:update<CR>
nnoremap <C-S> :w<CR>

" Ctrl+q enables visual mode
noremap <C-Q> <C-V>

" add some files to ignored
set wildignore+=*.o,*.obj,.git,vendor,*.log,tmp,*~,.sass-cache,*.png,*.jpg,*.gif,public,coverage

function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <F4> :call g:ToggleNuMode()<cr>

function! g:ToggleBackground()
  if(&background == 'dark')
    set background=light
  else
    set background=dark
  endif
endfunction
nnoremap <F6> :call g:ToggleBackground()<cr>

autocmd BufWritePre * :%s/\s\+$//e


set foldlevelstart=1
set foldmethod=syntax
au FileType ruby setlocal foldmethod=syntax
set eol

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

map <leader>r :so ~/.vimrc<CR> " reload opened vim config
" needed only while editing new vimrv
"map <leader>bu :PluginInstall<CR>

" switching between windows
nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap J <C-w>j
nnoremap K <C-w>k
" those are maintained by vim-tmux-navigator
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"if has('nvim')
  "nmap <bs> :<c-u>TmuxNavigateLeft<cr>
"endif

" split window vertically and focus new one
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" clear search result highlight
noremap <silent>// :nohls<CR>

" show NERDTree
noremap <leader>n :NERDTreeToggle<CR>
" NerdTree configuration
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Fuzzy file, buffer, mru, tag, etc finder.
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
"nmap <Leader>m :Files app/models/<CR>
noremap <leader>b :Buffers<CR>
" Rails pecific mappings
map <leader>jm :Files app/models<CR>
map <leader>jc :Files app/controllers<CR>
map <leader>jv :Files app/views<CR>
map <leader>jh :Files app/helpers<CR>
map <leader>jl :Files lib<CR>
map <leader>ja :Files app/assets<CR>
map <leader>jp :Files public<CR>
map <leader>js :Files spec<CR>
map <leader>jsc :Files spec/controllers<CR>
map <leader>jsm :Files spec/models<CR>
map <leader>jsf :Files spec/features<CR>
map <leader>jf :Files fast_spec<CR>
map <leader>jd :Files db<CR>
map <leader>jC :Files config<CR>
map <leader>jV :Files vendor<CR>
map <leader>jF :Files factories<CR>
map <leader>jT :Files test<CR>

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


"let g:airline_theme='material'
let g:airline_theme='kalisi'
if $TERM_ORIG != "konsole"
  " As a work around for the following bugs in kde4's konsole:
  "   use the output of 16.colorscheme.rb and don't set base16colorspace.
  "   base-shell script will not be called
  " https://github.com/chriskempson/base16-shell/issues/31
  " https://bugs.kde.org/show_bug.cgi?id=344181
  let base16colorspace=256
  if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
  endif
else
endif


" always display airline (no split needed)
set laststatus=2
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1

set guifont=Knack\ Nerd\ Font\ Font\ Mono\ Regular\ 10
if has("gui_running")
  if has("mac") || has("macunix")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h11
    " disable scrollbars
    set guioptions-=L
  endif
else
  autocmd BufEnter * set relativenumber
endif

"" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"" Thyme
nmap <leader>t :silent !thyme -d<cr>

set guicursor=n-c:block,i-ci-ve:ver40,r-cr-v:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
" cursor shape mode dependent (add +1 to stop from blinking)
" if exists('$TMUX')
if strlen($TMUX)
  if $TERM_ORIG != 'konsole'
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  end
else
  if $TERM_ORIG != 'konsole'
    let &t_SI = "\<Esc>[5 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
  endif
endif


if has("mac") || has("osx")
  " OSX
  " copy using clipper
  " `brew install clipper`
  " yanked text is automatically copied to clipboard via vim-clipper plugin
else
  " Copy to X CLIPBOARD
  vmap <leader>y :w !xsel -b<CR>
  nmap <leader>y :.w !xsel -b<CR>
end

