# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt beep nomatch
setopt PROMPT_SUBST
unsetopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
PROMPT='
%F{cyan}%n%f%B[%b%F{13}%1~%f%B]%b %F{red} ${vcs_info_msg_0_}%f%B%F{46}-%f%b '

# Set prompt
zle-line-init() {
    emulate -L zsh

    [[ $CONTEXT == start ]] || return 0

    while true; do
        zle .recursive-edit
        local -i ret=$?
        [[ $ret == 0 && $KEYS == $'\4' ]] || break
        [[ -o ignore_eof ]] || exit 0
    done

    ZSH_HIGHLIGHT_MAXLENGTH=0
    GLYPHLINE=${(pl:$COLUMNS:: :)}
    LOLCATIFIED=$(echo $GLYPHLINE | lolcat --force)
    PROMPT='
${LOLCATIFIED}
%/ '
    RPROMPT=''
    zle .reset-prompt
    PROMPT='
%F{cyan}%n%f%B[%b%F{13}%1~%f%B]%b %F{red} ${vcs_info_msg_0_}%f%B%F{46}-%f%b '

    if (( ret )); then
        zle .send-break
    else
        zle .accept-line
    fi
    return ret
}

zle -N zle-line-init

# Keychain eval
eval $(keychain --eval --quiet reflex_etl_prod01 reflex_etl_prod02 personal_github reflex_bitbucket reflex_sql_redshift-bastion)

# Command Not Found Functionality
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m' red='\e[0;31m'
    printf "${red}zsh: command not found${reset}: %s\n" "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${green}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Include Zstyle
[ -f $XDG_CONFIG_HOME/zsh/.zstyle ] && source $XDG_CONFIG_HOME/zsh/.zstyle

# Include Exports
[ -f $XDG_CONFIG_HOME/zsh/.exports ] && source $XDG_CONFIG_HOME/zsh/.exports

# Include Aliases
[ -f $XDG_CONFIG_HOME/zsh/.aliases ] && source $XDG_CONFIG_HOME/zsh/.aliases

# Source ZSH Plugins
source <(fzf --zsh)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Initialize Zoxide
eval "$(zoxide init --cmd cd zsh)"
