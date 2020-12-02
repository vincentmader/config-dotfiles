#!/usr/bin/zsh

function prompter() {
    function set_git() {
        branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
    
        if [ -z "$branch" ]; then
            git_branch=""
        else
            git_branch="─(%{$fg[green]%}${branch:2:-1}%{$reset_color%})"
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
            venv="─(%{$fg[blue]%}$PYTHON_VIRTUAL_ENV%{$reset_color%})"
        fi
    }
    set_venv
    set_git
    username="%{$fg[green]%}%n%{$reset_color%}"
    computername="%{$fg[red]%}hal9000%{$reset_color%}"
    location="%{$fg[blue]%}%1~%{$reset_color%}"
    in_count="%{$fg[blue]%}$(task +in +PENDING count)%{$reset_color%}"
    due_today_count="%{$fg[yellow]%}$(task +DUE count)%{$reset_color%}"
    overdue_count="${fg[red]%}$(task +OVERDUE count)%{$reset_color%}"
    # prompt_tw_tracking='──(${fg[green]%}tracking%{$reset_color%})'
    # $prompt_tw_tracking

    export PS1="
╭────[$username|$location]─\
($overdue_count|$due_today_count|$in_count)$venv$git_branch
╰─> "
}
precmd() { eval prompter }
