#!/bin/bash
set -e


#EXTENSIONES de GNOME
# OSK keyboard virtual GNOME:
# https://extensions.gnome.org/extension/5949/gjs-osk/

# reorder workspace
# https://extensions.gnome.org/extension/5090/space-bar/

# tray icon
# https://extensions.gnome.org/extension/615/appindicator-support/ 



gext install 5949 5090 615 1460
gext enable 5949 5090 615 1460


sudo apt install -y gimp ubuntu-restricted-extras

#Pentaho / Spoon
#sudo apt install -y openjdk-11-jdk
