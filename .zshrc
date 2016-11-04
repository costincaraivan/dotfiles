export PATH=/bin:/sbin/:/usr/sbin:${PATH}

bindkey -e
# for nice prompts
autoload -U promptinit
promptinit
# prompt bart
zmodload zsh/complist
# set history options
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE=~/.zsh/zsh_history
setopt hist_ignore_dups
setopt appendhistory
setopt share_history
# editor and pager settings
# Fixes aws help on Cygwin.
export PAGER='less -isR'
export EDITOR=vim
# confirm ! commands - to avoid hastily repeating harmful commands
setopt histverify
# turn off console beep
setopt nobeep
# correct both command and parameters
setopt CORRECT
setopt CORRECT_ALL
# hash commands and directories for increasing speed
setopt HASH_CMDS
setopt HASH_DIRS
setopt HASH_LIST_ALL
# when running screen, show the window number in the prompt
if [ x$WINDOW != x ]; then
    export PS1="%m[$WINDOW]%# "
else
    export PS1='[%T]%n@%m:%/>%2'
fi
# don't complete for functions not available
zstyle ':completion:*:functions' ignored-patterns '_*'
# use a cache for slow functions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/zsh_cache
# ignore working directory
zstyle ':complezstyle:*:cd:*' ignore-parents parent pwd
# fuzzy match - allow max 1 error
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# kill PID completion
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
# ignore the files on the command line for autocompletion
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
# completion in the middle of text
bindkey '^i' expand-or-complete-prefix
# aliases
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'

# Fix the Home and End keys.
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char

# find a process and kill it
pskill ()
{
	local pid
	pid=$(ps -e | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "Killing $1 (process $pid).\n"
	kill -9 $=pid
	echo "Process killed."
}
