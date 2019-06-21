#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
PATH=$PATH:~/Documents/sourceProjects/Theatron/scripts/
PATH=$PATH:~/.config/i3/
PATH=$PATH:~/.config/herbstluftwm/
PATH=$PATH:~/Documents/appImages/
PATH=$PATH:~/go/bin/
PATH=$PATH:~/netbeans-8.2/bin/
PATH=$PATH:~/.emacs.d/bin/
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# ---- WERK STUFF -------------------------------------------------------------
PATH=$PATH:/opt/PostgreSQL/9.6/bin
export PATH

JAVA_HOME=/usr/java/latest
export JAVA_HOME
#------------------------------------------------------------------------------
alias hc="herbstclient"
alias gc="git commit -m"
alias gp="git push origin master"
alias gt="git push origin test"
alias gsa="git stage *"
alias gs="git stage"
alias gb="go build *.go"
alias gr="go run *.go"
alias i="sudo zypper install"
alias id="sudo zypper install --no-recommends"
alias r="sudo zypper remove"
alias hl="emacsclient -c ~/.config/herbstluftwm/autostart"
alias lidea="sh ~/Documents/idea-IU-183.5429.30/bin/idea.sh"
alias goland="sh ~/Documents/GoLand-2018.3.5/bin/goland.sh"
alias polycon="code ~/.config/polybar/config"
alias m="export DISPLAY=:0"
alias kx="sudo killall X"
alias cord="export TERM=xterm-256color && 6cord -fgc 0"
alias d="bash ~/.config/herbstluftwm/dialogListener && hc rule windowtype='_NET_WM_WINDOW_TYPE_DIALOG' manage=on focus=on tag=dialog hook=dialog"
alias u="sudo zypper dup"
alias y="xdg-su -c /sbin/yast2"
alias ca="cd ~/go/src/goland/"
alias chaar="cd ~/go/src/haarTransformation/"
alias cgtms="cd ~/Documents/work/gtms/"
alias netbeans11="cd Documents/work/Archived/incubating-netbeans-11.0-bin/netbeans/bin/ && ./netbeans"
alias gpodder="python3 ~/Documents/sourceProjects/gpodder/bin/gpodder"
alias pd="cd /home/davidv7/gPodder/Downloads && find . -mindepth 2 -type f -name '*.mp3' -print -exec mv {} . \;"
alias wr="cd ~/Documents/work/"
alias chrome="google-chrome-stable"
alias pm="cd ~/Documents/appImages/Postman/app && ./Postman"
alias tidal="google-chrome-stable --app=https://listen.tidal.com/ &"
alias discord="google-chrome-stable --app=https://discordapp.com/channels/@me/"

fpath=(~/.zsh/zsh-completions/ $fpath)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
set bell-style none
xset b off
export MANPAGER='nvim +Man!'
transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | xclip -i -selection clipboard;
}

mc() {
    mkdir -p "$1"; cd "$1";
}
em() {
    emacsclient -c "$@" & disown ; exit
}
emc() {
    emacsclient -c "$@" & disown ; exit
}
time_since_last_command() {
    unset time_passed tp
    new_epoch="$(date +%s%3N)"
    [[ -n $epoch ]] || return
    tp="$(( $new_epoch - $epoch ))" && tp="$(( $tp / 1000 ))"
    [[ $tp -ge 5 ]] || return
    local H=$(($tp/60/60%24));   local M=$(($tp/60%60));   local S=$(($tp%60))
    if [[ $H -ne 0 ]]; then; time_passed="${H}h ${M}m ${S}s"; elif [[ $M -ne 0 ]]; then; time_passed="${M}m ${S}s"; else; time_passed="${S}s"; fi
}

precmd() {time_since_last_command; unset epoch }
preexec() {  epoch="$(date +%s%3N)" }
RPROMPT=$'${time_passed}'
