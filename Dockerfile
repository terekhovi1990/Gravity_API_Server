# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь остальной код (включая папку models/ с моделью)
COPY . .

# TatNet передаёт порт через переменную окружения PORT
ENV PORT=8000
EXPOSE 8000

# Запускаем FastAPI-сервер
CMD ["sh", "-c", "uvicorn api:app --host 0.0.0.0 --port ${PORT}"]
