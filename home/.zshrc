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
# start tmux
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

#loads a proper fortune spoken from the true sage
fortune | cowthink

alias tmux="tmux -2"
alias c="clear"
alias s="git status"
alias ak="ack-grep"
alias vims="vim --servername vim-server"
alias vimr="vim --servername vim-server --remote "

#alias cd to cd+ls
function cd() {
new_directory="$*";
if [ $# -eq 0 ]; then 
   new_directory=${HOME};
fi;
builtin cd "${new_directory}" && ll
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-eighties-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Make vim the default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Edit the .bashrc file to set the environment variables we need for the build process:
export GTEST_DIR=~/build-tools/googletest
export CLASSPATH=~/build-tools/junit-4.12.jar
export ANDROID_NDK=~/build-tools/android-ndk-r10e
export SQLITE_DIR=~/build-tools/sqlite3
export BINDINGS=c,cpp,java #This is a scons variable that will be addressed later on
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export WS=off #This *should* be the default option, but explicitly setting it will allow us to avoid the dependency on Uncrustify.
export PATH=$PATH:~/.cargo/bin:/usr/bin/python3
