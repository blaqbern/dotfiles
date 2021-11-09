echo "bernicus zsh init..."
autoload colors && colors
autoload -Uz compinit && compinit
bindkey -v
export EDITOR=vim

function create_color_funcs () {
  local colors=( red green blue cyan magenta yellow )

  [[ ! -d ~/zshfn ]] && mkdir ~/zshfn

  for c in $colors; do
    if [[ ! -f ~/zshfn/$c ]]; then
      echo "echo %F{$c}\$1%f" > ~/zshfn/$c
    fi
  done
}

create_color_funcs
