# Based on bira theme

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' unstagedstr "[!]"
zstyle ':vcs_info:*:*' stagedstr "[+]"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[white]%}on %{$fg[red]%}  %b %u%c%{$fg[white]%}"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Determines prompt modifier if and when a conda environment is active
precmd_conda_info() {
  if [[ -n $CONDA_PREFIX ]]; then
      if [[ $(basename $CONDA_PREFIX) == "anaconda3" ]]; then
        # Without this, it would display conda version
        CONDA_ENV="(base) "
      else
        # For all environments that aren't (base)
        CONDA_ENV="($(basename $CONDA_PREFIX)) "
      fi
  # When no conda environment is active, don't show anything
  else
    CONDA_ENV=""
  fi
}

# Run the previously defined function before each prompt
precmd_functions+=( precmd_conda_info )

# Allow substitutions and expansions in the prompt
setopt prompt_subst

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[staged]+='[?]'
  fi
}

() {

function preexec() {
  timer=$(($(date +%s%0N)/1000000000))
}


function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000000))

    if [[ $(($now-$timer)) -lt 60 ]]; then

        elapsed=$(($now-$timer))s\ 

    elif [[ $(($now-$timer)) -ge 3600 ]]; then

        elapsed=$(($(($now-$timer))/3600))h\ 

    elif [[ $(($now-$timer)) -ge 60 ]]; then

        elapsed=$(($(($now-$timer))/60))m\ 

    fi

    vcs_info

    unset timer
  fi
}

local PR_PROMPT

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
 current_dir="%B%F{cyan}%~%f%b"
 PR_PROMPT='%B%{$fg[cyan]%}%{❯%G%} '
else # root
  current_dir="%B%F{008}%~%f%b"
PR_PROMPT='%B%F{008}%{%G%} '
fi

local git_branch='${vcs_info_msg_0_}'

local TIME='%F{220}${elapsed}'

PROMPT="
$CONDA_ENV${current_dir} ${git_branch}
${TIME}${PR_PROMPT}"

}
