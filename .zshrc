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
export LESS="" # required for git pager to ignore its own defaults

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
setopt auto_pushd         # cd command pushes directories to the pushd/popd stack
setopt completealiases
setopt correct            # attempt to correct spelling
setopt dvorak             # use Dvorak instead of qwerty as basis for typo correction
setopt prompt_subst

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
RPROMPT='%{$FG[240]%}[%~] (%D %D{%H:%M:%S})%{$reset_color%}'

# Load in additional files #
############################

[[ -r ~/.zsh/keybindings.zsh                                     ]] && . ~/.zsh/keybindings.zsh
[[ -r ~/.zsh/git.zsh                                             ]] && . ~/.zsh/git.zsh
[[ -r ~/.zsh/completion.zsh                                      ]] && . ~/.zsh/completion.zsh
[[ -r ~/.zsh/aliases.zsh                                         ]] && . ~/.zsh/aliases.zsh
[[ -r ~/.zsh/functions.zsh                                       ]] && . ~/.zsh/functions.zsh
#[[ -r ~/.config.d/zsh/fasd.zsh                                   ]] && . ~/.config.d/zsh/fasd.zsh
#[[ -r ~/.private.zsh                                             ]] && . ~/.private.zsh
[[ -r ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -r /etc/zsh_command_not_found                                 ]] && . /etc/zsh_command_not_found


# print the hostname at the top of new sessions
hostname | toilet -f future --metal
