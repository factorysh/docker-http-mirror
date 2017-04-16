HAproxy demo for Http-Mirror
============================

Up the brol
-----------

    docker-compose up -d

If you change the haproxy.cfg, reload the conf :

    docker kill -s HUP haproxy_haproxy_1

Test som urls :

    curl 127.0.0.1:8000
    curl 127.0.0.1:8000/bob

