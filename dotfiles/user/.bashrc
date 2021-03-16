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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
#force_color_prompt=yes

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
   # PS1='\e[0;32m❛\u™❜\e[0;33m ⚚ \h \e[0;35m ☛ \w \e[0m\n➾ '
    # PS1='\e[0;38;5;148m❛\u™❜\e[0;38;5;208m ⚚ \h \e[0;38;5;81m ☛ \w \e[0;38;5;141m⎇ $(__git_ps1 "[%s]") \e[0m\n➾  ' # commented to accomodate git_prompt
    PS1='\e[0;38;5;148m❛\u™❜\e[0;38;5;208m ⚚ \h \e[0;38;5;81m ☛ \w \e[0m\n➾  '
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
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    eval "$(dircolors ~/.dircolors.monokai)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias l='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias ll='ls -lart'
#GIT alias
alias gs='git status'
alias gd='git diff'
alias gvd='git d'
alias ga='git add'
alias gc='git commit -m'
alias gk='git checkout'
alias vi='vim'

FILE=/home/centos/.vscode-server/data/Machine/settings.json
if test -f "$FILE"; then
    # sed -i "s/f2e5bc/262626/g" $FILE
    sed -i "s/\"Gruvbox Dark Hard\"/\"Monokai Pro (Filter Spectrum)\"/g" $FILE
    # gruvbox dark hard
    # sed -i "s/1d2021/262626/g" $FILE
    # sed -i "s/\"Gruvbox Dark Hard\"/\"Monokai Pro (Filter Spectrum)\"/g" $FILE
fi

# source ~/git-prompt.sh
# GIT PROMPT Configurations

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
# GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

GIT_PROMPT_START='\e[0;38;5;148m❛\u™❜\e[0;38;5;208m ⚚ \h \e[0;38;5;81m ☛ \w\e[0m ' # uncomment for custom prompt start sequence
GIT_PROMPT_END='\e[0m\n➾  ' # uncomment for custom prompt end sequence
GIT_PROMPT_ONLY_IN_REPO=1

# as last entry source the gitprompt script
GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Chmike # use theme optimized for solarized color scheme

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

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

## OLD .bashrc
# if [[ $(uname | grep 'Linux') = *Linux* ]];
# then
# export PS1='\e[0;32m\u\e[0;33m@\h \e[0;35m\w \e[0;36m$(__git_ps1 "[%s]")\e[0m \n:> '
# else
# export PS1='\e[0;32m\u\e[0;31m@\h \e[0;35m\w \e[0;36m$(__git_ps1 "[%s]")\e[0m
# :> '
# fi
# source ~/git-prompt.sh
# export TERM="xterm-256color"
# export LESS=FRX
# alias .....='cd ../../../../..'
# alias ....='cd ../../../..'
# alias ...='cd ../../..'
# alias ..='cd ../..'
# alias l='ls -la'

#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline
#echo -e -n "\x1b[\x34 q" # changes to steady underline
echo -e -n "\x1b[\x35 q" # changes to blinking bar
#echo -e -n "\x1b[\x36 q" # changes to steady bar
