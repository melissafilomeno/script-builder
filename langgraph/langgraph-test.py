from langchain_community.chat_models.llamacpp import ChatLlamaCpp
from langgraph.prebuilt import create_react_agent

def get_weather(city: str) -> str:  
    """Get weather for a given city."""
    return f"It's always sunny in {city}!"

model = ChatLlamaCpp(
    model_path="/<your_user>/.cache/llama.cpp/microsoft_Phi-3-mini-4k-instruct-gguf_Phi-3-mini-4k-instruct-q4.gguf"
)

graph = create_react_agent(
    model=model,  
    tools=[get_weather],  
    prompt="You are a helpful assistant",
)

# Run the agent
inputs = {"messages": [{"role": "user", "content": "what is the weather in sf"}]}
for chunk in graph.stream(inputs, stream_mode="updates"):
    print(chunk)