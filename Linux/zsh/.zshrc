# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep nomatch
unsetopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Set prompt
setopt PROMPT_SUBST
PROMPT='%F{14}%n%f%B[%b%F{13}%1~%f%B]%b %F{red} ${vcs_info_msg_0_}%f%B%F{46}-%f%b '

# Tell zsh not to save any commands starting with a space
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# Include Zstyle
[ -f $XDG_CONFIG_HOME/zsh/.zstyle ] && source $XDG_CONFIG_HOME/zsh/.zstyle

# Include Exports
[ -f $XDG_CONFIG_HOME/zsh/.exports ] && source $XDG_CONFIG_HOME/zsh/.exports

# Include Aliases
[ -f $XDG_CONFIG_HOME/zsh/.aliases ] && source $XDG_CONFIG_HOME/zsh/.aliases

# Source ZSH Plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
