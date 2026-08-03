# Add Docker's official GPG key:
# Definir modo no interactivo para apt
export DEBIAN_FRONTEND=noninteractive

#gnome:
sudo apt-get install -y git ssh  postgresql-client meld zsh vlc git-flow p7zip-full gnome-shell-extensions chrome-gnome-shell geany mc gimp curl unzip htop deluge powertop nmap make gcc fonts-powerline gnome-tweaks ubuntu-restricted-extras rar unrar powerstat build-essential cpu-x gnome-system-monitor stress libfuse2 fzf fontconfig flatpak direnv pkg-config


# 1. Navegadores, VS Code y LM Studio
echo "--> Instalando Google Chrome, Opera, Visual Studio Code y LM Studio..."


# -----------------------------------------------------------------------------
# Google Chrome
# -----------------------------------------------------------------------------
if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub \
        | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ stable main" \
        | sudo tee /etc/apt/sources.list.d/google-chrome.list >/dev/null
fi

# -----------------------------------------------------------------------------
# Visual Studio Code
# -----------------------------------------------------------------------------
if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
        | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
        | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
fi

# -----------------------------------------------------------------------------
# Opera
# -----------------------------------------------------------------------------
if [ ! -f /etc/apt/sources.list.d/opera-stable.list ]; then
    curl -fsSL https://deb.opera.com/archive.key \
        | sudo gpg --dearmor -o /usr/share/keyrings/opera.gpg

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/opera.gpg] https://deb.opera.com/opera-stable/ stable non-free" \
        | sudo tee /etc/apt/sources.list.d/opera-stable.list >/dev/null
fi

# -----------------------------------------------------------------------------
# Actualizar repositorios
# -----------------------------------------------------------------------------
sudo apt update

# -----------------------------------------------------------------------------
# Instalar paquetes
# -----------------------------------------------------------------------------
sudo apt install -y \
    google-chrome-stable \
    code \
    opera-stable




#Pentaho / Spoon
sudo apt install -y openjdk-11-jdk


echo "paquetes flatpak"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
com.getpostman.Postman \
org.pgadmin.pgadmin4 \
info.febvre.Komikku \
com.vivaldi.Vivaldi \
net.waterfox.waterfox \
com.rtosta.zapzap \
org.telegram.desktop \
com.obsproject.Studio \
org.zotero.Zotero



# -----------------------------------------------------------------------------
# LM Studio (última versión .deb)
# -----------------------------------------------------------------------------
echo "--> Instalando LM Studio..."

if ! dpkg -s lmstudio >/dev/null 2>&1; then
    TMP_DEB=$(mktemp --suffix=.deb)

    curl -fL \
        "https://lmstudio.ai/download/latest/linux/x64?format=deb" \
        -o "$TMP_DEB"

    sudo apt install -y "$TMP_DEB"

    rm -f "$TMP_DEB"
fi


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


echo "Permisos a .kube y .ssh"


chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

chmod 700 ~/.kube
chmod 600 ~/.kube/*

#eliminar archivos macOS
#find ~/workspace \( -name '.DS_Store' -o -name '._*' -o -name '.Spotlight-V100' -o -name '.Trashes' -o -name '.fseventsd' -o -name '.AppleDouble' -o -name '.AppleDB' -o -name '.AppleDesktop' \) -exec rm -rf {} +
