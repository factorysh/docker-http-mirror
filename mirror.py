import platform
from flask import Flask, json, request

app = Flask(__name__)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return json.jsonify(dict(request=dict(path=path,
                                          headers=dict(request.headers),
                                          method=request.method,
                                          form=request.form,
                                          url=request.url),
                             sever=dict(hostname=platform.node())))

if __name__ == '__main__':
    app.run()
