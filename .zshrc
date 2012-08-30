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
# I'm not really sure I want this yet
#VLESS=$(find /usr/share/vim -name 'less.sh')
#if [ ! -z $VLESS ]; then
#  alias less=$VLESS
#fi
export PAGER="less"
export LESS="R" # was previously unset; needed to be set for git to abandon it's own settings

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

setopt appendhistory
setopt autocd
setopt auto_pushd       # cd command pushes directories to the pushd/popd stack
setopt completealiases
setopt correct          # attempt to correct spelling
setopt dvorak           # use Dvorak instead of qwerty as basis for typo correction
setopt prompt_subst     # allow prompt to be regenerated on each line

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

PROMPT='`~/.zsh/wunderprompt/prompt $?`'  # wunderprompt (https://github.com/BenBergman/wunderprompt.git)
RPROMPT='%{$FG[240]%}[%~] (%D %D{%H:%M:%S})%{$reset_color%}'

# Load in additional files #
############################

[[ -r ~/.zsh/keybindings.zsh                                     ]] && . ~/.zsh/keybindings.zsh
[[ -r ~/.zsh/git.zsh                                             ]] && . ~/.zsh/git.zsh
[[ -r ~/.zsh/completion.zsh                                      ]] && . ~/.zsh/completion.zsh
[[ -r ~/.zsh/aliases.zsh                                         ]] && . ~/.zsh/aliases.zsh
[[ -r ~/.zsh/functions.zsh                                       ]] && . ~/.zsh/functions.zsh
#[[ -r ~/.config.d/zsh/fasd.zsh                                   ]] && . ~/.config.d/zsh/fasd.zsh
[[ -r ~/.private.zsh                                             ]] && . ~/.private.zsh
[[ -r ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -r /etc/zsh_command_not_found                                 ]] && . /etc/zsh_command_not_found

command -v pacman-color >/dev/null 2>&1 && export PACMAN=pacman-color

eval $( dircolors -b $HOME/.zsh/LS_COLORS/LS_COLORS )
# 'root' did not work on my Arch Linux MacBook and instead caused all keystrokes to beep
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# print the hostname at the top of new sessions
command -v toilet >/dev/null 2>&1 && hostname | toilet -f future --metal || hostname
