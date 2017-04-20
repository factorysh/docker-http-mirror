HAproxy demo for Http-Mirror
============================

Up the brol
-----------

    make server

If you change the haproxy.cfg, reload the conf :

    docker kill -s HUP haproxy_haproxy_1

Build httpie container :

    make build-httpie

Launch httpie in this context :

    make httpie

Test som urls :

    http front.example.com
