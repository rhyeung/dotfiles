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
Plugin 'dense-analysis/ale'

colorscheme nord
highlight Visual ctermbg=DarkGray ctermfg=White

let g:airline_powerline_fonts=1
set relativenumber
set number
set pastetoggle=<F2>

" ====================================================================
" LIGHTWEIGHT ALE CONFIGURATION (SOURCED VIA DWIW-LOADER)
" ====================================================================

" Ensure Vim treats .yml extensions exactly like .yaml files
autocmd BufNewFile,BufRead *.yml setfiletype yaml

" Keep it lazy: Only run validation and formatting when you save (:w)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" Strict settings: Prevent ALE from scanning for random system tools
let g:ale_linters_explicit = 1

" Define exact validation tools (Linters)
let g:ale_linters = {
\   'json': ['jq'],
\   'yaml': ['yamllint'],
\}

" Define exact formatting tools (Fixers)
let g:ale_fixers = {
\   'json': ['jq'],
\   'yaml': ['yamlfmt'],
\}

" Press ]r to jump to the next error, [r to jump back
nmap <silent> ]r <Plug>(ale_next_wrap)
nmap <silent> [r <Plug>(ale_previous_wrap)
