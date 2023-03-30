# Set prompt
PROMPT='%F{14}%n%f%B[%b%F{13}%1~%f%B]%b %B%F{46}-%f%b '
# PROMPT='%F{14}%n%f%B[%b%F{13}%1~%f%B]%b %B%F{46}->%f%b '
# PROMPT='%n%[%1~] '

# Use vim keys
# set -o vi

# Export local path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/finished_scripts"

# Tell zsh not to save any commands starting with a space
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# Set editor to vim
export EDITOR="/usr/local/bin/nvim"

# Run previous command as sudo
alias please='sudo !!'

# Logout command
alias lo='launchctl bootout user/$(id -u 503)'

# Logout
alias lo='osascript -e '\''tell application "System Events" to keystroke "q" using {control down, command down}'\'

# Restart command
alias rb='osascript -e '\''tell application "System Events" to keystroke "r" using {option down, command down}'\'

# Poweroff command
alias po='osascript -e '\''tell application "System Events" to keystroke "q" using {option down, command down}'\'

# Alias history command to show time next to command
alias history='history -i'

# Alias to clear terminal
alias cl="clear"

# Refresh my zsh session
alias ref="source $HOME/.zshrc"

# Youtube-dl command
alias song='youtube-dl -f bestvideo+bestaudio -o "%(title)s.%(ext)s"'

# Bind nvim to v
function v() {
	if [ -z "$1" ]; then
		/usr/local/bin/nvim .
	else
		/usr/local/bin/nvim "$1"
	fi
}

# Open vim straight to sql
alias vs='/usr/local/bin/nvim -c :DBUI'

# Work on Python file
alias p='/usr/local/bin/nvim $HOME/finished_scripts/jordanw/Python/ -c '\'':execute "normal jjjj" | :execute "normal ma"'\'

# Modify the zshrc file
alias zsh="/usr/local/bin/nvim $HOME/.zshrc"

# Run ssh in kitty
alias s='kitty +kitten ssh'
alias s1='kitty +kitten ssh etl-prod01'
alias s2='kitty +kitten ssh etl-prod02'

# Show image in terminal
alias imgshow='kitty +kitten icat'

# Always mkdir with preffered options
alias mkd='mkdir -pv'

# Add verbose and interactive options to potentially destructive commands
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias rmd='/bin/rm -rv'

# Alias to ls command
alias ls='lsd -alhr --group-directories-first'

# Alias for ping command to only run 3 times
alias ping='ping -c 3'

# Alias for tldr(a short version of man)
alias man='tldr'

# Change directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Git commands
alias grs='git reset --soft' # insert commit hash to undo commit but keep changes in staging area
alias grm='git reset' # insert commit hash to undo commit but keep changes and remove from staging area
alias grh='git reset --hard' # roll all tracked files back to state of hash you choose
alias gcp='git cherry-pick' # insert commit hash to move that commit to a new branch
alias gco='git checkout' # choose a file to unmodify or a different branch to switch to
alias gsl='git status' # show the status of a git directory
alias gs='git status -s' # show a shorter status of a git directory
alias ga='git add' # choose files to add to git staging area
alias gaa='git add .' # add all files to staging area
alias gb='git branch' # view branches of git repo
alias gc='git commit' # write a longer message with a new commit
alias gcm='git commit -m' # include a one line message with new commit
alias gca='git commit --amend -m' # ammend the message of a previous commit
alias gcaf='git commit --amend' # choose a new file to add to previous commit
alias gp='git push' # push commits to github
alias gl='git log' # show a log of previous git commits
alias glo='git log --oneline' # show a short log of previous git commits
alias gd='git difftool' # view diffs of unstaged files
alias gds='git difftool --staged' # view diffs of staged files
alias gcl='git clean -df' # remove all untracked files and directories
alias gitalias="bat -r 92:113 $HOME/.zshrc" # show all git aliases

## Function Alias to extract zipped files
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
