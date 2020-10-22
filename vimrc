syntax on
filetype plugin indent on

set nocompatible

set cursorline
set hlsearch
set incsearch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set wildmode=list:longest
set laststatus=2
set number
set grepprg=rg\ --vimgrep

let mapleader = ","

set background=dark

call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'airblade/vim-gitgutter'
Plug 'jeffmccune/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'jimenezrick/vimerl'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'lambdatoast/elm.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
call plug#end()

colorscheme solarized

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

" Use Marked 2.app for previewing Markdown files
function! s:setupMarkdownPreview()
  nnoremap <leader>p :silent !open -a 'Marked 2.app' '%:p'<cr>
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
nmap <leader>b :CtrlPBuffer<CR>
let g:ackprg = 'rg --vimgrep --no-heading'
let g:ctrlp_user_command = 'rg --files %s'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
" Improve appearance of vim-gitgutter
sign define dummy
au BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" Improve behavior of vim-copy-as-rtf
let g:html_font = 'DejaVu Sans Mono'
let g:html_number_lines = 0
" Configure markdown code block syntax highlighting
let g:markdown_fenced_languages=['ruby', 'erb=eruby', 'javascript', 'html', 'sh']
" Let's get airline looking pretty
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
