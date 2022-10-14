#!/bin/sh

function set_git() {
    branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
    if [ -z "$branch" ]; then
        git_branch=""
    else
        git_branch="─[%{$fg[green]%}${branch:2:-1}%{$reset_color%}]"
    fi
}

function set_venv() {
    if test -z "$VIRTUAL_ENV"; then
        PYTHON_VIRTUAL_ENV=""
    else
        PYTHON_VIRTUAL_ENV="`basename \"$VIRTUAL_ENV\"`"
    fi
    if [ -z "$PYTHON_VIRTUAL_ENV" ]; then
        venv=""
    else
        venv="─[%{$fg[blue]%}$PYTHON_VIRTUAL_ENV%{$reset_color%}]"
    fi
}

# function set_clock() {
#     time=$(echo $(date)| cut -d' ' -f 4)
#     foo=${time%:*}
#     clock="─(%{$fg[blue]%}$foo%{$reset_color%})"
# }

function prompter() {
    set_venv
    set_git
    # set_clock

    username="%{$fg[blue]%}%n%{$reset_color%}"
    computername="%{$fg[red]%}hal9000%{$reset_color%}"
    location="%{$fg[green]%}%1~%{$reset_color%}"

    export PS1="
╭───($username|$location)$git_branch$venv
╰─> " # 
}

precmd() { eval prompter }
