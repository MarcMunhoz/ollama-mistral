#!/bin/sh

# Inicia o servidor Ollama em background
ollama serve &

# Espera o servidor ficar pronto tentando rodar 'ollama list'
echo "Aguardando o Ollama iniciar..."
until ollama list >/dev/null 2>&1; do
  echo "Ainda esperando o servidor Ollama..."
  sleep 1
done

# Garante que o modelo Mistral esteja instalado
if ! ollama list | grep -q mistral; then
  echo "Baixando modelo Mistral..."
  ollama pull mistral
else
  echo "Modelo Mistral já está instalado."
fi

# Mantém o processo principal rodando em foreground
wait %1
