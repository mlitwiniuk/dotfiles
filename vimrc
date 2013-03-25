"Bundle 'flazz/vim-colorschemes'
"Bundle 'pangloss/vim-erlang'
Bundle 'airblade/vim-gitgutter'

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set relativenumber
set numberwidth=4

let mapleader = ","


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

au FocusLost * :wa

nnoremap <leader>w <C-w>v<C-w>l


nnoremap H <C-w>h
nnoremap L <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l



set wildignore+=*.o,*.obj,.git,vendor,*.log,tmp,*~,.sass-cache,*.png,*.jpg,*.gif,public


map   <silent> <F5> mmgg=G'm
imap  <silent> <F5> <Esc> mmgg=G'm

vnoremap < <gv
vnoremap > >gv



" vim conque plugin
let g:ruby_conque_rspec_command='bundle exec rspec'

" theme // appearance
if has("gui_running")
  if has("mac") || has("macunix")
    "set guifont=Menlo\ Regular:h11
    set guifont=Source\ Code\ Pro\ Light:h10
    "set guifont=Inconsolata-g:h9.5
  else
    "set guifont=Monaco\ for\ Powerline\ 8
    set guifont=Meslo\ LG\ S\ 9
    " COPY / PASTE IN LINUX
    "nmap <C-V> "+gP
    nmap <C-V> "+p
    imap <C-V> <ESC><C-V>i
    vmap <C-C> "+y
    " Disable visual bell
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=
  endif
  colorscheme molokai
  color molokai
  "set background=light
  set background=dark
else
  " colorscheme badwolf
  " color badwolf
  colorscheme atom
  color atom
  set background=dark
endif
map <F6> :let &background = ( &background == "dark"? "light" : "dark" )<CR>


" ctrlp plugin config
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.sass-cache$|\-svn$|vendor$\|system$\|uploads$\|\.jpg$\|\.png$\|public$'
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 10

" Additional mapping for buffer search
nnoremap ,b :CtrlPBuffer<CR>
"nnoremap <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<CR>


" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,ja :CtrlP app/assets<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP factories<CR>
map ,jT :CtrlP test<CR>

"Cmd-(m)ethod - jump to a method (tag in current file)
map ,m :CtrlPBufTag<CR>

"Ctrl-(M)ethod - jump to a method (tag in all files)
map ,M :CtrlPBufTagAll<CR>

" Clear search results
noremap <silent>// :nohls<CR>

" NERDTree
unmap <C-u>
nnoremap <C-n> :NERDTreeToggle<CR>

" Nerd commenter
map <leader>/ :call NERDComment(0, "invert")<cr>
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>
map <D-/> :call NERDComment(0, "invert")<cr>

" unmap <leader>po (paste from OS)
unmap <leader>po
" unmap all <leader>p commands
unmap <leader>p
unmap <leader>pp
" unmap app <leader>b commands
unmap <leader>bp
unmap <leader>bn
unmap <leader>bd


map <leader>p :CtrlP<CR>


" Y should behave like desired
unmap Y

" saves for vim / gvim
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_enabled = 0
autocmd VimEnter * let g:yankring_history_dir = '~/.vim/tmp'


"let g:ctrlp_user_command = 'mdfind -onlyin %s file'

let g:ackprg = 'ag --nogroup --nocolor --column'



" folding for ruby
au FileType ruby setlocal foldmethod=syntax