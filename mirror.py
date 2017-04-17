import platform
from flask import Flask, json, request

app = Flask(__name__)
ALL_METHODS = "GET POST PUT DELETE HEAD PATCH".split(' ')


@app.route('/', defaults={'path': ''}, methods=ALL_METHODS)
@app.route('/<path:path>', methods=ALL_METHODS)
def catch_all(path):
    return json.jsonify(dict(request=dict(path=path,
                                          headers=dict(request.headers),
                                          method=request.method,
                                          form=request.form,
                                          url=request.url),
                             sever=dict(hostname=platform.node())))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
