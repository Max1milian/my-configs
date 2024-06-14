export ZSH="/home/$(whoami)/.oh-my-zsh"
export Z_Extension="~/.oh-my.zsh/plugins"
ZSH_THEME="afowler"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	history
	sudo
	web-search
	debian
	gh
	colorize
)

source $ZSH/oh-my-zsh.sh
export ZSH_COLORIZE_STYLE="colorful"


if [ -f ~/.zsh_history ]; then
	rm ~/.zsh_history
fi

if [ -d ~/appimages/ ]; then
	export PATH=/home/$(whoami)/appimages:$PATH
fi

if [ -d ~/vcpkg/ ]; then
	export VCPKG_ROOT=/home/$(whoami)/vcpkg
	export PATH=$VCPKG_ROOT:$PATH
	export VCPKG_ARCHITECTURE=x64-linux
	export CMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake
	autoload bashcompinit
	bashcompinit
	source /home/maximilian/vcpkg/scripts/vcpkg_completion.zsh
fi

if [ -d ~/.oh-my-zsh/ ]; then 
	if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	fi

	if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	fi
fi


if [ -d ~/.vulkansdk/ ]; then
	source /home/maximilian/.vulkansdk/1.3.283.0/setup-env.sh
fi

alias vi="nvim"
alias vim="nvim"


# Created by `pipx` on 2024-04-28 19:01:24
export PATH="$PATH:/home/$(whoami)/.local/bin"
