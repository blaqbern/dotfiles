setopt prompt_subst

function git_branch_status {
  if [[ -n `git branch 2> /dev/null | grep develop` ]]; then
    master='develop'
  else
    master='master'
  fi

  git fetch origin $master --dry-run 2> /dev/null

  CURRENT_BRANCH_REF=$(git rev-parse @ 2> /dev/null)
  REMOTE_MASTER_REF=$(git rev-parse origin/$master 2> /dev/null)
  BASE_REF=$(git merge-base @ origin/$master 2> /dev/null)

  if [ "$CURRENT_BRANCH_REF" != "$REMOTE_MASTER_REF" ]; then
    if [ $REMOTE_MASTER_REF = $BASE_REF ]; then
      branchstatus='△'
    elif [ $CURRENT_BRANCH_REF = $BASE_REF ]; then
      branchstatus='▽'
    else
      branchstatus='△▽'
    fi
  fi

  echo "%{$fg[yellow]%}$branchstatus%{$reset_color%}"
}

function git_status_info {
  STATUS="$(git status 2> /dev/null)"
  if [[ $STATUS =~ 'Changes to be committed:' ]]; then
    statusicons+="%{$fg[green]%}•%{$reset_color%}"
  fi
  if [[ $STATUS =~ 'Changes not staged for commit:' ]]; then
    statusicons+="%{$fg[yellow]%}•%{$reset_color%}"
  fi
  if [[ $STATUS =~ 'Untracked files:' ]]; then
    statusicons+="%{$fg[red]%}•%{$reset_color%}"
  fi

  if [[ -n $statusicons ]]; then
    echo " $statusicons"
  fi
}

function git_stashed_changes {
  if [ -f '.git/refs/stash' ]; then
    echo " ✎"
  fi
}

zstyle ':vcs_info:git:*' formats ' %F{4}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %K{3}%F{0}%a%k %F{4}%b%f'

PROMPT='%{$fg[blue]%}%~%{$fg[cyan]%} ⌾ %{$reset_color%}'
# RPROMPT='$(git_branch_status)$vcs_info_msg_0_$(git_status_info)$(git_stashed_changes)'
RPROMPT='$vcs_info_msg_0_$(git_status_info)$(git_stashed_changes)'
