#!/bin/bash
set -e
echo "Starting dotfiles init.sh..";
echo "##################"

USERNAME="$1"
if [ -z $USERNAME ]; then
    echo "USERNAME not Specified";
    echo "!!!!!!!!!!!!!!!!!!"
    exit 1;
fi

echo "Setting up for $USERNAME.."
echo "##################"
if [ -d /home/$USERNAME/initial-setup ]; then
    echo "initial-setup/ already exists.";
    runuser -l $USERNAME -c "cd /home/$USERNAME/initial-setup && git pull";
    echo "Pulled latest initial-setup!";
else
    runuser -l $USERNAME -c "git clone  --depth 1 --single-branch https://github.com/AVRC26/initial-setup.git /home/$USERNAME/initial-setup";
    echo "Cloned initial-setup!";
fi

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.vim /home/$USERNAME"

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.vimrc /home/$USERNAME"

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.bashrc /home/$USERNAME"

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.gitconfig /home/$USERNAME"

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.dircolors/dircolors.monokai /home/$USERNAME/.dircolors.monokai"

if [ -d /home/$USERNAME/.vim/bundle/Vundle.vim ]; then
    echo "Vundle.vim/ already exists.";
else
    runuser -l $USERNAME -c "git clone  --depth 1 --single-branch https://github.com/VundleVim/Vundle.vim.git /home/$USERNAME/.vim/bundle/Vundle.vim";
    echo "Cloned Vundle.vim!";
fi

runuser -l $USERNAME -c "vim +PluginInstall +qall"

if [ -d /home/$USERNAME/.bash-git-prompt ]; then
    echo ".bash-git-prompt/ already exists.";
else
    runuser -l $USERNAME -c "git clone  --depth 1 --single-branch https://github.com/magicmonty/bash-git-prompt.git /home/$USERNAME/.bash-git-prompt";
    echo "Cloned .bash-git-prompt!";
fi

runuser -l $USERNAME -c "cp -r /home/$USERNAME/initial-setup/dotfiles/user/.git-prompt-colors.sh /home/$USERNAME/.git-prompt-colors.sh"

echo "Setup for $USERNAME is complete!"
echo -e "__________________\n\n\n"


## Colos for root
echo "Setting up for root.."
echo "##################"
cp -r /home/$USERNAME/initial-setup/dotfiles/root/.vim /root/.vim/

cp -r /home/$USERNAME/initial-setup/dotfiles/root/.vimrc /root/.vimrc

sed -i 's/service/<USERNAME>/g' /home/$USERNAME/initial-setup/dotfiles/root/.bashrc
cp -r /home/$USERNAME/initial-setup/dotfiles/root/.bashrc /root/.bashrc

cp -r /home/$USERNAME/initial-setup/dotfiles/root/.gitconfig /root/.gitconfig

cp -r /home/$USERNAME/initial-setup/dotfiles/root/.dircolors/dircolors.gruvbox_darkhard /root/.dircolors.gruvbox_darkhard

if [ -d /root/.vim/bundle/Vundle.vim ]; then
    echo "Vundle.vim/ already exists.";
else
    git clone  --depth 1 --single-branch https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim;
    echo "Cloned Vundle.vim!";
fi

vim +PluginInstall +qall

if [ -d /root/.bash-git-prompt ]; then
    echo ".bash-git-prompt/ already exists.";
else
    git clone  --depth 1 --single-branch https://github.com/magicmonty/bash-git-prompt.git /root/.bash-git-prompt;
    echo "Cloned .bash-git-prompt!";
fi

sudo cp -r /home/$USERNAME/initial-setup/dotfiles/root/.git-prompt-colors.sh /root/.git-prompt-colors.sh

echo "Setup for root is complete!"
echo -e "__________________\n\n\n"
