from typing import Literal
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import ollama

app = FastAPI(title="FastOllama")

app.add_middleware(
    CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"]
)


class Message(BaseModel):
    role: Literal["user", "assistant", "system", "tool"]
    content: str


class Prompt(BaseModel):
    prompt: str


class Texts(BaseModel):
    texts: list[str]


@app.get("/heath_check")
def health_check():
    return {"status": "ok"}


@app.get("/models")
def list_models():
    return {"models": [model for model in ollama.list()["models"]]}


@app.post("/chat/{model}")
def chat(model: str, messages: list[Message]):
    msgs = [ollama.Message(role=msg.role, content=msg.content) for msg in messages]
    return {"response": ollama.chat(model=model, messages=msgs)}


@app.post("/generate/{model}")
def generate(model: str, prompt: Prompt):
    return {"response": ollama.generate(model=model, prompt=prompt.prompt)}


@app.post("/embed/{model}")
def embed(model: str, texts: Texts):
    return {"response": ollama.embed(model=model, input=texts.texts)}
