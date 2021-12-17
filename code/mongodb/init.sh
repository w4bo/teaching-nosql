#!/bin/bash
mongoimport --host=mongodb -d exercises -c foo --file=/data/foo.json --jsonArray
mongorestore --host=mongodb -d exercises -c restaurants /data/restaurants.bson
mongorestore --host=mongodb -d exercises -c games /data/games.bson
mongorestore --host=mongodb -d exercises -c yelp-business /data/yelp-business.bson