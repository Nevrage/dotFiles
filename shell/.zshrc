source ~/.sh.sh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source ~/.alias.sh
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
setopt correctall
setopt extendedglob
setopt autocd
zstyle :compinstall filename '/home/ylan/.zshrc'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit
prompt paradox
plugins=(
  docker
  docker-compose
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
bindkey -M vicmd v edit-command-line

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
