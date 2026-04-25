source ~/.vim/dwiw-loader.vim

" show existing tab with 4 spaces width
" set tabstop=4
" when indenting with '>', use 4 spaces width
" set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
let mapleader = ","
imap jk <esc>

" Vertical bar in insert mode (solid), block in normal mode (solid)
let &t_SI = "\<Esc>[6 q"   " Insert mode - vertical bar
let &t_EI = "\<Esc>[2 q"   " Normal mode - block
" Optional: also set replace mode
let &t_SR = "\<Esc>[4 q"   " Replace mode - underline

Plugin 'easymotion/vim-easymotion'
Plugin 'arcticicestudio/nord-vim'

colorscheme nord
highlight Visual ctermbg=DarkGray ctermfg=White

let g:airline_powerline_fonts=1
set relativenumber
set number
set pastetoggle=<F2>
