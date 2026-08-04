#!/bin/bash

echo "Configurando Ubuntu Dock en el centro..."

# 1. Centrar el Dock (Desactivar modo panel / extender a bordes)
gsettings set org.gnome.shell.extensions.dash-to-dock always-center-icons true



# 3. Tamaño de iconos a 40px
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40

# 4. Posición abajo y en todos los monitores
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true

# 5. Ocultar dispositivos montados, de red y papelera
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

echo "¡Dock centrado y configurado correctamente!"