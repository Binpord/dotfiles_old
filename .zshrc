#
# tmux shortcut
#
[[ -z "$NOTMUX" && -z "$TMUX" && "$UID" == "$(stat -c "%u" "${(%):-%x}")" ]] && type -f tmux 2>/dev/null && exec tmux

### Added by Zplugin's installer
source '/home/vadim/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zplugin load psprint zsh-navigation-tools
zplugin load zdharma/zui
zplugin load zsh-users/zsh-autosuggestions

# vadim
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias vim='vimx'
alias ls='ls -alh --color --group-directories-first'

autoload -Uz compinit
compinit

# Vi mode
bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    zle reset-prompt
}


export KEYTIMEOUT=1

#### Notes on useful bash commands (used to live in Google Keep)
# ln -s somefile somelink	- creating a link to file (ln is for link)
# tail somefile			- prints last 10 lines in file
# tail -f somefile		- tracking changes in file in real time
# shutdown -h[halt]/-r[restart] time - time = now / +10[minutes]
# w - who is logged in (user and some sys info)
# sudo netstat -tupln
# cut ...
# wc ...
# sort ...
# setsid ...		- run a program in a new session
# ====================================================
# if bash (example in the tmux) hangs and do not respond to anything - probably hitted Ctrl-s => need to click Ctrl-q
# ====================================================
# Ctrl-a - beginning of the line (first letter)
# Ctrl-e - end of the line
# Ctrl-r - reverse history search in bash (Ctrl-r again for less resent variant)
# ====================================================
##### journalctl		- command to view logs
# ----------------------------------------------------
# journalctl --since "2015-01-10 17:15:00" --until "1 hour ago"
# journalctl --since today
# ----------------------------------------------------
# journalctl -u nginx.service	- view by unit (in the example - for service nginx
# ----------------------------------------------------
# journalctl -k			- only kernel messages
# ----------------------------------------------------
# journalctl -p err -b		- view log messages with "error" priority from current boot
# Priority values:
# 0: emerg
# 1: alert
# 2: crit
# 3: err
# 4: warning
# 5: notice
# 6: info
# 7: debug
# ----------------------------------------------------
# journalctl -f			- follow: works as tail -f
# ----------------------------------------------------
# configuration file is in /etc/systemd/journald.conf
# ====================================================
# ldconfig -p | grep libjpeg	- check the version, location, existence of the library (replace jpeg with the one you search for)
# ====================================================
# xdg-open (eog in gnome)	- standart image viewer
# feh 				- another image viewer
# ====================================================
# dracut -v -f			- solves issue with "Failed to find module 'vboxdrv'" errors in journalctl after kernel changes
# ====================================================
# ar -t mylib.a			- list objects in the .a lib
# ar -xv mylib.a myobj.o	- extract myobj.o from mylib.a
# for more see man ar
# ====================================================
# /etc/dnf/dnf.conf		- dnf config (to exclude some packages, etc)
# ====================================================
# clang --help			- clang "manual" page
# ====================================================
# to search for the exact header file:
# dnf whatprovides '*/gdicmn.h'		- don't know why, but without */ doesn't work
# ====================================================
# Close tty:
# systemctl stop getty@tty4.service
