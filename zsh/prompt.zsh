setopt prompt_subst

remotemasterstatus='∅'
currentremotestatus=''

function set_status {
  statustype=$1
  val=$2
  if [[ $statustype = 'remotemaster' ]]; then
    remotemasterstatus=$val
  elif [[ $statustype = 'currentremote' ]]; then
    currentremotestatus="$val "
  fi
}

function compare_refs {
  if [[ -n $(git ls-remote --heads origin $2) ]]; then
    LOCAL_REF=$(git rev-parse $1 2> /dev/null)
    REMOTE_REF=$(git rev-parse origin/$2 2> /dev/null)
    BASE_REF=$(git merge-base $LOCAL_REF $REMOTE_REF 2> /dev/null)

    statustype=$3


    remotemasterstatus=''

    if [[ $LOCAL_REF != $REMOTE_REF ]]; then
      if [[ $REMOTE_REF = $BASE_REF ]]; then
        set_status $statustype '△'
      elif [[ $LOCAL_REF = $BASE_REF ]]; then
        set_status $statustype '▽'
      else
        set_status $statustype '△▽'
      fi
    fi
  fi
}

function git_branch_status {
  if [[ -a .git ]]; then
    if [[ -n `git remote -v` ]]; then
      git fetch origin $master --dry-run 2> /dev/null

      if [[ -n `git branch 2> /dev/null | grep develop` ]]; then
        master='develop'
      else
        master='master'
      fi

      branchstr=`git status | grep "On branch"`
      currentbranchname=${branchstr#On branch }

      if [[ $currentbranchname != $master ]]; then
        compare_refs $currentbranchname $currentbranchname 'currentremote'
      fi

      compare_refs $currentbranchname $master 'remotemaster'
    fi
  fi

  echo "%{$fg[cyan]%}$currentremotestatus%{$fg[yellow]%}$remotemasterstatus%{$reset_color%}"
}

function git_status_info {
  STATUS="$(git status 2> /dev/null)"
  if [[ $STATUS =~ 'Changes to be committed:' ]]; then
    statusicons+="%{$fg[green]%}◍%{$reset_color%}"
  fi
  if [[ $STATUS =~ 'Changes not staged for commit:' ]]; then
    statusicons+="%{$fg[yellow]%}◍%{$reset_color%}"
  fi
  if [[ $STATUS =~ 'Untracked files:' ]]; then
    statusicons+="%{$fg[magenta]%}◍%{$reset_color%}"
  fi

  if [[ -n $statusicons ]]; then
    echo " $statusicons"
  fi
}

function git_stashed_changes {
  if [[ -f '.git/refs/stash' ]]; then
    echo " ✒" # ✎ ✍ ✐ ⏞
  fi
}

PROMPT='%{$fg[blue]%}%~%{$fg[cyan]%} ⌁ %{$reset_color%}' # ➸ ▱
RPROMPT='$(git_branch_status)$vcs_info_msg_0_$(git_status_info)$(git_stashed_changes)'
