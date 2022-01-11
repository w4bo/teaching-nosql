docker-compose down
docker-compose up --build -d
sleep 20
docker exec neo4j bash -c "cypher-shell -u neo4j -p fitstic -f /datasets/movies.cypher"
npm test -- --detectOpenHandles
