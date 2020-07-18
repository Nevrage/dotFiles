if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
for fpath in split(globpath('~/.vim/', '*.vim'), '\n')
  exe 'source' fpath
endfor

silent! source '~/Scripts/vim2rc'
silent! source '~/.vim2rc'


call plug#end()

autocmd! User goyo.vim echom 'Goyo is now loaded!'
"D - PlugDiff
"S - PlugStatus
"R - Retry failed update or installation tasks
"U - Update plugins in the selected range
"q - Close the window
":PlugStatus
"L - Load plugin
":PlugDiff
"X - Revert the update

command! PU PlugUpdate | PlugUpgrade

let cmdline_app           = {}
let cmdline_external_term_cmd = "xterm -e '%s' &"
let cmdline_follow_colorscheme = 1
let cmdline_app['python'] = 'ptpython3'
let cmdline_app['sh'] = 'bash'

"colorscheme wal

if !exists('$TMUX')
        "let cmdline_external_term_cmd = "xterm -e '%s' &"
        let cmdline_external_term_cmd = "kitty"
endif

let g:gutentags_cache_dir = '~/.vim/tags/'
let g:rout_follow_colorscheme = 1
let g:Rout_more_colors = 1

let g:task_rc_override = 'rc.defaultwidth=0'

set shortmess=I " Read :help shortmess for everything else.
"vmap <C-s> :call system("xclip -selection clipboard", @")<CR>
" map <F7> :w !xclip <CR><CR>
" vmap <F7> "*y
" map <S-F7> :r!xclip -o<CR>
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<cr>
