# https://wiki.archlinux.org/title/fish#Start_X_at_login
# *: Really dumb fix, if the tmux session is opened on the host then fish will crash when trying to open a new pane via SSH
# if status is-login
#     and not set -q TMUX # *
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         set -x GTK_USE_PORTAL 1
#         set -x XDG_CURRENT_DESKTOP i3
#         exec startx -- -keeptty
#     end
# end
