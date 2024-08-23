# Use uma imagem base oficial do Python, versão slim
FROM python:3.12.3-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo de requisitos para o diretório de trabalho
COPY requirement.txt .

# Instale as dependências do projeto
RUN pip install --no-cache-dir -r requirement.txt

# Copie o restante do código da aplicação para o dcoker ima
EXPOSE 8000

# Comando para iniciar o servidor Uvicorn
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
