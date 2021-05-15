## Set Environment
EDITOR="nvim"
VISUAL="gedit"

## set grep color
export GREP_COLORS="sl=01;90"

## setup time command to only show the total time
export TIMEFMT="%*E"

## "vim" as manpager
# export MANPAGER='/bin/zsh -c "nvim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

## "bat"  as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

## Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

## Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -U colors && colors

## Options section
#setopt correct             # Auto correct mistakes
setopt extendedglob         # Extended globbing. Allows using regular expressions with *
setopt nocaseglob           # Case insensitive globbing
setopt rcexpandparam        # Array expension with parameters
setopt nocheckjobs          # Don't warn about running processes when exiting
setopt numericglobsort      # Sort filenames numerically when it makes sense
setopt nobeep               # No beep
setopt appendhistory        # Immediately append history instead of overwriting
setopt histignorealldups    # If a new command is a duplicate, remove the older one
setopt autocd               # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus



## Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                   # automatically find new executables in path 
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'


## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

zmodload zsh/complist

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

## use the vim keys for tab menu navigation
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

## vim mode on terminal line
bindkey -v
export KEYTIMEOUT=1

## fix backspacing after changing vim modes on terminal line
bindkey "^?" backward-delete-char

## change cursor shape for different vim modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select

## initiate vim insert mode on startup
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-line-init

## use beam cursor on startup
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

## Useful Aliases 
alias sudo='doas'
alias ls='lsd -al'
alias cl='clear; bash $HOME/Random-Scripts/generate_random.sh'
alias ref='source $HOME/.config/zsh/.zshrc'
alias v='nvim'
alias vw='v ~/vimwiki/index.wiki'
alias tra='transmission-remote -a --download-dir /home/jordan/kvmISOs/'
alias trl='transmission-remote -l'
alias trt='transmission-remote -t'
alias trs='bash /home/jordan/Random-Scripts/tor.sh'
alias trim='/home/jordan/Random-Scripts/trim.sh'
alias zsh='v $HOME/.config/zsh/.zshrc'
alias sound='pavucontrol'
alias cat='bat'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkd='mkdir -pv'
alias fixpacman="su; rm /var/lib/pacman/db.lck; exit"
alias wget='cd ~$USER/Downloads/; wget -c '
alias grep='grep --color=auto'
alias lynx='lynx -vikeys'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias upd='sudo updatedb -v; paru --skipreview -Syu'
alias backup='sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/home/jordan/Downloads/*","/home/jordan/.librewolf/*","/home/jordan/.cache/*","/lost+found"} /run/media/jordan/8fd20769-3607-44e1-87b4-d36bda05b924/'
alias song='youtube-dl -x --audio-format mp3 --audio-quality 320k -o "%(title)s.%(ext)s"'
alias snapshot='sudo timeshift --create && sudo update-grub'
alias insert='pass insert -m'
alias generate='pass generate -ic'
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
alias clean='git clean -df' # remove all untracked files and directories
alias gitalias='alias | grep "git "' # show all git aliases

## Function Alias
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

bash $HOME/Random-Scripts/get_colorscript.sh # Command to run on launch

## Theme
source /usr/share/zsh/themes/bira.zsh-theme


## Plugins section: Enable fish style features
# Use autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

