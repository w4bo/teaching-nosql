#!/bin/bash
set -e
set -xo

if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
docker-compose down
docker-compose up --build -d
./wait-for-it.sh ${MONGO_URL}:${MONGO_PORT} --strict --timeout=10 -- echo "MongoDB is up"
./wait-for-it.sh ${NEO4J_URL}:${NEO4J_PORT} --strict --timeout=10 -- echo "Neo4J is up"
./wait-for-it.sh ${CASSANDRA_URL}:${CASSANDRA_PORT} --strict --timeout=10 -- echo "Cassandra is up"
sleep 20
docker exec graphdb bash -c "cypher-shell -u ${NEO4J_USER} -p ${NEO4J_PWD} -f /datasets/movies.cypher"
npm test -- --detectOpenHandles
