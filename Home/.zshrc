# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/vadim/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# -----------------------------------------
# plugin configuration
# -----------------------------------------

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=true

# ----------------------------------------
# end of plugin configuration
# ----------------------------------------

plugins=(git dnf systemd tmux vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# =========================================
# vadim
# =========================================


# -----------------------------------------
# other aliases and settings
# -----------------------------------------
alias ls='ls -alh --color --group-directories-first'

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

export KEYTIMEOUT=1

source /usr/lib/mc/mc.sh

#### Notes on useful bash commands
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
##### journalctl
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
# ====================================================
# Reflector script (from reflector package)
# Verbosely rate and sort the five most recently synchronized mirrors by download speed, and overwrite the file /etc/pacman.d/mirrorlist:
# sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
# ====================================================
# cower - AUR agent (auto downloading / checking for updates)
# cower -s		- search
# cower -d		- download
# cower -vdu		- verbose, download, updates - update AUR packages
# ====================================================
# stat -c %h -- "$file"			- echos amount of hardlinks to file
