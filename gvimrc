syntax enable
set background=dark
colorscheme hybrid
set guifont=Anonymous\ Pro\ for\ Powerline\ Bold\ 10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" CTRL-X is Cut
vnoremap <C-X> "+x

" CTRL-C is Copy
vnoremap <C-C> "+y

" CTRL-V is Paste
map <C-V> "+gP
imap <C-V> <C-O>"+gP<CR>

cmap <C-V> <C-R>+

