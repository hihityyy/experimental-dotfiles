if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""
function pfetch --wraps pfetch
    env PF_INFO="ascii title os wm shell uptime" PF_SEP=" · " PF_ALIGN=12 PF_GAP=1 pfetch
end
alias ls="lsd"
alias l="ls -1"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
