export ZSH="$(pwd)/.oh-my-zsh"
export Z_Extension="~/.oh-my.zsh/plugins"
ZSH_THEME="afowler"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	history
	sudo
	web-search
)

source $ZSH/oh-my-zsh.sh

if ! [ -e /usr/bin/git ]; then 
    sudo apt install git -y 
fi

if [ -e ~/.zsh_history ]; then
	rm ~/.zsh_history
fi

if ! [ -e ~/.vimrc ]; then    
    wget -b --no-cookies https://raw.githubusercontent.com/Max1milian/my-configs/master/.vimrc
fi

if ! [ -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if ! [ -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
