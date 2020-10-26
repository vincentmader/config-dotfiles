#!/usr/bin/zsh

function prompter() {
    function set_prompt_git() {
        branch="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
    
        if [ -z "$branch" ]; then
            prompt_git_branch=""
        else
            prompt_git_branch="─${branch:1}"
        fi
    }
    function set_prompt_venv() {
        if test -z "$VIRTUAL_ENV"; then
            PYTHON_VIRTUAL_ENV=""
        else
            PYTHON_VIRTUAL_ENV="`basename \"$VIRTUAL_ENV\"`"
        fi
        if [ -z "$PYTHON_VIRTUAL_ENV" ]; then
            prompt_venv=""
        else
            prompt_venv="─($PYTHON_VIRTUAL_ENV)"
        fi
    }
    set_prompt_venv
    set_prompt_git
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
