HAproxy demo for Http-Mirror
============================

Up the brol
-----------

    make server

If you change the haproxy.cfg, reload the conf :

    docker kill -s HUP haproxy_haproxy_1

The proxy is available outside Docker, but there is more fun inside.

[httpie](https://httpie.org/) is an opiniated and colorized curl like tool.
I use it for pedagocial purpose, but similar stuff can be done with curl.

Build httpie container :

    make build-httpie

Launch httpie in this context :

    make httpie

Test som urls :

    http front.example.com
