from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, World!"

@app.route("/1")
def salvador():
    return "Hello, 1"
