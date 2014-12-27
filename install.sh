#!/bin/sh
git clone --recursive git@github.com:BenBergman/.zsh.git ~/.zsh \
	&& cd ~/.zsh/wunderprompt \
	&& make \
	&& ln -s ~/.zsh/.zshrc ~/.zshrc
which toilet 2&> /dev/null \
	|| echo "WARNING: toilet is not installed. Hostname will be printed in plain text."
