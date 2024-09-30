#!/bin/bash

# Start the Ollama server.
ollama serve &

# Start the FastAPI server.
. venv/bin/activate && fastapi run --port 8000
