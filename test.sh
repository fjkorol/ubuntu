#!/bin/bash


#!/bin/bash
set -e




git config --global credential.helper store
git config --global core.editor "nano"
git config --global user.email "ferkorol@gmail.com"
git config --global user.name "Fernando Korol"




echo "Instalacion DOCKER"

sudo apt update -y
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Agregar el repositorio a las fuentes de Apt:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update -y

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo gpasswd -a $USER docker




#EXTENSIONES de GNOME
# OSK keyboard virtual GNOME:
# https://extensions.gnome.org/extension/5949/gjs-osk/

# reorder workspace
# https://extensions.gnome.org/extension/5090/space-bar/

# tray icon
# https://extensions.gnome.org/extension/615/appindicator-support/ 


pipx ensurepath
pipx install gnome-extensions-cli


#eliminar archivos macOS
#find ~/workspace \( -name '.DS_Store' -o -name '._*' -o -name '.Spotlight-V100' -o -name '.Trashes' -o -name '.fseventsd' -o -name '.AppleDouble' -o -name '.AppleDB' -o -name '.AppleDesktop' \) -exec rm -rf {} +


#Freelens
curl -L https://raw.githubusercontent.com/freelensapp/freelens/refs/heads/main/freelens/build/apt/freelens.asc | sudo tee /etc/apt/keyrings/freelens.asc
curl -L https://raw.githubusercontent.com/freelensapp/freelens/refs/heads/main/freelens/build/apt/freelens.sources | sudo tee /etc/apt/sources.list.d/freelens.sources
sudo apt update
sudo apt install freelens




#Revisar y actualizar periodicamente NODE
#https://nodejs.org/en/download

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 24
# Verify the Node.js version:
node -v # Should print "v24.19.0".
# Verify npm version:
npm -v # Should print "11.17.0".


#qwen code terminal
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen-standalone.sh | bash


#Para nvidia anda bien snap, en z13 se ve chico cursor en monitor pg42UQ
#sudo snap install zapzap

#Para AMD, tipo z13 o framework
flatpak install -y flathub com.rtosta.zapzap
flatpak override --user --filesystem=home com.rtosta.zapzap



#Syncthing INI
# Añadir la clave GPG oficial de Syncthing
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg

# Agregar el repositorio estable
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Actualizar e instalar
sudo apt update
sudo apt install syncthing -y

# Habilitar el servicio para tu usuario actual
systemctl --user enable syncthing.service
systemctl --user start syncthing.service

#syncthing web
#http://localhost:8384
#Syncthing FIN


echo "--> Instalando Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
