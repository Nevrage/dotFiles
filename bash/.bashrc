# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything

case $- in
    *i*) ;;
          *) return;;
  esac

  # don't put duplicate lines or lines starting with space in the history.
  # See bash(1) for more options

  HISTCONTROL=ignoreboth

  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000


  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  # If set, the pattern "**" used in a pathname expansion context will
  # match all files and zero or more directories and subdirectories.
  #shopt -s globstar


  # make less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



  # set variable identifying the chroot you work in (used in the prompt below)

  if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then

	      debian_chroot=$(cat /etc/debian_chroot)

      fi



      # set a fancy prompt (non-color, unless we know we "want" color)

      case "$TERM" in

	          xterm-color|*-256color) color_prompt=yes;;

	  esac



	  # uncomment for a colored prompt, if the terminal has the capability; turned

	  # off by default to not distract the user: the focus in a terminal window

	  # should be on the output of commands, not on the prompt

	  force_color_prompt=yes



	  if [ -n "$force_color_prompt" ]; then

		      if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then

			      	# We have color support; assume it's compliant with Ecma-48

					# (ISO/IEC-6429). (Lack of such support is extremely rare, and such

						# a case would tend to support setf rather than setaf.)

							color_prompt=yes

							    else

								    	color_prompt=

									    fi

								    fi



								    if [ "$color_prompt" = yes ]; then

									        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

									else

										    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

									    fi

									    unset color_prompt force_color_prompt



									    # If this is an xterm set the title to user@host:dir

									    case "$TERM" in

										    xterm*|rxvt*)

											        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

												    ;;

											    *)

												        ;;

												esac



												# enable color support of ls and also add handy aliases

												if [ -x /usr/bin/dircolors ]; then

													    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

													        alias ls='ls --color=auto'

														    #alias dir='dir --color=auto'

														        #alias vdir='vdir --color=auto'



															    alias grep='grep --color=auto'

															        alias fgrep='fgrep --color=auto'

																    alias egrep='egrep --color=auto'

															    fi



															    # colored GCC warnings and errors

															    #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



															    # some more ls aliases

															    alias ll='ls -alF'

															    alias la='ls -A'

															    alias l='ls -CF'



															    # Add an "alert" alias for long running commands.  Use like so:

															    #   sleep 10; alert

															    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'



															    # Alias definitions.

															    # You may want to put all your additions into a separate file like

															    # ~/.bash_aliases, instead of adding them here directly.

															    # See /usr/share/doc/bash-doc/examples in the bash-doc package.



															    if [ -f ~/.bash_aliases ]; then

																        . ~/.bash_aliases

																fi



																# enable programmable completion features (you don't need to enable

																# this, if it's already enabled in /etc/bash.bashrc and /etc/profile

																# sources /etc/bash.bashrc).

																if ! shopt -oq posix; then

																	  if [ -f /usr/share/bash-completion/bash_completion ]; then

																		      . /usr/share/bash-completion/bash_completion

																		        elif [ -f /etc/bash_completion ]; then

																				    . /etc/bash_completion

																				      fi

																			      fi



alias aws1="ssh -i ~/Desktop/AwsCertificate.pem ubuntu@ec2-35-161-103-183.us-west-2.compute.amazonaws.com"

alias aws2="ssh ylan@ec2-52-27-39-51.us-west-2.compute.amazonaws.com"

alias LS="ls -acgilnpLt"

alias hangups="hangups --col-scheme solarized-dark"



# color names for readibility

# reset=$(tput sgr0)
# 
# bold=$(tput bold)
# 
# black=$(tput setaf 1)
# 
# red=$(tput setaf 5)
# 
# grey=$(tput setaf 4)
# 
# green=$(tput setaf 6)
# 
# yellow=$(tput setaf 2)
# 
# blue=$(tput setaf 7)
# 
# white=$(tput setaf 1)

[ "$UID" -eq 0 ] && { user_color=$red; }


# get current branch in git repo

function parse_git_branch() {

		BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

			if [ ! "${BRANCH}" == "" ]

					then

								STAT=`parse_git_dirty`

										echo "[${BRANCH}${STAT}]"

											else

														echo ""

															fi

														}



														# get current status of git repo

function parse_git_dirty {

status=`git status 2>&1 | tee`
dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
bits=''
if [ "${renamed}" == "0" ]; then
bits=">${bits}"
fi
if [ "${ahead}" == "0" ]; then

																																bits="*${bits}"

																																	fi

																																		if [ "${newfile}" == "0" ]; then

																																					bits="+${bits}"

																																						fi

																																							if [ "${untracked}" == "0" ]; then

																																										bits="?${bits}"

																																											fi

																																												if [ "${deleted}" == "0" ]; then

																																															bits="x${bits}"

																																																fi

																																																	if [ "${dirty}" == "0" ]; then

																																																				bits="!${bits}"

																																																					fi

																																																						if [ ! "${bits}" == "" ]; then

																																																									echo " ${bits}"

																																																										else

																																																													echo ""
fi

}



function reloadi3() {
killall polybar
xrdb -merge ~/.cache/wal/colors.Xresources
i3-msg reload
i3-msg restart
}
ansi()          { echo -e "\e[${1}m${*:2}\e[0m"; }
bold()          { ansi 1 "$@"; }
italic()        { ansi 3 "$@"; }

# export PS1="\[$(tput setaf 1)\][\[$(tput setaf 2)\]\A\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\h\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\W\[$(tput setaf 1)\]]\[$(tput sgr0)\] \`parse_git_branch\` \[$reset\]\n\[$green\] > \[$black\]"

 export PS1="┌──\[\e[35m\]\u\[\e[m\]\[\e[31;40m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[31;40m\]\\$\[\e[m\]\W\[\e[30;47m\]\`parse_git_branch\`\[\e[m\]\n└─╼ "

set -o vi
alias c='clear'
alias aa="ranger"
alias update="sudo pacman -Syu --noconfirm"
alias upgrade="sudo apt upgrade"
alias install="sudo apt install -y"
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias .="pwd && pwd | pbcopy"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias v="vim"
alias df='df -H'
alias du='du -ch'
alias h='history'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bashpro='vim ~/.bash_profile'
alias rpro='vim ~/.Rprofile'
alias e='exit'
alias pipes='pipes -p 10 -s 5 -R'
alias music='ncmpcpp'
alias fontlists='fc-list | col | sort'

alias untar='tar -zxvf'

alias server='python -m SimpleHTTPServer &'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias vm="/usr/local/Cellar/vim/8.0.1400_4/bin/vim"
alias start_portainer="docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer"

export EDITOR='vim'
export VISUAL='vim'


(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
alias neofetch="neofetch --w3m"


alias todd="todd ~/Files/Data/todo/todo.txt"
alias dlytmp3="youtube-dl --extract-audio --audio-format mp3"
PATH="$HOME/bin:$PATH"

alias ww="ranger --cmd=tmsu_init"
alias s="ls_extended"
alias etd="v ~/Files/Data/todo/todo.txt" 
alias insta="export PATH=$PATH:$(pwd)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

include () {
    [[ -f "$1" ]] && source "$1"
}


QR () {
        qrencode "$@" -d 300 -s 20  -o /tmp/qr.png && sxiv /tmp/qr.png
}

# include FILE
if [ -f /path/to/some/file ]; then
    source /path/to/some/file
fi

FILE=/path/to/some/file && test -f $FILE && source $FILE

source /home/ylan/.bash2rc 2> /dev/null
test -f $FILE && source $FILE

tsks() {
        tasks $* | grep -P --colour=always '(?:^|(?<=[\\, ;\-\+\*\/]))[-+]?[0-9]*[\.eE]?[0-9]+|$'
}



export PATH="$PATH:$HOME/Scripts"

X=$( pidof Xorg )
if [ ${#X} -gt 0 ]; then
    echo ""
else
        ~/.profile
fi
clear
# cat index.html | grep -o '<a .*href=.*>' | sed -e 's/<a /\n<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'"'"'"]"'"'"']'
alias vz='vim $(locate home | fzf)'
alias vzz='vim "$(fzf)"'
alias watsh='watch -c -t \"!!\"'
alias i3="vim ~/.config/i3/config"
alias vg="vim +Goyo "
alias sh="stow -t ~"
alias torrent="stig set connect.host $torrent"
alias d="kitty +kitten diff"
alias icat="kitty +kitten icat"
