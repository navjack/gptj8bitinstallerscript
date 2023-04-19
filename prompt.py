import torch
import transformers
from transformers.models.gptj import GPTJForCausalLM

device = "cuda" if torch.cuda.is_available() else "cpu"
tokenizer = transformers.AutoTokenizer.from_pretrained("EleutherAI/gpt-j-6b")
gpt = GPTJForCausalLM.from_pretrained(
    "hivemind/gpt-j-6B-8bit", low_cpu_mem_usage=True
).to(device)
raw_text = open("delandzombie.txt", "r").read()
text = raw_text
prompt = tokenizer((raw_text), return_tensors="pt")
prompt = {key: value.to(device) for key, value in prompt.items()}
out = gpt.generate(
    **prompt,
    do_sample=True,
    temperature=1.03,
    top_k=500,
    top_p=0.98,
    max_new_tokens=200,
)
out = tokenizer.decode(out[0])
text = out
print(
    "\n",
    "\n",
    str(text),
    "\n",
    "\n",
    end="",
)
raw_text += text
output = open("out.txt", "a")
output.write(
    str(text)
    + "\n"
    + "\n"
    + "------"
    + "\n"
    + "\n"
)
output.close()