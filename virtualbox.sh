#!/bin/bash

# Salir inmediatamente si ocurre un error
set -e

echo "=== Actualizando índices de paquetes e instalando dependencias ==="
sudo apt update
sudo apt install -y curl wget gnupg2 lsb-release apt-transport-https build-essential dkms

echo "=== Agregando la clave GPG oficial de Oracle VirtualBox ==="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes -o /etc/apt/keyrings/oracle-virtualbox-2016.gpg

echo "=== Configurando el repositorio oficial de VirtualBox ==="
CODENAME=$(lsb_release -cs)
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null

echo "=== Actualizando repositorios e instalando VirtualBox ==="
sudo apt update
sudo apt install -y virtualbox-7.2

echo "=== Agregando el usuario actual al grupo vboxusers ==="
sudo usermod -aG vboxusers $USER

echo "=== Obteniendo versión exacta de VirtualBox ==="
VBOX_VERSION=$(vboxmanage --version | cut -dr -f1)
echo "Versión detectada: $VBOX_VERSION"

echo "=== Descargando e instalando el VirtualBox Extension Pack ==="
EXTPACK_NAME="Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack"
EXTPACK_URL="https://download.virtualbox.org/virtualbox/${VBOX_VERSION}/${EXTPACK_NAME}"

# Descargar el Extension Pack
wget -q --show-progress "$EXTPACK_URL" -O "/tmp/$EXTPACK_NAME"

# Aceptar automáticamente la licencia de Oracle al instalar
echo "y" | sudo vboxmanage extpack install --replace "/tmp/$EXTPACK_NAME"

# Limpiar archivo temporal
rm -f "/tmp/$EXTPACK_NAME"

echo "=========================================================="
echo " ¡Instalación completada con éxito!"
echo " VirtualBox y Extension Pack instalados correctamente."
echo ""
echo " NOTA: Cierra sesión y vuelve a iniciarla para que los"
echo " cambios del grupo 'vboxusers' (acceso a USB) surtan efecto."
echo "=========================================================="