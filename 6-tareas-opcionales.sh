#!/bin/bash
set -e



#EXTENSIONES de GNOME
# OSK keyboard virtual GNOME:
# https://extensions.gnome.org/extension/5949/gjs-osk/

# reorder workspace
# https://extensions.gnome.org/extension/5090/space-bar/

# tray icon
# https://extensions.gnome.org/extension/615/appindicator-support/ 

#Vitals - extensión para ver el estado de la cpu, memoria, etc
#https://extensions.gnome.org/extension/1460/vitals/



gnome-extensions install 5949 5090 615 1460
gnome-extensions enable 5949 5090 615 1460



sudo apt install -y gimp ubuntu-restricted-extras


# sudo apt install -y \
#     links \
#     ansible \
#     imagemagick \
#     gettext \
#     php-cli \
#     gimp \

#Pentaho / Spoon
#sudo apt install -y openjdk-11-jdk
