#!/bin/bash

# Ruta del archivo de configuración de SSH
SSH_CONFIG="$HOME/.ssh/config"

# Verificar si el archivo de configuración SSH existe
if [ -f "$SSH_CONFIG" ]; then
    echo "El archivo de configuración SSH existe. Mostrando su contenido:"
    echo "--------------------------------------------"
    cat "$SSH_CONFIG"
    echo "--------------------------------------------"
else
    echo "El archivo de configuración SSH no existe."
    exit 1
fi

# Preguntar si se desea editar el archivo
read -p "¿Deseas editar el archivo de configuración SSH? (sí/no): " respuesta

# Convertir la respuesta a minúsculas para evitar errores
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [[ "$respuesta" == "sí" || "$respuesta" == "si" ]]; then
    echo "Abriendo el archivo con nano..."
    nano "$SSH_CONFIG"
elif [[ "$respuesta" == "no" ]]; then
    echo "No se hará ningún cambio. Saliendo..."
    exit 0
else
    echo "Respuesta no válida. Por favor responde 'sí' o 'no'."
    exit 1
fi

