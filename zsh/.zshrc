### COMMON SETTINS ############################################################
# TODO: move to .profile?

export LANG=en_US.UTF-8
export EDITOR="vim"

### ZSH SETTINS ###############################################################

export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt AUTO_CD
setopt CDABLE_VARS
setopt CD_SILENT

setopt GLOB_STAR_SHORT

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt CORRECT

fpath=(~/.zsh.d/ $fpath)

###############################################################################

function dvim() {
    if (( 2 * $LINES <= $COLUMNS )); then
        /usr/bin/env vim -O "$@"
    else
        /usr/bin/env vim -o "$@"
    fi
}

alias xclip="xclip -selection clipboard"
alias top="top -o%MEM"
alias diff="diff --color=auto"
alias vim="dvim"

###############################################################################

# disable ctrl+s "hang" behavior
stty -ixon

#### PLUGINS ##################################################################

if [[ ! -d ~/.antigen ]]; then
    git clone https://github.com/zsh-users/antigen ~/.antigen
fi

source ~/.antigen/antigen.zsh

antigen theme 'romkatv/powerlevel10k'

antigen use 'oh-my-zsh'
antigen bundle 'git'
antigen bundle 'colored-man-pages'
antigen bundle 'extract'

antigen bundle 'zsh-users/zsh-autosuggestions'
antigen bundle 'zsh-users/zsh-completions'
antigen bundle 'zsh-users/zsh-syntax-highlighting'

antigen apply

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

###############################################################################

# FZF
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
export FZF_CTRL_T_OPTS="--exit-0 --preview '(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | less -F'"
export FZF_ALT_C_OPTS="--exit-0 --preview 'tree -C -d --noreport {} | less'"

