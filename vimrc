call pathogen#infect()

syntax on
filetype plugin indent on

set nocompatible

set cursorline
set hlsearch
set incsearch
set shiftwidth=2
set softtabstop=2
set expandtab
set wildmode=list:longest
set laststatus=2
set number

let mapleader = ","

colorscheme ir_black

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
" set noswapfile                    " Don't use swap files.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" Highlight trailing whitespace
" Stolen from http://stackoverflow.com/questions/356126/
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Strip trailing whitespace
au FileType c,cpp,java,php,javascript,ruby,html au BufWritePre <buffer> :%s/\s\+$//e

let g:Powerline_symbols = 'fancy'
nmap <leader>b :CtrlPBuffer<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
