source ~/.sh.sh
source ~/.alias.sh
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
setopt correctall
zstyle :compinstall filename '/home/ylan/.zshrc'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit
prompt paradox
setopt correctall
setopt extendedglob
setopt autocd
plugins=(
  git
  bundler
  osx
  rake
  rbenv
  dotenv
  ruby
  )

fpath+=~/.zsh
source ~/Scripts/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle momo-lab/zsh-abbrev-alias
antigen bundle desyncr/auto-ls
#antigen bundle gretzky/auto-color-ls
antigen bundle hlissner/zsh-autopair
antigen bundle chrissicool/zsh-bash
antigen bundle adolfoabegg/browse-commit
antigen bundle arzzen/calc.plugin.zsh
antigen bundle mollifier/cd-gitroot
antigen bundle bartboy011/cd-reminder
antigen bundle MikeDacre/cdbk
# antigen bundle wwilsman/zsh-clean-project
#antigen bundle zuxfoucault/colored-man-pages_mod
#antigen bundle Tarrasch/zsh-colors
antigen bundle jsks/czhttpd
antigen bundle Vifon/deer

antigen apply
autoload -U deer
zle -N deer
# bindkey '^K' deer

bindkey -v
