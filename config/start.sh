#! /bin/bash

service mysql start
service nginx start

exec "$@"