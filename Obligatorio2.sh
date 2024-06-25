#!/bin/bash

# Evaluación de cambios en el repositorio
if git diff-index --quiet HEAD --; then
    Alerta="No se realizaron commits."
    echo "$Alerta"
else
    Lineas_Modificadas=$(git diff --stat | tail -n1)
    git add .
    Commit_MSG="Commit automático semanal: $Lineas_Modificadas"
    git commit -m "$Commit_MSG"
    git push origin main    
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Cambios en la Semana: $Lineas_Modificadas" >> README.md
    echo "Se han realizado los siguientes cambios: $Lineas_Modificadas"
fi