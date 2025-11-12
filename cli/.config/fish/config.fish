set -x PATH $PATH ~/bin
set -x PATH $PATH ~/.cargo/bin
set -U TERMINAL kitty
set -U EDITOR nvim

if type thefuck > /dev/null 2>&1
    thefuck --alias | source
end

set -xg SSH_AUTH_SOCK (find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null)
if test -z $SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
    set -xg SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -xg SSH_AGENT_PID $SSH_AGENT_PID
end
