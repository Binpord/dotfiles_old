# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# vadim
alias mc='. /usr/libexec/mc/mc-wrapper.sh'
alias vim='vimx'
alias ls='ls -alh --color --group-directories-first'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

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
#====================================================
# if bash (example in the tmux) hangs and do not respond to anything - probably hitted Ctrl-s => need to click Ctrl-q
#====================================================
# Ctrl-a - beginning of the line (first letter)
# Ctrl-e - end of the line
# Ctrl-r - reverse history search in bash (Ctrl-r again for less resent variant)
#====================================================
##### journalctl		- command to view logs
#----------------------------------------------------
# journalctl --since "2015-01-10 17:15:00" --until "1 hour ago"
# journalctl --since today
#----------------------------------------------------
# journalctl -u nginx.service	- view by unit (in the example - for service nginx
#----------------------------------------------------
# journalctl -k			- only kernel messages
#----------------------------------------------------
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
#----------------------------------------------------
# journalctl -f			- follow: works as tail -f
#----------------------------------------------------
# configuration file is in /etc/systemd/journald.conf
#====================================================
# ldconfig -p | grep libjpeg	- check the version, location, existence of the library (replace jpeg with the one you search for)
