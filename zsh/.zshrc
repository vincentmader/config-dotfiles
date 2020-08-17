
# =============================================================================
#                                  .zshrc
# =============================================================================


# 							        path variables
# =============================================================================
export HOME="/home/meister"
export CONF="$HOME/dotfiles"
export DROPBOX="$HOME/Dropbox"

export CDPATH="$CONF/symlinks"
export VISUAL="nvim"
export EDITOR="$VISUAL"
# export FZF_BASE="/usr/local/bin/fzf"
export MYVIMRC="$CONF/nvim/init.vim"
export PYTHONSTARTUP="$CONF/python/.pythonrc"
export TASKRC="$CONF/taskwarrior/taskrc"
export ZSH="$CONF/zsh/oh-my-zsh"
# export VIMRUNTIME="$HOME/.config/nvim/"
export PATH=$PATH:/opt/local/bin  # added because of MacPorts
export PATH=$PATH:~/.nimble/bin  # I added this because of MacPorts
# 							  default applications
# =============================================================================
export EDITOR="nvim"
# 					           	     locale / encoding
# =============================================================================
export LC_ALL=en_US.UTF-8
# 						     plugin manager: oh-my-zsh
# =============================================================================
plugins=(
    # colored-man-pages
    copyfile			# use to copy file to clipboard
    copydir				# use to copy pwd to clipboard
    # emoji-clock			# use to display time (30min accuracy)
    # fzf                             # enables fuzzy auto-completion 
    # git
    npm
    osx
    # pip
    # python
    sudo                            # press esc twice to sudo repeat cmd
    taskwarrior                     # auto completion for taskwarrior
    # zsh-autosuggestions
    # zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
#								        prompt
# =============================================================================
autoload -U colors && colors

function prompter() {
    prompt_username="%{$fg[green]%}%n%{$reset_color%}"
    prompt_computername="%{$fg[red]%}hal9000%{$reset_color%}"
    prompt_location="%{$fg[blue]%}%1~%{$reset_color%}"
    prompt_in_count="%{$fg[blue]%}$(task +in +PENDING count)%{$reset_color%}"
    prompt_due_today_count="%{$fg[yellow]%}$(task +DUE count)%{$reset_color%}"
    prompt_overdue_count="${fg[red]%}$(task +OVERDUE count)%{$reset_color%}"
    # prompt_tw_tracking='──(${fg[green]%}tracking%{$reset_color%})'
    
    # $prompt_tw_tracking
    export PS1="
 ╭────[$prompt_username@$prompt_computername|$prompt_location]──\
($prompt_overdue_count|$prompt_due_today_count|$prompt_in_count)
 ╰─> "
}
precmd() { eval prompter }
#								       vi mode
# =============================================================================
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char
# Change cursor shape for different vi modes.
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
    # initiate "vi insert" as keymap 
    # (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
# Use beam shape cursor on startup.
echo -ne '\e[5 q' 
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;} 

# ZSH_THEME='powerlevel9k/powerlevel9k'
# POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS = ('--\n--')
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=13'



# save/load History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"
 

# Autocompletion and other stuff like that
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# the fuck plugin
eval $(thefuck --alias)

# define location of zsh autocompletion dump (speeds up auto completion)
compinit -d "$HOME/.config/zsh/zcompdump"



# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search


# Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'


# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line


# # add color to grep
# alias grep='grep --color'
# # add color to man (I have as of yet only changed those with 38;5 at
# # the start, those are from the color set of size 256)
# export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
# export LESS_TERMCAP_md=$(printf '\e[38;5;33m') # enter double-bright mode – bold, magenta
# export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
# export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
# export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
# export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
# export LESS_TERMCAP_us=$(printf '\e[38;5;118m') # enter underline mode – cyan



# fuzzy finder source
  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# setup default command
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
# include hidden files
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
# f() {
#     sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
#     test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
# }

# Deps
#alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
#fzf-noempty () {
#	local in="$(</dev/stdin)"
#	test -z "$in" && (
#		exit 130
#	) || {
#		ec "$in" | fzf "$@"
#	}
#}
#ec () {
#	if [[ -n $ZSH_VERSION ]]
#	then
#		print -r -- "$@"
#	else
#		echo -E -- "$@"
#	fi
#}
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
# fe() {
#   local files
#   IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
#   [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
# }
# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
#vf() {
#  local files
#
#  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

#  if [[ -n $files ]]
#  then
#     vim -- $files
#     print -l $files[1]
#  fi
#}
# fd - cd to selected directory
#fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
#}
# fda - including hidden directories
#fda() {
#  local dir
#  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
#}


# 					                   source config files
# =============================================================================
source "$CONF/zsh/aliasrc"
# tell tmux to source from config
tmux source "$CONF/tmux/tmux.conf"
# check if tmux is running, if not: start it
[ -z "${TMUX}" ] && tmux 

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
