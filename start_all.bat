@echo off
REM Script para iniciar Ollama y Jarvis en paralelo

setlocal enabledelayedexpansion

echo ═══════════════════════════════════════════════════════════════
echo         JARVIS - INICIANDO OLLAMA Y APLICACIÓN
echo ═══════════════════════════════════════════════════════════════
echo.

REM Cargar variables desde .env
if exist .env (
    for /f "usebackq delims==" %%A in (.env) do (
        set %%A
    )
    echo ✓ Variables de entorno cargadas
)

echo.
echo Iniciando Ollama en nueva ventana...
start "Ollama" cmd /k "ollama serve"

REM Esperar a que Ollama inicie
echo Esperando a que Ollama se inicie (5 segundos)...
timeout /t 5 /nobreak

echo.
echo Iniciando Jarvis...
echo.

if exist jarvis.exe (
    jarvis.exe
) else if exist jarvis (
    jarvis
) else (
    echo ✗ Ejecutable no encontrado. Compilando...
    go run .\cmd\jarvis\main.go
)
