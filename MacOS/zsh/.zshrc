RANDOMSCRIPTS="$HOME/github_repos/Random-Scripts"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b '

# Set prompt
setopt PROMPT_SUBST
PROMPT='%F{14}%n%f%B[%b%F{13}%1~%f%B]%b %F{red}󰊢 ${vcs_info_msg_0_}%f%B%F{46}-%f%b '

# Use vim keys
# set -o vi

# Export local path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

# Tell zsh not to save any commands starting with a space
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# Set editor to neovim
export EDITOR="/usr/local/bin/nvim"

# Run previous command as sudo
alias please='sudo !!'

# Arduino-cli aliases
alias an='arduino-cli sketch new'

# Logout command
alias lo='launchctl bootout user/$(id -u 503)'

# Logout
alias lo='osascript -e '\''tell application "System Events" to keystroke "q" using {control down, command down}'\'

# Restart command
alias rb='osascript -e '\''tell application "System Events" to keystroke "r" using {option down, command down}'\'

# Poweroff command
alias po='osascript -e '\''tell application "System Events" to keystroke "q" using {option down, command down}'\'

# Start Postgres Server
alias postgres='/usr/local/opt/postgresql@14/bin/postgres -D /usr/local/var/postgresql@14'
alias localpsql='psql -h localhost -p 5432 -d postgres -U postgres'

# Alias history command to show time next to command
alias history='history -i'

# Alias to clear terminal
function cl() {
    if [ $(date +'%m') -eq '12' ]; then
        python3 "$HOME/github_repos/Random-Scripts/clear_screen_snowfall.py"
    else
        bash "$HOME/github_repos/Random-Scripts/generate_random.sh"
    fi
}
# Alias cat to bat
alias cat="bat -fn --theme base16"

# Refresh zsh session
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

# Open nvim straight to sql
alias vs='/usr/local/bin/nvim -c :DBUI'

# Work on Python file
alias p='/usr/local/bin/nvim $HOME/bitbucket_repos/jordanw/Python/ -c '\'':execute "normal jjjj" | :execute "normal ma"'\'

# Modify MacOS zshrc file
alias zsh="/usr/local/bin/nvim $HOME/.config/MacOS/zsh/.zshrc"

# Run ssh in kitty
alias s='kitty +kitten ssh'
alias s1='kitty +kitten ssh etl-prod01'
alias s2='kitty +kitten ssh etl-prod02'
alias sql='kitty +kitten ssh redshift-bastion'

# Show image in terminal
alias imgshow='kitty +kitten icat'

# Always mkdir creating parent directories if not exists and run verbose
alias mkd='mkdir -pv'

# Add verbose and interactive options to potentially destructive commands
alias cp='cp -v'
alias cpd='cp -rv'
alias mv='mv -v'
alias rm='rm -v'
alias rmd='/bin/rm -rv'

# Alias to ls command
alias ls='lsd -alhr --group-directories-first'

# Alias for ping command to only run 3 times
alias ping='ping -c 3'

# Change directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Git commands
alias create="bash $RANDOMSCRIPTS/create_git_repo.sh" # create git repo
alias delete="bash $RANDOMSCRIPTS/delete_git_repo.sh" # delete git repo
alias ga='git add' # choose files to add to git staging area
alias gaa='git add .' # add all files to git staging area
alias gbl='git branch -a' # list branches of git repo
alias gbd='git branch -d' # delete specified branch of git repo
alias gc='git commit' # write a longer message with a new git commit
alias gca='git commit --amend -m' # ammend the message of a previous git commit
alias gcaf='git commit --amend' # choose a new file to add to previous git commit
alias gcl='git clean -df' # remove all untracked git files and directories
alias gclo='git clone' # clone git repo
alias gcm='git commit -m' # include a one line message with new git commit
alias gco='git checkout' # choose a file to unmodify or a different git branch to switch to
alias gcon='git checkout -b' # create and instantly switch to new git branch
alias gcor='git checkout -' # checkout most recently checked out git branch
alias gcp='git cherry-pick' # insert git commit hash to move to a new branch
alias gd='git difftool --tool=nvimdiff' # view diffs of unstaged git files
alias gds='git difftool --tool=nvimdiff --staged' # view git diffs of staged files
alias gita="bat -fn --theme base16 ~/.zshrc | grep -iw git" # show all git aliases
alias gl='git log' # show a log of previous git commits
alias glo='git log --oneline' # show a short log of previous git commits
alias gm='git merge' # merge named git branch to current git branch
alias gp="bash $RANDOMSCRIPTS/pull_all_git_repos.sh" # Pull all git repos simultaneously
alias gpull='git pull' # equalizes local and remote git repo
alias gpush='git push' # push commits to from local to remote git repo
alias grh='git reset --hard' # roll all tracked files back to state of git hash you choose
alias grm='git reset' # insert git commit hash to undo commit but keep changes and remove from staging
alias grs='git reset --soft' # insert git commit hash to undo commit but keep changes in staging
alias gs='git status' # show a shorter status of a git directory
alias gsl='git status' # show the status of a git directory
alias gss='git status -s' # show a shorter status of a git directory
alias gu='git restore --staged' # unstage a staged git file
alias gw='git when' # see when the last pull or fetch was made(custom git alias)

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

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
