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

setopt GLOB_DOTS
setopt GLOB_STAR_SHORT

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

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

# TODO: move to .xinitrc?
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    # turn off bell
    xset b off 2>/dev/null
    # 200 ms to start autorepeat with 35 Hz frequency
    xset r rate 200 35 2>/dev/null
fi

###############################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

antigen bundle 'wfxr/forgit'

antigen bundle 'changyuheng/fz'
antigen bundle 'rupa/z'

antigen apply

###############################################################################

# powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# FZF
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
export FZF_CTRL_T_OPTS="--exit-0 --preview '(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | less -F'"
export FZF_ALT_C_OPTS="--exit-0 --preview 'tree -C -d --noreport {} | less'"

fzf-ripvim-widget() {
    local selected
    setopt localoptions pipefail no_aliases 2> /dev/null
    selected=$(eval rg --with-filename --hidden --line-number --no-heading --color=always --colors 'match:none' --smart-case -- . $BUFFER |
               fzf --ansi -d: --with-nth=1,2,3 --nth=3 | awk -F':' '{print $1" +"$2}')
    local ret=$?
    if [ -n "$selected" ]; then
        xargs -o vim <<< $selected
        print -s "vim $selected"
    fi
    zle reset-prompt
    return $ret
}

zle     -N   fzf-ripvim-widget
bindkey '^F' fzf-ripvim-widget

# thefuck
eval $(thefuck --alias f)

source /home/ididitbad/.config/broot/launcher/bash/br
