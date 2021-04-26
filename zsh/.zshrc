## Set Environment
EDITOR="nvim"
VISUAL="gedit"

## "vim" as manpager
export MANPAGER='/bin/zsh -c "nvim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

## "bat"  as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

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
alias lt='lsd -l --tree'
alias cl='clear; bash $HOME/Random-Scripts/generate_random.sh | lolcat'
alias ref='source $HOME/.config/zsh/.zshrc'
alias v='nvim'
alias vim='nvim'
alias vimwiki='v ~/vimwiki/index.wiki'
alias vw='v ~/vimwiki/index.wiki'
alias zshrc='v $HOME/.config/zsh/.zshrc'
alias sound='pavucontrol'
alias cat='bat'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkd='mkdir -pv'
alias rmorphan="doas pacman -Rns $(pacman -Qtdq)"
alias orphans='pacman -Qtdq'
alias fixpacman="doas rm /var/lib/pacman/db.lck"
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias upd='yay -Syu'
alias backup='doas rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/home/jordan/Downloads/*","/home/jordan/.cache/*","/lost+found"} /run/media/jordan/8fd20769-3607-44e1-87b4-d36bda05b924/'
alias song='youtube-dl -x --audio-format mp3 --audio-quality 320k -o "%(title)s.%(ext)s"'
alias snapshot='doas timeshift --create && doas update-grub'
alias insert='pass insert -m'
alias generate='pass generate -ic'
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git log'
alias gd='git difftool'
alias gds='git difftool --staged'

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

