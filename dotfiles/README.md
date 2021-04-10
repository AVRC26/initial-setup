# Install Instructions

## USER
* #### monokai theme

        git clone https://github.com/AVRC26/initial-setup.git ~/initial-setup

        mv ~/initial-setup/dotfiles/user/.vim ~
        
        mv ~/initial-setup/dotfiles/user/.vimrc ~

        mv ~/initial-setup/dotfiles/user/.bashrc ~

        mv ~/initial-setup/dotfiles/user/.gitconfig ~

        mv ~/initial-setup/dotfiles/user/.dircolors/dircolors.monokai ~/.dircolors.monokai

        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

        vim +PluginInstall +qall

* #### Install git-prompt

        git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

        mv ~/initial-setup/dotfiles/user/.git-prompt-colors.sh ~/.git-prompt-colors.sh


* #### Install tmux
        sudo yum install -y tmux

        cp -r ~/initial-setup/dotfiles/user/.tmux* ~

        git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

        git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar

    Install tmux plugins

        `prefix + I`

## ROOT
* #### gruvbox theme

        sudo mv ~/initial-setup/dotfiles/root/.vim /root/.vim/
        
        sudo mv ~/initial-setup/dotfiles/root/.vimrc /root/.vimrc

        sudo sed -i 's/avrc26/<USERNAME>/g' ~/initial-setup/dotfiles/root/.bashrc        
        sudo mv ~/initial-setup/dotfiles/root/.bashrc /root/.bashrc

        sudo mv ~/initial-setup/dotfiles/root/.gitconfig /root/.gitconfig

        sudo mv ~/initial-setup/dotfiles/root/.dircolors/dircolors.gruvbox_darkhard /root/.dircolors.gruvbox_darkhard

        sudo git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim

        Switch to root:
        vim +PluginInstall +qall

* #### Install git-prompt

        sudo git clone https://github.com/magicmonty/bash-git-prompt.git /root/.bash-git-prompt --depth=1

        sudo mv ~/initial-setup/dotfiles/root/.git-prompt-colors.sh /root/.git-prompt-colors.sh

* #### Install tmux (not recommended for root)

        mv initial-setup/dotfiles/root/.tmux* ~

        git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

        git clone https://github.com/arl/tmux-gitbar.git ~/.tmux-gitbar
    
    Install tmux plugins

        `prefix + I`

## VS Code - GIT Bash
* #### default theme

        mv ~/initial-setup/dotfiles/win/.vim ~/.vim/
        
        mv ~/initial-setup/dotfiles/win/.vimrc ~/.vimrc

        mv ~/initial-setup/dotfiles/win/.bashrc ~/.bashrc

        mv ~/initial-setup/dotfiles/win/.gitconfig ~/.gitconfig

        mv ~/initial-setup/dotfiles/win/.dircolors/dircolors.default /root/.dircolors.default

        mv ~/initial-setup/dotfiles/root/vs-code.settings.json ~/.vscode-server/data/Machine/settings.json

        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

        Switch to root:
        vim +PluginInstall +qall

* #### Install git-prompt

        git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

        mv ~/initial-setup/dotfiles/win/.git-prompt-colors.sh ~/.git-prompt-colors.sh

* #### default git-prompt
        mv ~/initial-setup/dotfiles/win/git-prompt.sh ~/.git-prompt.sh 

* #### optional base16
        git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell


## CONTAINERS (alpine)
* #### onedark theme
[TODO](https://www.ionos.com/community/server-cloud-infrastructure/docker/understanding-and-managing-docker-container-volumes/) Automate

- ALPINE
    ```bash
    apk update
    apk upgrade
    apk add -y git --no-cache
    apk add -y vim --no-cache
    apk add -y bash --no-cache
    apk add -y coreutils --no-cache
    export SHELL=/bin/bash
    export color_prompt=yes
    source ~/.bashrc
    ```

- DEBIAN
- RHEL


* #### **Get Dependencies**    
    ```bash
    git clone https://github.com/AVRC26/initial-setup.git ~/initial-setup
    
    mv ~/initial-setup/dotfiles/containers/.vim ~
    
    mv ~/initial-setup/dotfiles/containers/.vimrc ~
    
    mv ~/initial-setup/dotfiles/containers/.bashrc ~
    
    mv ~/initial-setup/dotfiles/containers/.gitconfig ~
    
    mv ~/initial-setup/dotfiles/containers/.dircolors/dircolors.onehalfdark ~/.dircolors.onehalfdark
    
    mkdir -p  ~/.vscode-server/data/Machine/
    
    mv ~/initial-setup/dotfiles/containers/vs-code.settings.json ~/.vscode-server/data/Machine/settings.json
    
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    vim +PluginInstall +qall
    ```
    
* #### Install git-prompt

        git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

        mv ~/initial-setup/dotfiles/containers/.git-prompt-colors.sh ~/.git-prompt-colors.sh


PS: 

* tmux plugin prefix `` ctrl + a ``
* root has onehalf color scheme available.
* base16 win usage - `` base16-monokai ``
* script to print 256 colors


        for i in {0..255} ; do
            printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
            if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
                printf "\n";
            fi
        done

* script to print current base16 colors

        for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""

* dos2unix in folder

        find . -type f -print0 | xargs -0 dos2unix
