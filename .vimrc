set nocompatible                " Turn off compatibility mode

call plug#begin('~/vim/plugged')
"-- Themes
Plug 'jacoborus/tender'
Plug 'itchyny/lightline.vim'
"-- Checkers
Plug 'maralla/validator.vim'
"-- Autocompleters
Plug 'Shougo/neocomplete.vim'
Plug 'Raimondi/delimitMate'
"-- Fix white space
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

"-- General Settings --
set history=1000                " How big the history should be
set backspace=indent,eol,start  " Fix backspace key
set ruler                       " Tell what line, col cursor is at
set number                      " Show line numbers on left
set showcmd                     " Display current command and other info
set incsearch                   " Start searching after you type anything
set hlsearch                    " Highlight found search words
set showmatch                   " Show matching parens
set expandtab                   " Expand tabs into spaces
set tabstop=2                   " Each tab = n spaces
set shiftwidth=4                " Each indentation is n spaces
set autoindent                  " Self-explanatory
set smartindent                 " Smart indentation
set mouse=a                     " Enable mouse interaction
set laststatus=2                " Enable bottom bar for lightline
set noshowmode                  " Hides the plaintext mode description

" Save undo info into a dir under .vim
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir     " Set the undo directory
set undofile                    " Turn on saving undo info

" Search settings
nnoremap / /\v
vnoremap / /\v
set ignorecase                  " Ignore case
set smartcase                   " Dont ignore case when non lower case

" Wrap formatting settings
set wrap                        " Turn line wrapping on
set textwidth=82                " Text can be this long before wrap
set formatoptions=qrn1          " Format options, :help fo-table
set colorcolumn=85              " Color col 85


" Things to make vim behave with filetypes
syntax on
filetype on
" au BufNewFile,BufRead *.<filetype here> set filetype=<filetypehere>
filetype indent on
filetype plugin on
filetype plugin indent on

if exists('&breakindent')
    set breakindent             " Indent wrapped lines up to the same level
endif

" Press escape to cancel search:
nnoremap <leader> <space> :nohlsearch<Bar>:echo<CR>

"-- Theme Settings
" If vim >= 8.0 use termguicolors
if(has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme tender
" Setting lightline theme, requires a powerline font
let g:lightline = {
            \ 'colorscheme': 'tender',
            \ 'component': { 'readonly': '%{&readonly?"":""}'},
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }
" Todo: Transparency Settings
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
"--

" neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ----- Convenience commands -----
"
" --- Commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Force write to readonly files using sudo
command! WS w !sudo tee %

