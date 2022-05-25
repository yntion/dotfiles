alias ls="ls --color=auto"
alias grep="grep --color=auto"

PS1="%~ $ "

autoload -Uz compinit add-zsh-hook

setopt autocd

set -o emacs

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' menu select cache-path \
$XDG_CACHE_HOME/zsh/zcompcache

eval "$(zoxide init zsh)"

function osc7 {
    setopt localoptions extendedglob
    input=( ${(s::)PWD} )
    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7
