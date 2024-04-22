
# Simply append the following lines to the end of your '.bashrc'.

display_git_branch() {
    if [ -d ".git" ] || git rev-parse --git-dir > /dev/null 2>&1; then
        branch=$(git symbolic-ref --short HEAD 2> /dev/null)
        if [ -n "$branch" ]; then
            echo "\[\033[0;32;45m\]◤\[\033[0;45m\] ⎇ ${branch} \[\033[0;35m\]◤\[\033[0m\]"
        fi
    else
        echo "\033[0;32m◤\033[0m"
    fi
}

generate_prompt() {
    PS1="\[\033[36m\]◢\[\033[0;30;46m\] \u@\h \[\033[0;36;42m\]◤\[\033[0;30;42m\] \w $(display_git_branch) "
}

PROMPT_COMMAND=generate_prompt
