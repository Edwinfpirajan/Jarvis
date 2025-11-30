#!/bin/bash
# Script para ejecutar Jarvis con variables de entorno cargadas

set -a
source .env
set +a

echo "═══════════════════════════════════════════════════════════════"
echo "                    JARVIS - INICIANDO"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "✓ Variables de entorno cargadas"
echo "✓ Ejecutando Jarvis..."
echo ""

# Usar el ejecutable compilado con soporte de audio
if [ -f ./jarvis.exe ]; then
    ./jarvis.exe
elif [ -f ./jarvis ]; then
    ./jarvis
else
    echo "✗ Ejecutable no encontrado. Compilando..."
    /c/Program\ Files/Go/bin/go run ./cmd/jarvis/main.go
fi
