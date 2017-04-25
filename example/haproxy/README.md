HAproxy demo for Http-Mirror
============================

Up the brol
-----------

    make server

If you change the haproxy.cfg, reload the conf :

    docker kill -s HUP haproxy_haproxy_1

The proxy is available outside Docker, but there is more fun inside.


Build clurl container :

    make build-curl-image

Launch curl in this context :

    make curl

Test som urls :

    curl -vL alice.example.com
