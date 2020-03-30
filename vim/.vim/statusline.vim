" put git status, column/row number, total lines, and percentage in status
"set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
" highlight the status bar when in insert mode
"if version >= 700
"    au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
"    au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
"endif
"let g:airline_powerline_fonts=1 "Requires powerline fonts!
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:airline#extension#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_nr_show=1
"let g:airline_powerline_fonts=1
