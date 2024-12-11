#!/bin/bash
# Author Name: Varun Aggarwal
# Disclaimer: The code has been annotated by ChatGPT. It may contain inconsistencies.

# Prompt user to confirm SUDO access
read -p "Do you have SUDO access? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Check for sudo privileges
    if [ $? -eq 0 ]; then
        echo "Let's Begin"
    else
        echo "Can't proceed with the script"
        echo "Please follow the instructions on the link below"
        echo "to manually install zsh and oh-my-zsh"
        echo "Followed by, going through the script manually"
        echo "to run the commands"
        echo "Link: https://franklingu.github.io/programming/2016/05/24/setup-oh-my-zsh-on-ubuntu-without-sudo/"
        exit 777 # Exit if sudo privileges are not available
    fi
fi

# Prompt to install curl, used for transferring data with URL syntax
read -p "Install Curl? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == darwin* ]]; then
        brew install curl  # macOS: Use Homebrew
    else
        sudo apt install curl -y  # Linux: Use apt
    fi

    # Check installation success
    if [ $? -eq 0 ]; then
        echo "Success - install curl"
    else
        echo "Fail - install curl"
        exit 777
    fi
fi

# Prompt to install tmux, a terminal multiplexer
read -p "Install TMUX? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == darwin* ]]; then
        brew install tmux
    else
        sudo apt install tmux -y
    fi

    # Check installation success
    if [ $? -eq 0 ]; then
        echo "Success - install tmux"
    else
        echo "Fail - install tmux"
        exit 777
    fi
fi

# Prompt to install Terminator (Linux) or suggest iTerm2 (macOS)
read -p "Install Terminator? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == darwin* ]]; then
        echo "Terminator is not available on macOS. Using iTerm2 instead."
        echo "Please download iTerm2 from https://iterm2.com/"
    else
        sudo apt install terminator -y

        if [ $? -eq 0 ]; then
            echo "Success - install Terminator"
        else
            echo "Fail - install Terminator"
            exit 777
        fi
    fi
fi

# Prompt to install zsh, a shell optimized for interactive use
read -p "Install ZSH? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == darwin* ]]; then
        brew install zsh
    else
        sudo apt install zsh -y
    fi

    if [ $? -eq 0 ]; then
        echo "Success - install zsh"
    else
        echo "Fail - install zsh"
        exit 777
    fi
fi

# Prompt to install Oh My Zsh, a framework for managing zsh configuration
read -p "Install OH MY ZSH? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [[ $OSTYPE == darwin* ]]; then
        echo "Skipping Oh My Zsh installation on macOS"
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        if [ $? -eq 0 ]; then
            echo "Success - install oh-my-zsh"
        else
            echo "Fail - install oh-my-zsh"
            exit 777
        fi
    fi
fi

# Install Powerline fonts (Linux and macOS)
if [[ $OSTYPE == darwin* ]]; then
    echo "Downloading recommended fonts for macOS..."
    brew tap homebrew/cask-fonts
    brew install --cask font-meslo-lg-nerd-font
else
    echo "Downloading recommended fonts for Linux..."
    sudo apt-get install fonts-powerline -y
fi

if [ $? -eq 0 ]; then
    echo "Success - install powerline fonts"
else
    echo "Fail - install powerline fonts"
    exit 777
fi

# Install Inconsolata fonts for enhanced readability
if [[ $OSTYPE == darwin* ]]; then
    brew install font-inconsolata
else
    sudo apt install fonts-inconsolata -y
fi

if [ $? -eq 0 ]; then
    echo "Success - install inconsolata fonts"
else
    echo "Fail - install inconsolata fonts"
    exit 777
fi

# Clone and set custom shell configuration files
if [[ $OSTYPE == darwin* ]]; then
    echo "Skipping Terminator configuration on macOS."
else
    mkdir -p ~/.config/terminator
    mv ./custom_linux_shell/terminator_config $HOME/.config/terminator/config
fi
git clone https://github.com/Salazar-Prime/custom_linux_shell.git
# Configure Powerlevel10k, zsh, and other shell tools
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
mv ./custom_linux_shell/.p10k.zsh $HOME/
mv ./custom_linux_shell/.zshrc $HOME/
mv ./custom_linux_shell/.aliases $HOME/
mv ./custom_linux_shell/.vimrc $HOME/
mv ./custom_linux_shell/.gitconfig $HOME/
mv ./custom_linux_shell/.tmux.conf $HOME/
rm -rf custom_linux_shell

if [ $? -eq 0 ]; then
    echo "Success - custom shell files set"
else
    echo "Fail - unable to set custom shell files"
    exit 777
fi

# Add zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "# syntax highlighting" >> $HOME/.zshrc
echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

if [ $? -eq 0 ]; then
    echo "Success - zsh highlighting"
else
    echo "Fail - unable to set zsh highlighting"
    exit 777
fi

# Set a timer plugin threshold for Oh My Zsh
echo "# timer plugin threshold" >> $HOME/.zshrc
echo "TIMER_THRESHOLD=2" >> $HOME/.zshrc

# Install Vundle, a Vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install additional utilities based on platform
if [[ $OSTYPE == darwin* ]]; then
    brew install bpython
    brew install bat
    brew install eza
    brew install chezmoi
else
    sudo apt install bpython -y
    sudo apt install bat -y
    sudo apt install eza -y
    sudo apt install chezmoi -y
fi

# Add tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Success message with next steps
echo "######## Script Ran Successfully ###########"
echo "######## Open Tmux and run prefix+I to install TPM ###########"
echo "######## Open vim and run PluginInstall ###########"
echo "######## Restart Terminator ###########"
echo "Setup powerline10k theme"
