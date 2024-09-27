set -x PATH $PATH ~/bin
set -x PATH $PATH ~/.cargo/bin
set -U TERMINAL kitty
set -U EDITOR nvim

if type thefuck > /dev/null 2>&1
    thefuck --alias | source
end
