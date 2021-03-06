" fullcolor in neovim
set termguicolors
" Better display for messages
set cmdheight=1
set modelines=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let g:one_allow_italics = 1
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
silent! colorscheme sonokai

" default updatetime 4000ms is not good for async update
set updatetime=100
" jj returns to normal
inoremap jj <ESC>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Ctrl+s saves as well
inoremap <C-S> <C-O>:update<CR>
nnoremap <C-S> :w<CR>

" Ctrl+q enables visual mode
noremap <C-Q> <C-V>
" clear search result highlight
noremap <silent>// :nohls<CR>

" split window vertically and focus new one
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" Because it's hard to teach old dog new tricks
nnoremap <silent> <leader>p :FZF -m<CR>
nnoremap <silent> <leader>ja :Files app/assets<CR>
nnoremap <silent> <leader>jm :Files app/models<CR>
nnoremap <silent> <leader>jc :Files app/controllers<CR>
nnoremap <silent> <leader>jj :Files app/javascript<CR>
nnoremap <silent> <leader>js :Files spec<CR>
nnoremap <silent> <leader>jv :Files app/views<CR>
nnoremap <silent> <leader>jh :Files app/helpers<CR>
nnoremap <silent> <leader>jl :Files lib<CR>


:nnoremap <F1> <nop>

" NerdTree
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" nerdcommenter
noremap <leader>/ :call NERDComment(0, "invert")<cr>
nnoremap <leader>/ :call NERDComment(0, "invert")<cr>
vnoremap <leader>/ :call NERDComment(0, "invert")<cr>
noremap <D-/> :call NERDComment(0, "invert")<cr>

" whenever changing vim config, reload it on save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,*.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

map <Leader>r :so $MYVIMRC<CR>

" save when focus is lost
au FocusLost * :wa
let g:tmux_navigator_save_on_switch = 2

" vim-prettier config
 nmap <Leader>P <Plug>(Prettier)
