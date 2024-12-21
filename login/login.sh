#!/bin/bash
if [ ! -d "$HOME/.creds" ]; then
zenity --error --text "Error: no default credentials found. You can edit it on $HOME/.creds/(name.txt, passwd.txt and user.txt)."
pkill Xvnc
exit 0
fi
MAIN_USER=$(cat $HOME/.creds/user.txt)
MAIN_PASS=$(cat $HOME/.creds/passwd.txt)
USER=$(zenity --entry --text "Username")
PASS=$(zenity --password --text "Password")
if [ "$MAIN_USER" == "$USER" ] && [ "$MAIN_PASS" == "$PASS" ]; then
xmessage -center "Welcome, $(cat $HOME/.creds/name.txt)!"
else
zenity --error --text "Invalid credentials. Try again later."
pkill Xvnc
exit 0
fi

