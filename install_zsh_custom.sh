##### being script #######

# Check sudo access
read -p "Do you have SUDO access? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    if [ $? -eq 0 ]; then
	echo "Let's Begin"
    else
	echo "Can't proceed with the script"
	echo "Please follow the instructions on the link below"
	echo "to manually install zsh and oh-my-zsh"
	echo "Followed by, going through the script manually"
	echo "to run the commands"
	echo "Link: https://franklingu.github.io/programming/2016/05/24/setup-oh-my-zsh-on-ubuntu-without-sudo/"
	exit 777
    fi
fi

https://franklingu.github.io/programming/2016/05/24/setup-oh-my-zsh-on-ubuntu-without-sudo/

# install curl
read -p "Install Curl? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install curl -y
    
    if [ $? -eq 0 ]; then
	echo "Success - install curl"
    else
	echo "Fail - install curl"
	exit 777
    fi
fi

# install tmux
read -p "Install TMUX? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install tmux -y
    
    if [ $? -eq 0 ]; then
	echo "Success - install tmux"
    else
	echo "Fail - install tmux"
	exit 777
    fi
fi

# install terminator
read -p "Install Terminator? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install terminator -y
    
    if [ $? -eq 0 ]; then
	echo "Success - install Terminator"
    else
	echo "Fail - install Terminator"
	exit 777
    fi
fi


# install zsh
read -p "Install ZSH? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install zsh -y
    
    if [ $? -eq 0 ]; then
	echo "Success - install zsh"
    else
	echo "Fail - install zsh"
	exit 777
    fi
fi

# install oh my zsh
read -p "Install OH MY ZSH? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    
    if [ $? -eq 0 ]; then
	echo "Success - install oh-my-zsh"
    else
	echo "Fail - install oh-my-zsh"
	exit 777
    fi
fi

# download and install powerline-fonts
sudo apt-get install fonts-powerline -y
if [ $? -eq 0 ]; then
	echo "Success - install powerline fonts"
else
	echo "Fail - install powerline fonts"
	exit 777
fi


# download and install
sudo apt install fonts-inconsolata -y

if [ $? -eq 0 ]; then
	echo "Success - install inconsolata fonts"
else
	echo "Fail - install inconsolata fonts"
	exit 777
fi



# get my custom configuration files from github
mkdir ~/.config/terminator
git clone https://github.com/Salazar-Prime/custom_linux_shell.git
mv ./custom_linux_shell/terminator_config $HOME/.config/terminator/config # set dracula theme for terminator
mv ./custom_linux_shell/.zshrc $HOME/ # set custom zshrc 
mv ./custom_linux_shell/.aliases $HOME/ # set custom aliases
mv ./custom_linux_shell/.vimrc $HOME/ # set custom vim config 
mv ./custom_linux_shell/.gitconfig $HOME/ # set custom git config 
mv ./custom_linux_shell/.tmux.conf $HOME/ # set custom tmux config 
rm -rf custom_linux_shell

if [ $? -eq 0 ]; then
	echo "Success - custom shell files set"
else
	echo "Fail - unable to set custom shell files"
	exit 777
fi

# add zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "# syntax highlighting" >> $HOME/.zshrc
echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc

if [ $? -eq 0 ]; then
	echo "Success - zsh highlighting"
else
	echo "Fail - unable to set zsh highlighting"
	exit 777
fi

# set precision of oh-my-zsh timer plugin
echo "# timer plugin threshold" >> $HOME/.zshrc
echo "TIMER_THRESHOLD=2" >> $HOME/.zshrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 

# install other stuff
if [[ $OSTYPE == darwin* ]]; then
	brew install bpython
	brew install bat
	brew install exa
	brew install chezmoi
else
	sudo apt install bpython -y
	sudo apt install bat -y
	sudo apt install exa -y
	sudo apt install chezmoi -y
fi

# add tmux TPM: https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "######## Script Ran Succesfully ###########"
echo "######## Open Tmux and run prefix+I to install TPM ###########"
echo "######## Open vim and run PluginInstall ###########"
echo "######## Restart Terminator ###########"

