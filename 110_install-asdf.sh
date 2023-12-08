echo "Installing asdf"

export PATH=$PATH:/usr/local/go/bin
export HOME=/home/user

test -d "$HOME/.asdf" || {
    runuser user -c -l "git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.13.1"
    echo '. "$HOME/.asdf/asdf.sh"' | runuser user -c -l "tee -a $HOME/.profile"
    echo '. "$HOME/.asdf/asdf.sh"' | runuser user -c -l "tee -a $HOME/.bashrc"
    echo '. "$HOME/.asdf/completions/asdf.bash"' | runuser user -c -l "tee -a $HOME/.bashrc"
    runuser user -c -l "asdf plugin add python && asdf install python 3.8.18 && asdf install python 3.11.6 && asdf global python 3.11.6"
    runuser user -c -l "asdf plugin add nodejs && asdf install nodejs 20.10.0 && asdf global nodejs 20.10.0"
    runuser user -c -l "asdf plugin add poetry && asdf install poetry latest && asdf global poetry latest"
    runuser user -c -l "asdf plugin add direnv && asdf install direnv latest && asdf global direnv latest"
    runuser user -c -l "asdf plugin add firebase && asdf install firebase latest && asdf global firebase latest"
    runuser user -c -l "asdf plugin add exa && asdf install exa latest && asdf global exa latest"

    runuser user -c -l "poetry self add poetry-plugin-export"
    echo "alias l='exa -lF --icons --git --header --group-directories-first --time-style=long-iso'" | runuser user -c -l "tee -a $HOME/.bashrc"
}