#!/bin/bash

# Directorio del repositorio
REPO_DIR="/ruta/a/tu/repositorio"

SERVICE_NAME="nombre_del_servicio"

cd $REPO_DIR


git fetch origin Deployment
if [ $(git rev-parse HEAD) != $(git rev-parse origin/Deployment) ]; then
    echo "Actualizando el repositorio..."
    git checkout Deployment
    git pull origin Deployment

 
    echo "Reiniciando el servicio..."
    systemctl restart $SERVICE_NAME
else
    echo "No hay cambios en la rama Deployment."
fi
