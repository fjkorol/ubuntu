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





# Asegurar que el binario de pip esté en el PATH
export PATH="$HOME/.local/bin:$PATH"

# 1. Instalar gnome-extensions-cli si no existe
if ! command -v gext &> /dev/null; then
    echo "Instalando gnome-extensions-cli..."
    pip install --user --break-system-packages gnome-extensions-cli
fi

# 2. Lista de IDs de las extensiones requeridas:
# 5949 -> GJS OSK
# 5090 -> Space Bar
# 615  -> AppIndicator and KStatusNotifierItem Support
# 1460 -> Vitals
# 3733 -> Tiling Assistant
# 307  -> Dash to Dock

EXTENSIONES=(3733 5949 5090 615 1460)

# 3. Instalación e instalación automática de cada extensión
echo "Instalando extensiones de GNOME..."
for id in "${EXTENSIONES[@]}"; do
    echo "Procesando extensión ID: $id"
    gext install "$id"
done

for id in "${EXTENSIONES[@]}"; do
    echo "Procesando extensión ID: $id"
    gext enable "$id"
done

echo "¡Instalación completada con éxito!"


#gext install 5949 5090 615 1460

#gext enable 5949 5090 615 1460



sudo apt install -y gimp ubuntu-restricted-extras


sudo apt install -y \
    links \
    ansible \
    imagemagick \
    gettext \
    php-cli \
    gimp 
    
#Pentaho / Spoon
sudo apt install -y openjdk-11-jdk


echo "paquetes Buzz flatpak"
flatpak install -y io.github.chidiwilliams.Buzz 


