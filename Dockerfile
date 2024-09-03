# Usar uma imagem base mais recente e com suporte
FROM python:3.12.3-slim-bullseye AS builder

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de requisitos
COPY requirement.txt .

# Atualizar pip e instalar os pacotes necessários
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirement.txt

# Usar uma imagem base mais enxuta para a produção
FROM python:3.12.3-slim-bullseye

# Definir o diretório de trabalho
WORKDIR /app

# Copiar os pacotes instalados do estágio anterior
COPY --from=builder /usr/local /usr/local

# Copiar o código da aplicação
COPY . .

# Expor a porta 8000
EXPOSE 8000

# Definir o comando para iniciar a aplicação
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
