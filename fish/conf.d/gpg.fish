# export SSH_AUTH_SOCK=(gpgconf --list-dir agent-ssh-socket)
export GPG_TTY=(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
