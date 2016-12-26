EDITOR=/usr/bin/vim
VISUAL=/usr/bin/vim
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
unsetopt beep
bindkey -e

# End of lines configured by zsh-newuser-install

precmd () {print -Pn "\e]0;%~\a"}
alias ls="ls --color=auto -lht"
alias ll="ls -lAht"
alias l="ls -lht"
alias cll="clear && ll"
alias cl="clear && l"
alias cal="cal -3 --color"

STEAM_LIBS_64='/home/phrb/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu'
STEAM_LIBS_64_2='/home/phrb/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu'

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# The following lines were added by compinstall
zstyle :compinstall filename '/home/phrb/.zshrc'

autoload -Uz compinit promptinit
compinit
# End of lines added by compinstall
promptinit
prompt off

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# CUDA toolkit
export PATH="$PATH:/opt/cuda/bin/"

# Julia Nightly
#export PATH="$PATH:/home/phrb/.bin/julia-9c76c3e89a/bin/"
#alias juliaN="/home/phrb/.bin/julia-9c76c3e89a/bin/julia"
# Julia 0.5
export PATH="$PATH:/home/phrb/.bin/julia-3c9d75391c/bin/"
alias julia="/home/phrb/.bin/julia-3c9d75391c/bin/julia"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
