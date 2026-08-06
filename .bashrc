# --------NJS: start default Linux Mint or Debian .bashrc------- #
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

# --------NJS: end default Linux Mint or Debian .bashrc------- #

# --------NJS: start my changes for bash prompt colour------- #
# Terminal colour
# colours taken from https://github.com/vanzsh/gruvbox-color-guide/blob/main/gruvbox-theme-color-palette-guide.pdf 
directory=$(tput setaf 109);
hostname=$(tput setaf 167);
user=$(tput setaf 142);

# see also: https://github.com/CoreyMSchafer/dotfiles/blob/master/.bash_prompt
bold=$(tput bold);
reset=$(tput sgr0);
white=$(tput setaf 229);

PS1="\[${bold}\]"; 
PS1+="\[${user}\]\u"; 
PS1+="\[${white}\] @ ";
PS1+="\[${hostname}\]\h"; 
PS1+="\[${white}\] in ";
PS1+="\[${directory}\]\W"; # working directory
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;
# --------NJS: end my changes for bash prompt colour------- #

# --------NJS: start default Linux Mint or Debian .bashrc------- #
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
# --------NJS: end default Linux Mint or Debian .bashrc------- #


# --------NJS: start my changes, aliases, path changes, env variables etc------- #

# ALIASES ################
# Christmas Tree
alias xmas='/home/njs/Documents/github/ascii-christmas-tree/ascii-christmas-tree'
# Check laptop battery power
alias check_battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep --color=NEVER -e "state" -e "percentage" -e "time"'


# add Orchestra python path
export PYTHONPATH="${PYTHONPATH}:/home/njs/Documents/gehc/orchestra-sdk_3.0.3_linux_python/GERecon/GERecon:/home/njs/Documents/gehc"
# note: first one is the latest Orchestra, second gives us the option to import from PhysioExtract

# PATH CHANGES ################
# add ~/.local/bin
export PATH=/home/njs/.local/bin:${PATH}

# add binaries in /opt/bin
export PATH=/opt/bin:${PATH}

# add ITK-SNAP binaries
export PATH=/opt/itksnap-4.4.0-20250909-Linux-x86_64/bin:${PATH}

# add Matlab binaries
export PATH=/opt/MATLAB/R2025b/bin:${PATH}

# add Slicer path
export PATH=/opt/Slicer-5.6.2-linux-amd64:${PATH}

# occasionally I put things in /opt/bin
export PATH=/opt/bin:${PATH}

# add ChromeDriver
export PATH=/opt/chromedriver_linux64:${PATH}

# add Slicer path
export PATH=/opt/Slicer-5.8.1-linux-amd64:${PATH}

# add from BART startup.sh script
# set environment variables
#export OMP_NUM_THREADS=23
export BART_TOOLBOX_PATH=/home/njs/Documents/codeberg/bart
export PATH="${BART_TOOLBOX_PATH}":"${PATH}"
# bart view (has the same name as /usr/bin/view which links to vim / neovim
export BART_VIEW_PATH=/home/njs/Documents/codeberg/view
export PATH="${BART_VIEW_PATH}":"${PATH}"
# add BART python path
export PYTHONPATH="${PYTHONPATH}":"${BART_TOOLBOX_PATH}/python"

# python path for raw2ismrmrd
export PYTHONPATH="${PYTHONPATH}:/home/njs/Documents/github/raw2ismrmrd/src"

# LaTeX stuff
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:${PATH}
export INFOPATH=$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man

# GEHC and ISMRMRD binaries
export PATH=/home/njs/Documents/gehc/bin:${PATH}
export PATH=/home/njs/Documents/gehc/ismrmrd/bin:${PATH}
export PATH=/home/njs/Documents/gehc/ge-tools/bin:${PATH}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/njs/Documents/gehc/ge-tools/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/njs/Documents/gehc/ismrmrd/lib

# Python UV shell completion
if [ -x "$(command -v uv)" ]; then
		eval "$(uv generate-shell-completion bash)"
		eval "$(uvx --generate-shell-completion bash)"
fi

# golang
export PATH=$PATH:/usr/local/go/bin

# zig
export PATH=$PATH:/opt/zig

# ANTS binaries
export PATH=$PATH:/opt/ants-2.6.3/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/njs/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/njs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/njs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/njs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Japanese input on Wayland (Sway)
export XMODIFIERS=@im=fcitx
#export QT_IM_MODULE=fcitx

# Apptainer cache and tmp directories
export APPTAINER_CACHEDIR=/home/njs/Apptainer/cache
export APPTAINER_TMPDIR=/home/njs/Apptainer/tmp

# --------NJS: end my changes------- #
# NJS: TO DO
# Automatically determine versions of binaries in /opt for Matlab, ANTS etc - don't hard-code!

# Not sure where this came from so commenting it...
# . "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"
