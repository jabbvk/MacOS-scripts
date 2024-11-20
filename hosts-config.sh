#!/bin/bash

# Ruta del archivo de configuración de SSH
HOSTS_CONFIG="/etc/hosts"

# Verificar si el archivo de configuración SSH existe
if [ -f "$HOSTS_CONFIG" ]; then
    echo "El archivo de configuración HOSTS existe. Mostrando su contenido:"
    echo "--------------------------------------------"
    cat "$HOSTS_CONFIG"
    echo "--------------------------------------------"
else
    echo "El archivo de configuración HOSTS no existe."
    exit 1
fi

# Preguntar si se desea editar el archivo
echo "1. Editar"
echo "2. Comentar todo"
echo "3. Descomentar todo"
echo "4. Salir"
read -p "¿Que desea hacer?: " respuesta

# Convertir la respuesta a minúsculas para evitar errores
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [[ "$respuesta" == "1" ]]; then
    echo "Abriendo el archivo en nano..."
    sudo nano "$HOSTS_CONFIG"
elif [[ "$respuesta" == "2" ]]; then
    echo "Comentando lineas..."
    sudo sed -i '' 's/^/#/' "$HOSTS_CONFIG" 
elif [[ "$respuesta" == "3" ]]; then
    echo "Descomentando lineas..."
    sudo sed -i '' 's/^\#//' "$HOSTS_CONFIG"
elif [[ "$respuesta" == "4" ]]; then
    echo "No se hará ningún cambio. Saliendo..."
    exit 0
else
    echo "Respuesta no válida. Saliendo..."
    exit 1
fi

