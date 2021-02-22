## Pre-requisites
# install terminator
# 
##### being script

# install zsh
sudo apt install zsh -y

if [ $? -eq 0 ]; then
	echo "Success - install zsh"
else
	echo "Fail - install zsh"
	exit 777
fi

# download and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $? -eq 0 ]; then
	echo "Success - install oh-my-zsh"
else
	echo "Fail - install oh-my-zsh"
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

# set zsh as default shell
chsh -s $(which zsh)

if [ $? -eq 0 ]; then
	echo "Success - set zsh as default shell"
else
	echo "Fail - unable to set zsh as default shell"
	exit 777
fi


# get my custom configuration files from github
git clone https://github.com/Salazar-Prime/custom_linux_shell.git
mv ./custom_linux_shell/terminator_config $HOME/.config/terminator/config # set dracula theme for terminator
mv ./custom_linux_shell/agnoster.zsh_theme $HOME/.oh-my-zsh/themes/ # set custom agnoster theme
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
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#echo "# syntax highlighting" >> ${ZDOTDIR:-$HOME}/.zshrc
#echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#if [ $? -eq 0 ]; then
#	echo "Success - zsh highlighting"
#else
#	echo "Fail - unable to set zsh highlighting"
#	exit 777
#fi

# source the shell
source $HOME/.zshrc

if [ $? -eq 0 ]; then
	echo "Success - Welcome to ZSH Shell"
else
	echo "Fail - something went wrong"
	exit 777
fi
