# ===========================================
#
#           ZSH profile
#           place to $HOME/.zprofile
#
# ===========================================

# autostart X on login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
