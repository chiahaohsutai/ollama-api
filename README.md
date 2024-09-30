# Fast Ollama

REST API for open source LLM models enabled by `Ollama` and `FastAPI`.

## Local Installation:

Download Ollama from their official [site](https://ollama.com/). After installation is complete: 

- Start the Ollama server: `ollama serve`.
- Download the models you want the API to have access to: `ollama pull <model-name>`.

Install Python 3.11 from the Python official [site](https://www.python.org/downloads/) or your prefered installation method. After installation is complete:

- Clone the repository: `git clone <repository-url>`
- Create a new Python virtual enviorment: `python -m venv .venv`
- Activate the enviorment:

| Platform | Shell      | Command to activate virtual enviorment |
|----------|------------|----------------------------------------|
| POSIX    | bash/zsh   | $ source <venv>/bin/activate           |
| POSIX    | fish       | $ source <venv>/bin/activate.fish      |
| POSIX    | csh/tcsh   | $ source <venv>/bin/activate.csh       |
| POSIX    | PowerShell | $ <venv>/bin/Activate.ps1              |

- Install the Python dependecies: `pip install -r requirements.txt`
- Run the API in `dev` mode: `fastapi dev`

## Running as a container:

Download Docker from their official [site](https://docs.docker.com/get-started/get-docker/). After installation is complete:

- Start the Docker engine. You can start the engine by opening the Docker desktop application.
- Change directory to the project root: `cd <path-to-project-root>`.
- Build the image: `docker build -t fast-ollama .`.
- Run the the image as a container: `docker run fast-ollama`

### Can I add more models?

Absolutely! Just add the desired model to the `models.sh` script by adding more `ollama pull <model-name>` to the end of the script file. The `model.sh` is executed during container build so all your models should become available automatically. One limitation is that the model must be available in Ollama. For all avaailable models visit their [site](https://ollama.com/).

## API Details

For details about the API:
- Run the FastAPI and Ollama server.
- Visit `http://localhost:8000/docs` to see the API schema and see all the available endpoints.
    - The default port number is 8000, if the application is listenning to a different port, change the endpoint accordingly.
- The `/docs` endpoint is a `Swagger` application that lets you see and test all the endpoints.
