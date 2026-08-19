#!/bin/bash

# Script para instalar Steam en Ubuntu

set -e

echo "=== Iniciando instalación de Steam ==="

# 1. Habilitar la arquitectura de 32 bits (necesaria para Steam y dependencias)
echo "--> Habilitando arquitectura i386 (32-bit)..."
sudo dpkg --add-architecture i386

# 2. Habilitar repositorio multiverse (por si acaso no está activo)
echo "--> Asegurando repositorio multiverse..."
sudo add-apt-repository multiverse -y

# 3. Actualizar la lista de paquetes
echo "--> Actualizando repositorios..."
sudo apt update

# 4. Instalar Steam y librerías de 32 bits necesarias
echo "--> Instalando Steam y dependencias..."
sudo apt install -y steam mesa-vulkan-drivers mesa-vulkan-drivers:i386

echo ""
echo "=================================================="
echo "  ¡Instalación completada con éxito!"
echo "  Puedes ejecutar Steam buscando 'Steam' en el menú"
echo "  o escribiendo 'steam' en la terminal."
echo "=================================================="
