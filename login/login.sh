#!/bin/bash
if [ ! -f "$HOME/.vnc/login/name.txt" ] && [ ! -f "$HOME/.vnc/login/user.txt" ] && [ ! -f "$HOME/.vnc/login/passwd.txt" ]; then                         zenity --error --text "Error: no default credentials found. You can edit it on $HOME/.vnc/login (name.txt, passwd.txt and user.txt)."                   pkill Xvnc                                                                                                                                              exit 0                                                                                                                                                  fi
MAIN_USER=$(cat $HOME/.vnc/login/user.txt)                                                                                                              MAIN_PASS=$(cat $HOME/.vnc/login/passwd.txt)                                                                                                            USER=$(zenity --entry --text "Username")                                                                                                                PASS=$(zenity --password --text "Password")
if [ "$MAIN_USER" == "$USER" ] && [ "$MAIN_PASS" == "$PASS" ]; then
zenity --info --text "Logged sucessfully. Welcome, $(cat $HOME/.vnc/login/name.txt)!"
else
zenity --error --text "Invalid credentials. Try again later."
pkill Xvnc
exit 0
fi
