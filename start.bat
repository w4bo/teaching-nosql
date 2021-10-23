docker build . -t nosql/nodejs
docker run -p 8080:8080 -d nosql/nodejs
REM docker exec -it nosql/nodejs /bin/bash
REM docker ps -aqf "name=nosql/nodejs"