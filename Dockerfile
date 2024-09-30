FROM python:3.11-slim-bookworm AS base

RUN apt-get update -y && apt-get install -y
RUN apt-get install curl original-awk grep sed coreutils findutils -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://ollama.com/install.sh | sh
COPY models.sh .
RUN chmod +x models.sh && ./models.sh
RUN cd usr/share && ls

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir virtualenv && python -m venv venv
RUN . venv/bin/activate && pip install -r requirements.txt

FROM python:3.11-slim-bookworm

COPY --from=base usr/local/bin/ollama usr/local/bin/ollama
COPY --from=base root/.ollama root/.ollama
COPY --from=base app/venv app/venv

ENV PATH="$PATH:usr/local/bin/ollama"

WORKDIR /app

COPY start.sh .
COPY main.py .

RUN chmod +x start.sh

EXPOSE 8000
CMD ["./start.sh"]
