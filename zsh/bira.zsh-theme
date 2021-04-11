# Based on bira theme
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:*:*' unstagedstr "[!]"
zstyle ':vcs_info:*:*' stagedstr "[+]"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%{$fg[white]%}on %{$fg[red]%}%b %u%c%{$fg[white]%}"
setopt prompt_subst

() {

local PR_PROMPT

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
 current_dir="%B%F{cyan}%~%f%b"
 PR_PROMPT='%B%{$fg[cyan]%}>>>'
else # root
  current_dir="%B%F{red}%~%f%b"
PR_PROMPT='%B%F{red}###'
fi

# local current_dir='%B%F{blue}${PWD/#$HOME/⌁}%F{white}'
local git_branch='${vcs_info_msg_0_}'

PROMPT="
${current_dir} ${git_branch}
$PR_PROMPT "


}
