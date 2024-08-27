from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

message = "Hello World"

class Message(BaseModel):
    text: str

@app.get('/')
def read_root():
    return{'message': message}

@app.put('/update')
def update_message(new_message: Message):
    global message
    message = new_message.text
    return {"message": "Message updated successfully"}



