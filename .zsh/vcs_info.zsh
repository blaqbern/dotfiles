autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{4}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %K{3}%F{0}%a%k %F{4}%b%f'
