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

## vi mode
bindkey -v
export KEYTIMEOUT=1

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

## Useful Aliases

# Bind 'sudo' to the 'doas' command
alias sudo='doas'

# Run 'lsd' whenever I 'ls'
alias ls='lsd -al'

# Run 'ping -c 3' whenever I 'ping'
alias ping='ping -c 3'

# Run 'paru -S --skipreview'
alias parui='paru -S --skipreview'

# Run a special script to clear a page
alias cl='clear; bash $HOME/Random-Scripts/generate_random.sh'

# Refresh my zsh session
alias ref='source $HOME/.config/zsh/.zshrc'

# Modify the zshrc file
alias zsh='v $HOME/.config/zsh/.zshrc'

# Run ssh in kitty
alias ssh='kitty +kitten ssh'

# Bind 'nvim' to 'v'
alias v='nvim'

# Bring up the vimwiki for notetaking
alias vw='v ~/vimwiki/index.wiki'

# Mount the work directory
alias work='sudo mount -t ecryptfs ~/Documents/Work ~/Documents/Work'

# Convert a document to pdf
alias convert='soffice --headless --convert-to pdf'

# Transmission-Remote commands
alias tra='transmission-remote -a --download-dir /home/jordan/kvmISOs/'
alias trl='transmission-remote -l'
alias trt='transmission-remote -t'
alias trs='bash /home/jordan/Random-Scripts/tor.sh'

# Show image in terminal
alias imgshow='kitty +kitten icat'

# Trim a song with ffmpeg
alias trim='/home/jordan/Random-Scripts/trim.sh'

# Pull up pavucontrol when my sound setup is acting up
alias sound='pavucontrol'

# Bind the 'cat' program to the 'bat' program
alias cat='bat'

# Copy weekly update file to clipboard
alias copy='\cat /home/jordan/vimwiki/Weekly\ Update.md | xclip -selection clipboard'

# Always copy, move, and remove interactively and verbosely
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias rmd='rm -rv'
alias cpd='cp -rv'

# Always make a directory as well as any needed directories in the path
alias mkd='mkdir -pv'

# Fix pacman when broken
alias fixpacman="su; rm /var/lib/pacman/db.lck; exit"

# Automatically change to the download directory when using 'wget'
alias wget='cd ~$USER/Downloads/; wget -c '

# Always use color with the 'grep' command
alias grep='grep --color=auto'

# Always use lynx with the vim keys
alias lynx='lynx -vikeys'

# Change directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Update command
alias upd='sudo updatedb -v; paru --skipreview -Syu'

# Backup command
alias backup='sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/home/jordan/Downloads/*","/home/jordan/.librewolf/*","/home/jordan/.cache/*","/lost+found"} /run/media/jordan/8fd20769-3607-44e1-87b4-d36bda05b924/'

# Youtube-dl command
alias song='youtube-dl -f bestvideo+bestaudio -o "%(title)s.%(ext)s"'

# Timeshift snapshot command
alias snapshot='sudo timeshift --create'

# Pass - the standard unix password manager commands
alias insert='pass insert -m'
alias generate='pass generate -ic'

# Git commands
alias grs='git reset --soft' # insert commit hash to undo commit but keep changes in staging area
alias grm='git reset' # insert commit hash to undo commit but keep changes and remove from staging area
alias gco='git checkout' # choose a file to unmodify or a different branch to switch to
alias gsl='git status' # show the status of a git directory
alias gs='git status -s' # show a shorter status of a git directory
alias ga='git add' # choose files to add to git staging area
alias gaa='git add .' # add all files to staging area
alias gb='git branch' # view branches of git repo
alias gc='git commit' # write a longer message with a new commit
alias gcm='git commit -m' # include a one line message with new commit
alias gp='git push' # push commits to github
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
RPROMPT='$CONDA_ENV'

bash $HOME/Random-Scripts/get_colorscript.sh # Command to run on launch

## Source ZSH Stuff
## Theme
source /usr/share/zsh/themes/bira.zsh-theme
## Plugins section: Enable fish style features
# Use autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## Fuzzy Finder
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Zsh you should use plugin
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
# Initiate conda
source /home/jordan/anaconda3/bin/activate