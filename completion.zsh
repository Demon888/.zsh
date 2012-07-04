# colorful listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -U compinit
compinit

# cache completions
zstyle ':completion::complete:*' use-cache 1

# highlight current completion option in a menu and immediately select first option
zstyle ':completion:*' menu yes select

## From Burke's config
#zstyle ':completion:*:manuals'    separate-sections true
#zstyle ':completion:*:manuals.*'  insert-sections   true
#zstyle ':completion:*:man:*'      menu yes select
