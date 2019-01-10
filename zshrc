ZSH_DIR=${funcsourcetrace[1]%/*}/zsh

source $ZSH_DIR/zsh_init.zsh
source $ZSH_DIR/vcs_info.zsh
source $ZSH_DIR/aliases.zsh
source $ZSH_DIR/completion.zsh
source $ZSH_DIR/prompt.zsh
source $ZSH_DIR/history.zsh

# fzf -------------------------------------------------------------------------
export FZG_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
