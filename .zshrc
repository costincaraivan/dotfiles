OS=$(uname)
if [[ "$OS" != "Darwin" ]]
then
	export PATH=~/.local/bin:/bin:/sbin/:/usr/sbin:${PATH}
else
	# Get list of gnubin directories
	export GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";

	for bindir in ${GNUBINS[@]}; do
		export PATH=$bindir:${PATH};
	done
	# aliases
	alias ls='gls --color=auto -F'
	alias grep='ggrep --color=auto'
fi

# Emacs keybindings.
bindkey -e

##- Prompt colors.
# Load the terminal colors and activate them.
autoload -U colors
colors
# Nicer names for the color sequences.
startcyan='%{$fg[cyan]%}'
startgreen='%{$fg[green]%}'
startred='%{$fg[red]%}'
startyellow='%{$fg[yellow]%}'
startblue='%{$fg[blue]%}'
endcolor='%{$reset_color%}'
startmagenta='%{$fg[magenta]%}'
#-##

##- Prompt.
# Activate prompts substitutions, used by vcs_info.
setopt prompt_subst

# VCS (= SCM: git, svn) info.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "%s://%r/%b"

promptstart="# "
promptseparator=" # "
promptnewline=$'\n'
promptend="# "

promptdatetime="${startgreen}%D{%H:%M %a %d/%b/%Y}${endcolor}"
promptscm="${startgreen}\${vcs_info_msg_0_}${endcolor} "

firstprompt="${promptstart}${promptdatetime}${promptseparator}${promptscm}${promptnewline}"

promptusername="${startyellow}%n${endcolor}"
promptat="${startyellow}@${endcolor}"
prompthostname="${startyellow}%M${endcolor}"
promptlocation="${promptusername}${promptat}${prompthostname}"
current_directory="${startgreen}%2~${endcolor}"

secondprompt="${promptstart}${promptlocation}${promptseparator}${current_directory}${promptnewline}${promptend}"

prompt="${firstprompt}${secondprompt}"

export PS1=${prompt}
#-##

# Get the VCS info before hitting <Enter>.
precmd () { vcs_info }

# Set the console/tab title after hitting <Enter>.
preexec () { echo -e "\033]$1\007" }

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
# disable autocorrect for sqlplus since zsh is confused by @script.
alias sqlplus='nocorrect sqlplus'
# hash commands and directories for increasing speed
setopt HASH_CMDS
setopt HASH_DIRS
setopt HASH_LIST_ALL

autoload -Uz compinit
compinit

# don't complete for functions not available
zstyle ':completion:*:functions' ignored-patterns '_*'
# use a cache for slow functions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/zsh_cache
# ignore working directory
zstyle ':complezstyle:*:cd:*' ignore-parents parent pwd
# fuzzy match - allow max 1 error
# zstyle ':completion:*' completer _complete _match _approximate
# autoload predict-on; predict-on
# Autocomplete using a menu selection.
# zstyle ':completion:*' menu yes select
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
# kill PID completion
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
# ignore the files on the command line for autocompletion
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
# Cygwin drives that cannot be reached by globbing.
zstyle ':completion:*' fake-files '/:c' '/:d'
# completion in the middle of text
bindkey '^i' expand-or-complete-prefix

# Fixing special keys (Home/End/etc.).
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char

function gvim() {
	file=$(echo "$1" | sed -e 's/~/C:\/Users\/ccaraivan/')
	/c/Program\ Files\ \(x86\)/Vim/vim80/gvim --remote-tab "$(cygpath -m $file)"
}
