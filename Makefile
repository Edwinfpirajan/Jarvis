.PHONY: run dev build help

run:
	@bash run.sh

dev:
	@bash run.sh

build:
	@echo "Compilando Jarvis sin PortAudio (requiere GCC para habilitarlo)..."
	go build -o jarvis.exe .\cmd\jarvis\main.go

help:
	@echo "Comandos disponibles:"
	@echo "  make run   - Ejecutar Jarvis (carga .env automáticamente)"
	@echo "  make dev   - Lo mismo que 'make run'"
	@echo "  make build - Compilar Jarvis"
	@echo "  make help  - Mostrar esta ayuda"
