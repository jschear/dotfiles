# Set up prompt
fpath+=($HOME/.zsh/pure)
autoload -U promptinit
promptinit
prompt pure

# Enable autocompletion
autoload -Uz compinit && compinit

# up/down moves through history with prefix
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

## Aliases
# Colorize
alias ls='ls -GF'

# xcode
alias clean-dd="rm -rf $HOME/Library/Developer/Xcode/DerivedData"

# git
alias gs='git status'
alias gp='git pull'
alias submodules='git pull && git submodule update --init --recursive'

# brew
alias brewup='brew bundle --cleanup --upgrade --global --force'

# misc
alias cat='bat'

# Mise
eval "$(mise activate zsh)"
