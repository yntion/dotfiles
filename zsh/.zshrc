alias ls="ls --color=auto"
alias grep="grep --color=auto"

PS1="%~ $ "

autoload -Uz compinit

setopt autocd

compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' menu select cache-path \
$XDG_CACHE_HOME/zsh/zcompcache

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

eval "$(zoxide init zsh)"
