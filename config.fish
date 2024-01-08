 status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# User configuration
function cd
    z $argv
end

function ls
    eza --long --header --git --all --group-directories-first --color=auto --icons $argv
end

function cat
    bat --style=numbers,changes,header,grid --paging=never --color=always $argv
end
