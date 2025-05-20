from langchain_community.llms import LlamaCpp
from langchain_core.callbacks import CallbackManager, StreamingStdOutCallbackHandler
from langchain_core.prompts import PromptTemplate

template = """<|user|>\n{question} <|end|>\n<|assistant|>"""

prompt = PromptTemplate.from_template(template)

# Callbacks support token-wise streaming
callback_manager = CallbackManager([StreamingStdOutCallbackHandler()])

# Make sure the model path is correct for your system!
llm = LlamaCpp(
    model_path="/<your_user>/.cache/llama.cpp/microsoft_Phi-3-mini-4k-instruct-gguf_Phi-3-mini-4k-instruct-q4.gguf",
    temperature=0.75,
    max_tokens=2000,
    top_p=1,
    callback_manager=callback_manager,
    verbose=True,  # Verbose is required to pass to the callback manager
)

question = """
Question: A rap battle between Stephen Colbert and John Oliver
"""
llm.invoke(question)