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

# make sure tmux is always run with 256 colours
alias tmux="tmux -2"

# open nautilus from current location
alias n="nautilus ."

# use git-achievements, if available
command -v git-achievements >/dev/null 2>&1 && alias git="git-achievements"
