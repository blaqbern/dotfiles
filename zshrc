zsh_dir=$0:a:h/zsh

source $zsh_dir/zsh_init.zsh
source $zsh_dir/aliases.zsh
source $zsh_dir/completion.zsh
source $zsh_dir/prompt
source $zsh_dir/history.zsh

# fzf -------------------------------------------------------------------------
export FZG_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
