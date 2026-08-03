# 8. Navegadores, VS Code y LM Studio
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