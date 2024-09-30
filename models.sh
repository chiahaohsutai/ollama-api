#!/bin/bash

# Start the server.
ollama serve &
sleep 5

# Pull the models.
ollama pull phi3.5
ollama pull all-minilm