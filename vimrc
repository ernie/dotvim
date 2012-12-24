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
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c:%m

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
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

au FileType c,cpp,java,php,javascript,ruby,html
  \ au BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Use Marked.app for previewing Markdown files
function! s:setupMarkdownPreview()
  nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown} call s:setupMarkdownPreview()

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Extra plugin configuration
let g:Powerline_symbols = 'fancy'
nmap <leader>b :CtrlPBuffer<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'
