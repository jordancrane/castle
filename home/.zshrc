#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

###### Tmux ######
#start tmux or connect to existing session
if [[ -z "$TMUX" ]]; then
  tmux has-session &> /dev/null
  if [ $? -eq 1 ]; then
    exec tmux -2 new
    exit
  else
    exec tmux -2 attach
    exit
  fi
fi

###### Startup ######
#loads a proper fortune spoken from the true sage
fortune | cowthink

#prepend secret comands with a space
setopt histignorespace

###### Aliases ######
#tmux with 256 colors
alias tmux="tmux -2"
#shortenings
alias c="clear"
alias s="git status"
alias ak="ack-grep"
#vim server mode
alias vims="vim --servername vim-server"
alias vimr="vim --servername vim-server --remote "
#who needs more than 3 pings?
alias ping="ping -c 3"
#can't remember the correct shebang
alias shebang='echo "#!/usr/bin/env bash"'

#alias cd to cd+ls
function cd() {
new_directory="$*";
if [ $# -eq 0 ]; then
   new_directory=${HOME};
fi;
builtin cd "${new_directory}" && ll
}

###### Environment Variables #######
export PATH=$PATH:~/.cargo/bin:/usr/bin/python3:~/scripts
#make vim the default everything
export VISUAL=vim
export EDITOR=$VISUAL
export GTEST_DIR=/opt/googletest
