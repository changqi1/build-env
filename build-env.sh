#!/bin/bash

yum install wget curl vim git numactl zsh -y
yum install cmake make gcc-8.5.0 gcc-c++-8.5.0 -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add plugins
grep -n "^plugins=" ~/.zshrc
plugins_line=`grep -n "^plugins=" ~/.zshrc | awk -F ':' '{print $1}'`
plugins_text="plugins=(git zsh-syntax-highlighting zsh-autosuggestions extract)"
sed -i "${plugins_line}c${plugins_text}" ~/.zshrc

echo "
alias cc='clear'

alias cdi='conda info -e'
alias cda='conda activate'
alias cdd='conda deactivate'
" >> ~/.zshrc

source ~/.zshrc
