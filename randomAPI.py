import flask
from flask import request, jsonify, render_template
import os
import random
from pathlib import Path

app = flask.Flask(__name__)


def getImage():
    image_name = here = Path(__file__).parent
    mylist = os.listdir(here / "static/img")

    returnvalue = random.randint(0, mylist.__len__() - 1)
    image_name = mylist[returnvalue]
    return image_name


@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')


@app.route("/api")
def argh():
    image_name = getImage()
    return render_template('random.html', image_url=image_name)


@app.route("/api/JSON")
def jsonstuff():
    image_name = getImage()
    base_url = request.base_url
    image_url = base_url[0:base_url.__len__() - 9] + "/static/img/" + image_name
    image = {
        "url": image_url
    }
    return jsonify(image)


app.run()
