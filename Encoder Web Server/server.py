#!/usr/bin/env python
# coding: utf-8
from flask import Flask, request, jsonify
import os
import json
#from flask_ngrok import run_with_ngrok

app = Flask(__name__)
#run_with_ngrok(app)  # Start ngrok when app is run

@app.route("/")
def hello():
    return "Hello World!"


@app.route("/add_session", methods=["POST"])
def add_session():
    data = request.json

    if not os.path.exists(data['appID']):
        os.makedirs(data['appID'])

    with open('{}/{}.json'.format(data['appID'], data['timestamp']), 'w') as json_file:
        json.dump(data, json_file, indent=4, sort_keys=True)

    return jsonify(data)


if __name__ == "__main__":
    import os

    os.environ['KMP_DUPLICATE_LIB_OK'] = 'True'
    app.run(debug=True,
            port=int(os.getenv('PORT', 4445)))




