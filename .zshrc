# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=25000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

OS=$(uname -s)
ARCH=$(uname -m)
VER=$(uname -r)

export NAME="Benjamin Bergman"
export EMAIL="ben@benbergman.ca"

export EDITOR="vim"
export PAGER="less"

# Head of PATH
P="$HOME/bin"
P="$P:$HOME/.bin"
P="$P:$HOME/git/git-hooks"
P="$P:/usr/share/perl5/vendor_perl/auto/share/dist/Cope"
# Tail of PATH
export PATH="$P:$PATH"

autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U compinit && compinit

zstyle ':completion:*' menu select
setopt completealiases \
       autocd \
       prompt_subst

# Spectrum (https://github.com/sykora/etc/blob/master/zsh/functions/spectrum)
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>

typeset -Ag FX FG BG

FX=(
    reset     "[00m"
    bold      "[01m" no-bold      "[22m"
    italic    "[03m" no-italic    "[23m"
    underline "[04m" no-underline "[24m"
    blink     "[05m" no-blink     "[25m"
    reverse   "[07m" no-reverse   "[27m"
)

for color in {000..255}; do
    FG[$color]="[38;5;${color}m"
    BG[$color]="[48;5;${color}m"
done
# Spectrum END
# An Xterm 256 colour chart can be found here: http://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png

PROMPT='`~/.zsh/wunderprompt/prompt $?`'
RPROMPT='%{$FG[240]%}[%~] (%D %*)%{$reset_color%}'

# Keybindings to make special keys work - https://wiki.archlinux.org/index.php/Zsh#Key_Bindings
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Aliases #
###########

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi

# some recommended aliases (http://wiki.archlinux.org/index.php/Core_Utilities#alias)
# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'   # add -n for line numbers
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
#alias ping='ping -c 5'
alias ..='cd ..'
alias pacman='pacman-color'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

# privileged access
if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias scat='sudo cat'
  alias svim='sudo vim'
  alias root='sudo -s'
  alias reboot='sudo reboot'
  alias netcfg='sudo netcfg2'
fi

# Arch Linux specific
if echo $VER | grep -q ARCH; then
  alias update='yaourt -Syyua'
  alias install='yaourt -S'    # My addition

  # Pacman alias examples (http://wiki.archlinux.org/index.php/Pacman_Tips)
  alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
  alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
  alias pacins='sudo pacman -Up'         # Install specific package not from the repositories but from a file 
  alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
  alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
  alias pacrep='pacman -Si'              # Display information about a given package in the repositories
  alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
  alias pacloc='pacman -Qi'              # Display information about a given package in the local database
  alias paclocs='pacman -Qs'             # Search for package(s) in the local database
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.bash/.dircolors && eval "$(dircolors -b ~/.bash/.dircolors)" || eval "$(dircolors -b)"
fi

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lA='ls -d .??*'               # show only hidden files
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# colouring man/less (http://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages)
export LESS_TERMCAP_mb=$(printf "\e[1;37m")
export LESS_TERMCAP_md=$(printf "\e[1;37m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;47;30m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[0;36m")
function env() {
  exec /usr/bin/env "$@" | grep -v ^LESS_TERMCAP_
}

# open nautilus from current location
alias n="nautilus ."

# print the hostname at the top of new sessions
hostname | toilet -f future --metal
