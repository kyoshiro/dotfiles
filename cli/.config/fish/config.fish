set -x PATH $PATH ~/bin
set -x PATH $PATH ~/.cargo/bin
set -U TERMINAL kitty
set -U EDITOR nvim

if type thefuck > /dev/null 2>&1
    thefuck --alias | source
end

set -xg SSH_AUTH_SOCK /tmp/ssh-agent-$USER.socket
if not test -S $SSH_AUTH_SOCK
    ssh-agent -a $SSH_AUTH_SOCK > /dev/null
end
if not ssh-add -l > /dev/null 2>&1
    ssh-add ~/.ssh/id_rsa
end
