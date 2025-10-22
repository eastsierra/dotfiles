autoload -U colors && colors
PS1='%F{green}%~%f %(?.%F{223}$%f.%F{101}$%f) '
stty stop undef
setopt correct

export EDITOR="nvim"
alias vim=nvim

# autocompletion
autoload -Uz compinit
zmodload zsh/complist
compinit -c

zstyle ':completion:*' menu select
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# fix backspace
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# cursor thingy fix
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
