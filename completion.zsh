# colorful listings
zmodload -a complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'


autoload -U compinit
compinit

# cache completions
zstyle ':completion::complete:*' use-cache 1

# highlight current completion option in a menu and immediately select first option
zstyle ':completion:*' menu yes select

# pid completion for kill command
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

## From Burke's config
#zstyle ':completion:*:manuals'    separate-sections true
#zstyle ':completion:*:manuals.*'  insert-sections   true
#zstyle ':completion:*:man:*'      menu yes select
