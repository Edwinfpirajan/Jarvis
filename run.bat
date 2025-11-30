@echo off
REM Script para ejecutar Jarvis con variables de entorno cargadas (CMD)

setlocal enabledelayedexpansion

echo ═══════════════════════════════════════════════════════════════
echo                     JARVIS - INICIANDO
echo ═══════════════════════════════════════════════════════════════
echo.

REM Cargar variables desde .env
if exist .env (
    for /f "usebackq delims==" %%A in (.env) do (
        set %%A
    )
    echo ✓ Variables de entorno cargadas
) else (
    echo ✗ Archivo .env no encontrado
    exit /b 1
)

echo ✓ Ejecutando Jarvis...
echo.

REM Usar el ejecutable compilado con soporte de audio
if exist jarvis.exe (
    jarvis.exe
) else if exist jarvis (
    jarvis
) else (
    echo ✗ Ejecutable no encontrado. Compilando...
    go run .\cmd\jarvis\main.go
)

pause
