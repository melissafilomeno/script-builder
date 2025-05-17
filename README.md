# script-builder


### Install llama.cpp
run ./scripts/llama.cpp_install.sh

### Run llama-cli
cd <path_to_llama>
./build/bin/llama-cli --hf-repo microsoft/Phi-3-mini-4k-instruct-gguf --hf-file Phi-3-mini-4k-instruct-q4.gguf --prompt "Once upon a time"

### Run llama-server
cd <path_to_llama>
./build/bin/llama-server --hf-repo microsoft/Phi-3-mini-4k-instruct-gguf --hf-file Phi-3-mini-4k-instruct-q4.gguf -c 4096

### Test llama-server via curl
curl --request POST \
    --url http://localhost:8080/completion \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'

see sample [output](/output%20samples/curl_output.json)

### Install chat-ui
run ./scripts/chat-ui_install.sh

### Run mongodb
docker run -d -p 27017:27017 --name mongo-chatui mongo:latest

### Run chat-ui
cd <path_to_chat-ui>
npm run dev

### Open chat-ui
Open browser to http://<your_IP>:5173 or as admin http://<your_IP>:5173?token=<admin_token_from_logs>
