#!/bin/bash
set -e
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
docker-compose up --build -d
./wait-for-it.sh ${MONGO_URL}:${MONGO_PORT} --strict --timeout=10 -- echo "Mongo is up"
npm run test
# docker build . -t nosql/nodejs
# docker run -p 8080:8080 -d nosql/nodejs