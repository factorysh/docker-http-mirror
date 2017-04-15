from flask import Flask, json, request

app = Flask(__name__)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return json.jsonify(dict(path=path,
                             headers=dict(request.headers),
                             method=request.method))

if __name__ == '__main__':
    app.run()
