# script-builder


### Install llama.cpp
run ./scripts/llama.cpp_install.sh

### Run llama-cli
- cd <path_to_llama>
- run ./build/bin/llama-cli --hf-repo microsoft/Phi-3-mini-4k-instruct-gguf --hf-file Phi-3-mini-4k-instruct-q4.gguf --prompt "Once upon a time"

Note: model is downloaded to /<your_user>/.cache/llama.cpp/microsoft_Phi-3-mini-4k-instruct-gguf_Phi-3-mini-4k-instruct-q4.gguf. This value is used as the model_path value in /langchain/* and /langgraph/* scripts.

### Run llama-server
- cd <path_to_llama>
- run ./build/bin/llama-server --hf-repo microsoft/Phi-3-mini-4k-instruct-gguf --hf-file Phi-3-mini-4k-instruct-q4.gguf -c 4096

### Test llama-server via curl
curl --request POST \
    --url http://localhost:8080/completion \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'

### Install chat-ui
run ./scripts/chat-ui_install.sh

### Run mongodb
docker run -d -p 27017:27017 --name mongo-chatui mongo:latest

### Run chat-ui
cd <path_to_chat-ui>
npm run dev

### Open chat-ui
Open browser to http://<your_IP>:5173 or as admin http://<your_IP>:5173?token=<admin_token_from_logs>

### Install llama-cpp-python
run ./scripts/llama-cpp-python_install.sh

### Run llama-cpp-python
run /usr/local/bin/python3 ./llama-cpp-python/llama-cpp-python-test.py

### Run langchain
- Replace model_path to path to model in line #14
- run /usr/local/bin/python3 ./langchain/langchain-test.py

### Install langgraph
run ./scripts/langgraph_install.sh

### Run langgraph
- Replace model_path to path to model in line #9
- run /usr/local/bin/python3 ./langchain/langgraph-test.py