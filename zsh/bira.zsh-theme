# Based on bira theme
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:*:*' unstagedstr "[!]"
zstyle ':vcs_info:*:*' stagedstr "[+]"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[white]%}on %{$fg[red]%} %b %u%c%{$fg[white]%}"
# 
setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_PROMPT='%{$fg[default]%}λ'
else # root
  PR_PROMPT='%{$fg[default]%}>'
fi

local current_dir='%{$fg[cyan]%}%~%{$fg[white]%}'

git_status='${vcs_info_msg_0_}'

PROMPT="
╭─ ${current_dir} ${git_status}
╰─$PR_PROMPT "

}

