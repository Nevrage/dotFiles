" Define what filetype to redirect to which extension here
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.Go set filetype=go
au BufRead,BufNewFile *.GO set filetype=go

au BufReadPost *Dockerfile set syntax=sh
au BufReadPost *dockerfile set syntax=sh

autocmd BufNewFile,BufRead buku-edit* set ft=buku
