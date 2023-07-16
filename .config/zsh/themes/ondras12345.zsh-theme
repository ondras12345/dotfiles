# vim: set filetype=zsh

prompt_pipestatus() {
    PREV_PIPESTATUS=("${pipestatus[@]}")
}
add-zsh-hook precmd prompt_pipestatus

PROMPT='%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~$(stat=($PREV_PIPESTATUS); [ ${(j::)stat} -ne 0 ] && echo " %{$fg[red]%}[${(j:|:)stat}]")%{$reset_color%}$%b '
