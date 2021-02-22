##### being script #######

# install terminator
read -p "Install Terminator? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install terminator -y
    
    if [ $? -eq 0 ]; then
	echo "Success - install zsh"
    else
	echo "Fail - install zsh"
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


# download and install
sudo apt install fonts-inconsolata -y

if [ $? -eq 0 ]; then
	echo "Success - install inconsolata fonts"
else
	echo "Fail - install inconsolata fonts"
	exit 777
fi



# get my custom configuration files from github
git clone https://github.com/Salazar-Prime/custom_linux_shell.git
mv ./custom_linux_shell/terminator_config $HOME/.config/terminator/config # set dracula theme for terminator
mv ./custom_linux_shell/.zshrc $HOME/ # set custom zshrc 
mv ./custom_linux_shell/.bash_aliases $HOME/ # set custom aliases
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
echo "#TIMER_THRESHOLD=2" >> $HOME/.zshrc


echo "######## Restart Terminator ###########"
