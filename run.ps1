# Script para ejecutar Jarvis con variables de entorno cargadas (PowerShell)

# Cargar variables de entorno desde .env
if (Test-Path .\.env) {
    Get-Content .\.env | ForEach-Object {
        if ($_ -match '^\s*([^=]+)=(.*)$') {
            $key = $matches[1].Trim()
            $value = $matches[2].Trim()
            [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
        }
    }
    Write-Host "✓ Variables de entorno cargadas" -ForegroundColor Green
} else {
    Write-Host "✗ Archivo .env no encontrado" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "                    JARVIS - INICIANDO" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "✓ Ejecutando Jarvis..." -ForegroundColor Green
Write-Host ""

# Usar el ejecutable compilado con soporte de audio
if (Test-Path .\jarvis.exe) {
    .\jarvis.exe
} elseif (Test-Path .\jarvis) {
    .\jarvis
} else {
    Write-Host "✗ Ejecutable no encontrado. Compilando..." -ForegroundColor Yellow
    go run .\cmd\jarvis\main.go
}
