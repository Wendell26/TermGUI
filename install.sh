#!/bin/bash
setlogin() {
echo "bash $HOME/.vnc/login/login.sh" >> $HOME/.vnc/xstartup
read -p "Setup login now? (Y/n) " setlogin
if [ "$setlogin" == "Y" ]; then
read -p "Name: " nm
read -p "Username: " user
read -p "Password: " passwd
echo "Saving..."
rm -rf $HOME/.vnc/login/*.txt
echo "$nm" >> $HOME/.vnc/login/name.txt
echo "$user" >> $HOME/.vnc/login/user.txt
echo "$passwd" >> $HOME/.vnc/login/passwd.txt
echo "Done!"
else
echo "Manual setup:"
echo -e "\e[0;34mTo set default login, go to $HOME/.vnc/login."
echo -e "\e[0;34mOn this directory has 3 files (four, with login.sh)."
echo -e "\e[0;33m• name.txt: Your name"
echo -e "\e[0;33m• user.txt: Your username"
echo -e "\e[0;33m• passwd.txt: Your password"
echo -e "\e[0;34mSet this files and try login on system.\e[0;97m"
fi
}                                                                                                                                    
echo "Termux GUI Installer"                                                                                                          
echo "Enabling X11..."                                                                                                               
apt install x11-repo -y >/dev/null 2>&1
echo "Downloading VNC Server..."                                                                                                     
apt install tigervnc -y >/dev/null 2>&1
echo "Preparing first use..."
vncserver
pkill Xvnc                                                                                                                           
echo "Setting up xstartup and stuff..."
rm -rf $HOME/.vnc/xstartup
cp -r ./login $HOME/.vnc
echo "#!/bin/bash" >> $HOME/.vnc/xstartup
setlogin
echo "mate-session &" >> $HOME/.vnc/xstartup
chmod +x $HOME/.vnc/xstartup
echo "export DISPLAY=":1"" >> $PREFIX/etc/bash.bashrc
echo "Downloading MATE..."
apt install mate* marco caja thunar -y >/dev/null 2>&1
echo "Installing Zenity dialog utility..."
apt install zenity -y >/dev/null 2>&1
echo "Installíng other stuff..."
apt install xorg-xmessage -y >/dev/null 2>&1
echo "Done! Want install other stuff like browser?"
read -p "Y/n) " installstuff
if [ "$installstuff" == "Y" ]; then
apt install gedit firefox netsurf -y >/dev/null 2>&1
else
echo "Stuff instalation aborted."
fi
echo -e "To \e[0;32mstart server:\e[0;97m vncserver"
echo -e "To \e[0;31mstop server:\e[0;97m vncserver -kill :<display>"
exit 0
