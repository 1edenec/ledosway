# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

[[ $UID -ne 0 ]] && color=green || color=red

if [[ -n $SSH_CONNECTION ]]
then
	SSH_PROMPT="%{$fg_bold[$color]%}%n%{$reset_color%} %{$fg[yellow]%}at%{$reset_color%} %{$fg_bold[$color]%}%M %{$reset_color%}"
fi
	PS1="
%{$fg_bold[cyan]%}%~%{$reset_color%}
${SSH_PROMPT}%{$fg_bold[$color]%}➜%{$reset_color%} "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt HIST_IGNORE_DUPS # ignore dublicates in history

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$ZDOTDIR/.zhistory"

# Load aliases and shortcuts if existent.
[ -f "$ZDOTDIR/aliases" ] && source "$ZDOTDIR/aliases"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# fzf completion
# Options to fzf command
export FZF_COMPLETION_OPTS='--info=inline --multi --bind="btab:up,tab:down,ctrl-space:toggle"'
source $ZDOTDIR/fzf-zsh-completion.sh
bindkey '^I' fzf_completion


# add "sudo " before last command executed
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == $EDITOR\ * ]]; then
        LBUFFER="${LBUFFER#$EDITOR }"
        LBUFFER="sudoedit $LBUFFER"
    elif [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="${LBUFFER#sudoedit }"
        LBUFFER="$EDITOR $LBUFFER"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# Defined shortcut keys: [ESC]+[ESC]
# bindkey '^[^[' sudo-command-line
 bindkey '^S' sudo-command-line


# from the fzf-keybindings we get:
# CTRL-T - Paste the selected file path(s) into the command line
# ALT-C - cd into the selected directory
# CTRL-R - Paste the selected command from history into the command line
source  /usr/share/fzf/key-bindings.zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


