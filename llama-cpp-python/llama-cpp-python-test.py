from llama_cpp import Llama

llm = Llama.from_pretrained(
	repo_id="microsoft/Phi-3-mini-4k-instruct-gguf",
	filename="Phi-3-mini-4k-instruct-q4.gguf"
)

output = llm(
	"Once upon a time,",
	max_tokens=512,
	echo=True
)
print(output)