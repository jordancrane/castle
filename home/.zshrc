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

#alias cd to cd+ls
function cd() {
new_directory="$*";
if [ $# -eq 0 ]; then 
   new_directory=${HOME};
fi;
builtin cd "${new_directory}" && ll
}

###### Environment Variables #######
export PATH=$PATH:~/.cargo/bin:/usr/bin/python3
#make vim the default everything
export VISUAL=vim
export EDITOR=$VISUAL
###### Software Engineering II Garbage ######
export PATH=$PATH:/opt/apache-maven-3.3.9/bin

###### AllJoyn Garbage ######
# Edit the .bashrc file to set the environment variables we need for the build process:
export GTEST_DIR=/opt/googletest
export CLASSPATH=/opt/junit-4.12.jar
export ANDROID_NDK=/opt/android-ndk-r10e
export ANDROID_SDK=/opt/Android/Sdk
export BINDINGS=c,cpp,java #This is a scons variable that will be addressed later on
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export WS=off #This *should* be the default option, but explicitly setting it will allow us to avoid the dependency on Uncrustify.
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools:${ANDROID_NDK}
# Security 2.0 is broken
#export SQLITE_DIR=/opt/sqlite3
