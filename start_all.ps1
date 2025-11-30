# Script para iniciar Ollama y Jarvis en paralelo

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "        JARVIS - INICIANDO OLLAMA Y APLICACIÓN" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

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
}

Write-Host ""

# Iniciar Ollama en una nueva ventana
Write-Host "Iniciando Ollama en nueva ventana..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "ollama serve" -WindowStyle Normal

# Esperar a que Ollama inicie
Write-Host "Esperando a que Ollama se inicie (5 segundos)..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Iniciar Jarvis
Write-Host ""
Write-Host "Iniciando Jarvis..." -ForegroundColor Green
Write-Host ""

if (Test-Path .\jarvis.exe) {
    .\jarvis.exe
} elseif (Test-Path .\jarvis) {
    .\jarvis
} else {
    Write-Host "✗ Ejecutable no encontrado. Compilando..." -ForegroundColor Yellow
    go run .\cmd\jarvis\main.go
}
