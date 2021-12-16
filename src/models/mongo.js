require('dotenv').config()
const {MongoClient} = require('mongodb');

const MONGO_USER = process.env.MONGO_USER
const MONGO_PWD = process.env.MONGO_PWD
const MONGO_URL = process.env.MONGO_URL
const URI = "mongodb://" + MONGO_URL + ":27017/"

const client = new MongoClient(URI);

async function connect() {
    try {
        // Connect to the MongoDB cluster
        await client.connect();
    } catch (e) {
        console.error(e);
    }
}

async function listDatabases() {
    const result = await client.db().admin().listDatabases()
    return result.databases;
}

async function getRestaurants() {
    const cursor = client.db("exercises").collection("restaurants").find({}, {});
    return await cursor.toArray();
}


module.exports = {};
module.exports.connect = connect;
module.exports.listDatabases = listDatabases;
module.exports.getRestaurants = getRestaurants;