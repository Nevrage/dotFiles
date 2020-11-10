if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'sirver/UltiSnips'
Plug 'jalvesaq/Nvim-R' " swissknife for vim and R communicationPlug 'Shougo/unite.vim' " for citation using citation.vim
Plug 'chrisbra/csv.vim' "for viewing data directly in vim R (Nvim-R)
Plug 'junegunn/goyo.vim' "for nice zoom effet when editing, see screenshot below
Plug 'ferrine/md-img-paste.vim' "paste directly image in system clipboard to rmarkdown by putting images in an /img folder (created automatically
call plug#end()


filetype plugin indent on

set completeopt=noinsert,menuone,noselect
set completeopt+=menuone,noselect,noinsert
set shortmess+=c
autocmd BufEnter * call ncm2#enable_for_buffer()



let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=100

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"



au BufNewFile,BufRead *.Rmd set filetype=rmd
autocmd FileType markdown nmap p :call mdip#MarkdownClipboardImage()
autocmd FileType rmd nmap p :call mdip#MarkdownClipboardImage()

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:UltiSnipsExpandTrigger="<c-0>"

" let maplocalleader = ","
let maplocalleader = " "
" the default is , you can also set it to <\space> if you don’t like my setting
" make R starts automatically when .R or .Rmd file open and only starts one time
"autocmd FileType   r if string(g:SendCmdToR) == “function(‘SendCmdToR_fake’)” | call StartR('R') | endif
"autocmd FileType rmd if string(g:SendCmdToR) == “function(‘SendCmdToR_fake’)” | call StartR('R') | endif

" make R vertical split at start
let R_rconsole_width = 57
let R_min_editor_width = 18
" some nice keybindding, D = cursor down one line when finished the code
" localleader+rv = view data, +rg = plot(graphic), +rs = summary, all without sending lines to R buffer, very useful
" Other useful features like Rformat and R RBuildTags aren’t covered here, see Nvim-R for more info.
" useful when in Rmarkdown, send chunk
nmap sc RDSendChunk
" directly send line to R buffer when nothing selected
nmap ss RDSendLine
" st = send test, this function shows the output in comment, since it’s in vim we can simply press u to make the output disappear
nmap st RDSendLineAndInsertOutput
" send selection in visual mode
vmap ss REDSendSelection
" rq would be mapped to RClose so we replace RClearConsole by some random strings
nmap rr RStart
vmap rr RStart
nmap rq RClose
vmap rq RClose
" map ctrl a (all screen) to goyo to have a fullscreen R editing and Rmarkdown writing experience
nmap <LocalLeader>, <Plug>RClearConsole
vmap <LocalLeader>, <Plug>RClearConsole


function! OpenCompletion()
    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction

autocmd InsertCharPre * call OpenCompletion()


autocmd FileType r call StartR('R')
autocmd FileType rmd call StartR('R')
autocmd FileType r imap <bar> %>%
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
