#!/bin/bash

cd ~/HolocronHub || { echo "Error: No pude entrar a ~/HolocronHub"; exit 1; }
BRANCH="main"

# Cambiar a la rama principal
git checkout "$BRANCH"

# Traer cambios del remoto (fetch)
echo "🌐 Fetching latest changes..."
git fetch origin

# Hacer merge automático
echo "🔀 Haciendo merge con la rama remota..."
git merge origin/$BRANCH

# Añadir y commitear cambios locales si hay
if [[ -n $(git status --porcelain) ]]; then
    echo "📄 Cambios locales detectados, haciendo commit..."
    git add .
    git commit -m "Auto-sync local changes: $(date '+%Y-%m-%d %H:%M:%S')"
else
    echo "✅ No hay cambios locales para commitear."
fi

# Hacer push
echo "📤 Haciendo push al remoto..."
git push

echo "🚀 Sincronización completa."

