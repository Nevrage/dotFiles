set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"Plugin 'seletskiy/vim-pythonx'
Plugin 'mboughaba/i3config.vim'
Plugin 'johngrib/Vim-Game-Snake'
Plugin 'johngrib/vim-game-code-break'
Plugin 'jalvesaq/vimcmdline'
Plugin 'kurkale6ka/vim-chess'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'l04m33/vlime', {'rtp': 'vim/'}
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'Shougo/unite.vim'
Plugin 'spf13/vim-autoclose'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tex/vimpreviewpandoc'
Plugin 'vim-scripts/applescript.vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jalvesaq/Nvim-R'
Plugin 'ervandew/screen'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
" Plugin 'francoiscabrol/ranger.vim'
Plugin 'airblade/vim-accent'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/textutil.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/csv.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'jimhester/lintr.git'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'stevearc/vim-arduino'
Plugin 'freitass/todo.txt-vim'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'rafaqz/ranger.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'liuchengxu/vim-which-key'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'ujihisa/repl.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'Shougo/vimproc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"set pyxversion=3
set shortmess+=I
filetype plugin indent on    " required
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set number
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
"set cursorline                    " highlight current line
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
let R_in_buffer = 0
"let R_clear_line = 1
let R_applescript = 0 
nmap <silent> <C-D> :NERDTreeToggle<CR>
imap <silent> <C-D> :NERDTreeToggle<CR>
set omnifunc=syntaxcomplete
au BufReadPost *Dockerfile set syntax=sh
au BufReadPost *dockerfile set syntax=sh
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
"autocmd VimEnter * NERDTree

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
" highlight the status bar when in insert mode
if version >= 700
    au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
    au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif
cmap w!! w !sudo tee % >/dev/null

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

"set colorcolumn=80
" set up some custom colors
"highlight clear SignColumn
"highlight VertSplit    ctermbg=236
"highlight ColorColumn  ctermbg=237
"highlight LineNr       ctermbg=236 ctermfg=240
"highlight CursorLineNr ctermbg=236 ctermfg=240
"highlight CursorLine   ctermbg=236
"highlight StatusLineNC ctermbg=238 ctermfg=0
"highlight StatusLine   ctermbg=240 ctermfg=12
"highlight IncSearch    ctermbg=3   ctermfg=1
"highlight Search       ctermbg=1   ctermfg=3
"highlight Visual       ctermbg=3   ctermfg=0
"highlight Pmenu        ctermbg=240 ctermfg=12
"highlight PmenuSel     ctermbg=3   ctermfg=1
"highlight SpellBad     ctermbg=0   ctermfg=1
"set autoindent                    " set auto indent
"set ts=2                          " set indent to 2 spaces
"set t_Co=256
colorscheme wal

let g:airline_powerline_fonts=1 "Requires powerline fonts!



let R_nvim_wd = 1
syntax on 
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font:h11

let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_pandoc=1

let maplocalleader = " "
let mapleader = " "
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" autocmd FileType r call cm#enable_for_buffer() | sleep 300m | let g:_cm_sources['R']['sort'] = 0

Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'gaalcaras/ncm-R'

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    let R_term_cmd = "open -na /Applications/iTerm.app -n "
  endif
endif

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
"nnoremap <C-W> :SyntasticCheck<CR>
" let g:syntastic_quiet_messages = { 'type': 'closed_curly_linter'  }
let g:airline#extension#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
set laststatus=2 
set noshowmode
set timeoutlen=500
let g:airline_powerline_fonts=1




let R_app = "radian" 
let R_cmd = "R" 
let R_hl_term = 0 
let R_args = []  " if you had set any 
let R_bracketed_paste = 1"

let g:ctrlp_open_new_file = 'r'
let g:gutentags_cache_dir = '~/.vim/tags/'


map <C-S> :SyntasticToggleMode<CR>

set shortmess=I " Read :help shortmess for everything else.
let R_start_libs = 'base, stats, graphics, grDevices, utils, methods, tidyverse, plyr, dplyr, forcats, lubridate'
let R_pdfviewer = "mupdf"

let R_csv_app = 'terminal:scim'
let R_csv_delim = ','

let g:arduino_dir = '~/Arduino'
let g:arduino_dir = '/usr/local/share/arduino'
nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

let cmdline_app           = {}
let cmdline_external_term_cmd = "xterm -e '%s' &"
let cmdline_follow_colorscheme = 1
let cmdline_app['python'] = 'ptpython3'
let cmdline_app['sh'] = 'bash'


Plugin 'sirver/UltiSnips'"

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetsDir='~/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:task_rc_override = 'rc.defaultwidth=0'


map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@

if !exists('$TMUX')
        let cmdline_external_term_cmd = "xterm -e '%s' &"
endif

if $TMUX != ''
    let R_source = '~/.vim/bundle/Nvim-R/R/tmux_split.vim'
    let R_csv_app = 'tmux new-window scim --txtdelim="\t"'
endif




let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

noremap Q !!$SHELL <CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let R_assign = 0 
let R_args_in_stline = 1

xnoremap <leader>c <esc>:'<,'>:w !bash<CR>
set foldmethod=indent
autocmd FileType markdown setlocal spell
autocmd FileType mail setlocal spell

highlight Comment cterm=italic

