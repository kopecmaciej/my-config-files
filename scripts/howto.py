#!/usr/bin/env python
import sys
import os
from openai import OpenAI

dir_path = os.path.dirname(os.path.realpath(__file__))

api_key_file = os.path.join(dir_path, "api_key.txt")
with open(api_key_file, "r") as file:
    key = file.read().strip()

client = OpenAI(api_key=key)

arg = " ".join(sys.argv[1:])

r = client.chat.completions.create(
    model="gpt-3.5-turbo",
    temperature=0,
    messages=[
        {
            "role": "system",
            "content": "You are Linux expert, you mostly works on arch linux distributions. Answer as concisely as possible.",
        },
        {
            "role": "user",
            "content": f"Answer with only the actual command without any intro or explanation. What is the arch linux command line command to {arg}",
        },
    ],
)

response = r.choices[0].message.content

if response is None or response == "":
    response = "Sorry, I don't know that one."
else:
    if response.startswith("`") and response.endswith("`"):
        response = response[1:-1]

print(response)
