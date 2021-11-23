export PATH=/usr/local/bin:$PATH

export PATH=$PATH:/opt/local/bin

export BASH_SILENCE_DEPRECATION_WARNING=1

alias sublime="open -a /Applications/Sublime\ Text.app"

# Terminal colour
# colours taken from https://github.com/shannonmoeller/vim-monokai256/blob/master/colors/monokai256.vim
directory=$(tput setaf 81);
hostname=$(tput setaf 161);
user=$(tput setaf 118);

# see also: https://github.com/CoreyMSchafer/dotfiles/blob/master/.bash_prompt
bold=$(tput bold);
reset=$(tput sgr0);
white=$(tput setaf 15);

PS1="\[${bold}\]"; 
PS1+="\[${user}\]\u"; 
PS1+="\[${white}\] @ ";
PS1+="\[${hostname}\]\h"; 
PS1+="\[${white}\] in ";
PS1+="\[${directory}\]\W"; # working directory
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;
