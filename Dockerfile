FROM node:17
# Create app directory
WORKDIR /usr/src/app
# Bundle app source
COPY package.json .
RUN npm install
COPY src ./src
COPY wait-for-it.sh .
# RUN npm run test
CMD ["./wait-for-it.sh" , "mongo:27017" , "--strict" , "--timeout=10" , "--" , " npm run test"]
# If you are building your code for production
# RUN npm ci --only=production
# EXPOSE 8080
# CMD [ "node", "src/server.js" ]