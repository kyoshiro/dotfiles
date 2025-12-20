#!/usr/bin/fish
# Activate the pyenv virtual environment for Fish shell
#
if not test -f ~/pyenv/bin/activate.fish
    echo "pyenv virtual environment not found. Setting up pyenv first."
    python3 -m venv ~/pyenv
end

source ~/pyenv/bin/activate.fish
