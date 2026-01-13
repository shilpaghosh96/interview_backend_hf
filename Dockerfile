FROM python:3.10-slim

WORKDIR /app

# System dependencies (optional for AssemblyAI-only, but safe)
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY backend/requirements.txt /app/backend/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/backend/requirements.txt

# Copy backend code
COPY backend /app/backend

EXPOSE 7860

CMD ["uvicorn", "backend.app.main_assembly_ai:app", "--host", "0.0.0.0", "--port", "7860"]
