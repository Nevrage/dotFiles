echom 'R file, here we go'
"https://github.com/jalvesaq/Nvim-R/issues/259
"https://github.com/jalvesaq/Nvim-R/issues/257

let R_in_buffer = 0
"let R_clear_line = 1
let R_applescript = 0 

let R_nvim_wd = 1

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    let R_term_cmd = "open -na /Applications/iTerm.app -n "
  endif
endif

let R_app = "radian" 
let R_cmd = "R" 
let R_hl_term = 0 
let R_args = []  " if you had set any 
let R_bracketed_paste = 1"
let R_start_libs = 'base, stats, graphics, grDevices, utils, methods, tidyverse, plyr, dplyr, forcats, lubridate'
let R_pdfviewer = "mupdf"
let R_csv_app = 'terminal:scim'
let R_csv_delim = ','

if $TMUX != ''
    let R_source = '~/.vim/plugged/Nvim-R/R/tmux_split.vim'
    let R_csv_app = 'tmux new-window scim --txtdelim="\t"'
endif
let R_assign = 0 
let R_args_in_stline = 1

let R_term_cmd = "kitty"
