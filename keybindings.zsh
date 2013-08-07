# Keybindings #
###############

# Keybindings to make special keys work - https://wiki.archlinux.org/index.php/Zsh#Key_Bindings
bindkey -v # vi mode
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

## Change colour of cursor when in vicmd mode
#zle-keymap-select () {
#  if [ $KEYMAP = vicmd ]; then
#    echo -ne "\033]12;red\007"
#  else
#    echo -ne "\033]12;grey\007"
#  fi
#}; zle -N zle-keymap-select
#zle-line-init () {
#  zle -K viins
#  echo -ne "\033]12;grey\007"
#}; zle -N zle-line-init

# Edit commands in your $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


## From Burke's configuration
#bindkey "^B" backward-char
#bindkey "^A" beginning-of-line
#bindkey "^E" end-of-line
#bindkey "^F" forward-char
#bindkey "^X^F" vi-find-next-char
#bindkey "^N" down-line-or-history
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward
#bindkey "^X^N" infer-next-history
#bindkey "^P" up-line-or-history
#bindkey "^H" backward-delete-char
#bindkey "^W" backward-kill-word
#bindkey "^X^J" vi-join
#bindkey "^K" kill-line
#bindkey "^X^K" kill-buffer
#bindkey "^U" kill-whole-line
#bindkey "^X^B" vi-match-bracket
#bindkey "^X^O" overwrite-mode
#bindkey "^V" quoted-insert
#bindkey "^T" transpose-chars
#bindkey "^Y" yank
#bindkey "^D" delete-char-or-list
#bindkey "^X*" expand-word
#bindkey "^XG" list-expand
#bindkey "^Xg " list-expand
#bindkey "^M" accept-line
#bindkey "^J" accept-line
#bindkey "^O" accept-line-and-down-history
#bindkey "^X^V" vi-cmd-mode
#bindkey "^L" clear-screen
#bindkey "^X^X" exchange-point-and-mark
#bindkey "^Q" push-line
#bindkey "^G" send-break
#bindkey "^@" set-mark-command
#bindkey "^Xu " undo
#bindkey "^X^U" undo
#bindkey "^_" undo
