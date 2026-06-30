FROM python:3 
RUN useradd -m appuser
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 
COPY . .
RUN chown appuser:appuser /app
USER appuser
EXPOSE 5090
CMD ["python","app.py"]
