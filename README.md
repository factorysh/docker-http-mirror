Http mirror
===========

A simple http daemon for debugging http routing and proxying.

Http-mirror response's body is a JSON dump of the HTTP request.

Demo
----

In a first shell, launch the mirror :

    $ python mirror.py
     * Serving Flask app "mirror" (lazy loading)
     * Environment: production
       WARNING: Do not use the development server in a production environment.
       Use a production WSGI server instead.
     * Debug mode: off
     * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
    127.0.0.1 - - [14/Sep/2018 15:16:58] "GET /hello/world HTTP/1.1" 200 -

In another shell, browse it

    $ curl -s -H "X-Fruit: banana" http://0.0.0.0:5000/hello/world | jq .
    {
      "request": {
        "form": {},
        "headers": {
          "Accept": "*/*",
          "Host": "0.0.0.0:5000",
          "User-Agent": "curl/7.54.0",
          "X-Fruit": "banana"
        },
        "method": "GET",
        "path": "hello/world",
        "url": "http://0.0.0.0:5000/hello/world"
      },
      "server": {
        "hostname": "My-Computer.local",
        "remote": "127.0.0.1"
      }
    }

You can use your favorite browser too, wathever speak HTTP.

In this barebone example, you get what you give : just client headers and IP.

With the mirror behind a proxy, you can watch what the proxy add, remove or modify.

Docker
------

Build it :

    make build

Run it :

    make run

Licence
-------

3 terms BSD licence, ©Mathieu Lecarme
