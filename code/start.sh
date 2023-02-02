#!/bin/bash
git pull
set -xo

./build.sh
./download.sh

if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

#linux: 
# - sudo usermod -a -G docker $(whoami)
# - logout and login

# clean all the docker containers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker system prune -f
docker volume rm $(docker volume ls -qf dangling=true)

set -e
docker-compose down
docker-compose up --build -d --remove-orphans $*
./wait-for-it.sh ${MONGO_URL}:${MONGO_PORT} --strict --timeout=10 -- echo "MongoDB is up"
./wait-for-it.sh ${NEO4J_URL}:${NEO4J_PORT} --strict --timeout=10 -- echo "Neo4J is up"
./wait-for-it.sh ${CASSANDRA_URL}:${CASSANDRA_PORT} --strict --timeout=10 -- echo "Cassandra is up"
./wait-for-it.sh ${REDIS_URL}:${REDIS_PORT} --strict --timeout=10 -- echo "Redis is up"
./wait-for-it.sh ${MYSQL_URL}:${MYSQL_PORT} --strict --timeout=10 -- echo "MySQL is up"
sleep 20
docker exec neo4j bash -c "cypher-shell -u ${NEO4J_USER} -p ${NEO4J_PWD} -f /datasets/movies.cypher"
npm test -- --detectOpenHandles
