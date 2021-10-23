FROM node:17
# Create app directory
WORKDIR /usr/src/app
# Bundle app source
COPY package.json .
RUN npm install
COPY src ./src
RUN npm run test
# If you are building your code for production
# RUN npm ci --only=production
EXPOSE 8080
CMD [ "node", "src/server.js" ]