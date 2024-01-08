Check if the shell is interactive
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set an empty greeting message
set fish_greeting ""
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# User configuration
alias ls='eza --long --header --git --all --group-directories-first --color=auto --icons'
alias cat='bat --style=numbers,changes,header,grid --paging=never --color=always'
function __zoxide_cd
    cd $argv
    and commandline -f repaint
end
zoxide init fish --cmd cd | source
