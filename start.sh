#!/usr/bin/env bash

service nginx start
uwsgi --socket :8001 --chdir /var/www --module DjangoDemo.wsgi --daemonize /tmp/DjangoDemo.log