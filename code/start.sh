#!/bin/bash
set -e
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
docker-compose down
docker-compose up --build -d
./wait-for-it.sh ${MONGO_URL}:${MONGO_PORT} --strict --timeout=10 -- echo "Mongo is up"
docker exec graphdb bash -c "neo4j-admin set-initial-password fitstic"
./wait-for-it.sh 127.0.0.1:7474 --strict --timeout=10 -- echo "Neo4J 7474 is up"
./wait-for-it.sh 127.0.0.1:7687 --strict --timeout=10 -- echo "Neo4j 7687 is up"
sleep 10
docker exec graphdb bash -c "cypher-shell -u neo4j -p fitstic -f /datasets/movies.cypher"
npm run test