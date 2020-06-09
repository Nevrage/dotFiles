vnoremap <C-c> *+y
map <C-p> "+p

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost *Xresources, *Xdefaults !xrdb %
