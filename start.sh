#!/bin/bash
set -e
docker build . -t nosql/nodejs
docker run -p 8080:8080 -d nosql/nodejs