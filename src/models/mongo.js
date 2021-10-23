require('dotenv').config()
const {MongoClient} = require('mongodb');

const MONGO_USER = process.env.MONGO_USER
const MONGO_PWD = process.env.MONGO_PWD
const MONGO_URL = process.env.MONGO_URL
const URI = "mongodb://" + MONGO_USER + ":" + MONGO_PWD + "@" + MONGO_URL + ":27017/"

async function main() {
    const client = new MongoClient(URI);
    try {
        // Connect to the MongoDB cluster
        await client.connect();
        // Make the appropriate DB calls
        return await listDatabases(client);
    } catch (e) {
        console.error(e);
        return {}
    } finally {
        await client.close();
    }
}

async function listDatabases(client) {
    const databasesList = await client.db().admin().listDatabases();
    return databasesList.databases;
}

module.exports = main;

main().catch(console.error);