FROM node:17
# Create app directory
WORKDIR /usr/src/app
# Bundle app source
COPY . .
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
EXPOSE 8080
CMD [ "node", "server.js" ]