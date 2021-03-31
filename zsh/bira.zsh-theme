# Based on bira theme
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:*:*' unstagedstr ""
zstyle ':vcs_info:*:*' stagedstr "•"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%F{white}%B- (%F{8}%b%u%c%F{white})'

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%B%F{8}λ%b'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%B%F{129}>%b'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%M%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
#local current_dir="%B%F{blue}%~%f%b"
local current_dir='%B%F{51}${PWD/#$HOME/⌁}%F{white}'
local git_branch="$(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})"

git_status='%b%F{white}${vcs_info_msg_0_}%B'

PROMPT="
╭─ ${current_dir} ${git_status}
╰─$PR_PROMPT "
	RPROMPT="${return_code}"


#if [ $git_branch ]; then
#	PROMPT="╭─ ${user_host} ${current_dir} ${git_branch}
#╰─$PR_PROMPT "
#	RPROMPT="${return_code}"
#else
#	PROMPT="╭─ ${user_host} ${current_dir}
#╰─$PR_PROMPT "
#	RPROMPT="${return_code}";
#fi

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
