function prompter() {

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

    # function set_battery_status() {
    #     battery_level="$(cat /sys/class/power_supply/BAT0/capacity)"
    #     if [ "$battery_level" -lt "25" ]; then
    #         battery="%{$fg[red]%}↯$battery_level%%%{$reset_color%}"
    #     elif [ "$battery_level" -lt "50" ]; then
    #         battery="%{$fg[yellow]%}↯$battery_level%%%{$reset_color%}"
    #     else
    #         battery="%{$fg[green]%}↯$battery_level%%%{$reset_color%}"
    #     fi
    # }

    # function set_clock() {
    #     time=$(echo $(date)| cut -d' ' -f 4)
    #     foo=${time%:*}
    #     clock="%{$fg[blue]%}$foo%{$reset_color%}"
    # }

    set_venv
    set_git
    # set_clock

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # do nothing
    else  # TODO: rewrite this? (will fail on non-Unix systems)

        # set_battery_status

        # in_count="%{$fg[blue]%}$(task +in +PENDING count)%{$reset_color%}"
        # due_today_count="%{$fg[yellow]%}$(task +DUE count)%{$reset_color%}"
        # overdue_count="${fg[red]%}$(task +OVERDUE count)%{$reset_color%}"
        # prompt_tw_tracking='──(${fg[green]%}tracking%{$reset_color%})'
        # $prompt_tw_tracking
    fi

    username="%{$fg[blue]%}%n%{$reset_color%}"
    computername="%{$fg[red]%}hal9000%{$reset_color%}"
    location="%{$fg[green]%}%1~%{$reset_color%}"

    export PS1="
╭────($username|$location)$git_branch$venv
╰─➤ "
    # ─($clock)
    # ($overdue_count|$due_today_count|$in_count)
    # ($battery_status)
    # ($clock)
}

precmd() { eval prompter }
