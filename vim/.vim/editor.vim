" TODO: Look up difference between leader and local leader in vim
cmap w!! w !sudo tee % >/dev/null
let maplocalleader = " "
let mapleader = " "
set shortmess+=I
filetype plugin indent on    " required
set nocompatible
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline
set undofile
set undodir=~/.vim/undo/
set incsearch
set autoindent
set tabstop=4
set expandtab
set laststatus=2
set noshowmode
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
"set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set hidden
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set mouse=a
set encoding=utf8
syntax on 
set guifont=DroidSansMono\ Nerd\ Font:h11
set laststatus=2 
set noshowmode
set timeoutlen=500
set foldmethod=indent
highlight Comment cterm=italic

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

set t_Co=256
"set term=xterm-256color

"Buttons for going to previous/next file (buffer)
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
"Show a list of files (buffers) that are open
map <F4> :buffers<CR>
"Yank (copy) contents of current file (buffer) - also to X11 clipboard
map <F5> :%y+<CR>
"Show name of file and path relative to current working directory
map <F6> :echo @%<CR>
"Show current working directory
map <F7> :pwd<CR>
"Close current buffer
map <F12> :bd!<CR>
