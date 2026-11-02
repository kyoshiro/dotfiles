set -x PATH $PATH ~/bin
set -x PATH $PATH ~/.cargo/bin
set -U TERMINAL kitty
set -U EDITOR nvim

if type thefuck > /dev/null 2>&1
    thefuck --alias | source
end

# if not ssh-add -l > /dev/null 2>&1
#     ssh-add ~/.ssh/id_rsa
# end
