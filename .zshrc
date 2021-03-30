# chsh -s $(which zsh)
# mkdir -p ~/.config/zsh/plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/plugins/zsh-history-substring-search

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd nomatch EXTENDED_HISTORY HIST_IGNORE_SPACE HIST_IGNORE_DUPS interactive_comments

bindkey -v
# 10ms for key sequences - DO NOT COMMIT me yet
KEYTIMEOUT=1

# The following lines were added by compinstall
zstyle :compinstall filename '/home/ondra/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors
# TODO $pipestatus[@]
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%(?.. %{$fg[red]%}[%?])%{$reset_color%}$%b "

zstyle ':completion:*' menu select
#zstyle ':completion:*' completer _complete  # I don't seem to need this TODO
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.


test -f ~/scripts/aliases.sh && . ~/scripts/aliases.sh

[ -f ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] &&
    . ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^ ' autosuggest-accept
#bindkey '^M' autosuggest-execute
bindkey '^f' forward-word

[ -f ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] &&
    . ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# cp /etc/zsh_command_not_found ~/.config/zsh/
# sed -i 's/--no-failure-msg //' ~/.config/zsh/zsh_command_not_found
[ -f ~/.config/zsh/zsh_command_not_found ] &&
    . ~/.config/zsh/zsh_command_not_found
