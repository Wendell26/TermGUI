#!/bin/bash
echo "Termux GUI Uninstaller"
echo "Disabling X11..."
apt remove x11-repo -y >/dev/null 2>&1
echo "Removing VNC Server..."
apt remove tigervnc -y >/dev/null 2>&1
echo "Setting up stuff..."
rm -rf $HOME/.vnc
echo "export DISPLAY=""" >> $PREFIX/etc/bash.bashrc
echo "Removing MATE..."
apt remove mate* marco caja thunar -y >/dev/null 2>&1
echo "Uninstalling Zenity dialog utility..."
apt remove zenity -y >/dev/null 2>&1
echo "Uninstallíng other stuff..."
apt remove xorg-xmessage -y >/dev/null 2>&1
echo "Done! Want remove other stuff like browser?"
read -p "Y/n) " removestuff
if [ "$removestuff" == "Y" ]; then
apt remove gedit firefox netsurf -y >/dev/null 2>&1
else
echo "Stuff uninstallation aborted."
fi
echo -e "To \e[0;32minstall again:\e[0;97m bash install.sh"
exit 0
