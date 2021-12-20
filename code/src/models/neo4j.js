require('dotenv').config()
const neo4j = require('neo4j-driver')
const client = neo4j.driver(
    "neo4j://" + process.env.NEO4j_URL,
    neo4j.auth.basic(process.env.NEO4j_USER, process.env.NEO4j_PWD)
)
let session = null

async function connect() {
    try {
        session = client.session() // { database:'neo4j', defaultAccessMode: neo4j.session.READ }
    } catch (e) {
        console.error(e);
    }
}

async function disconnect() {
    await session.close()
    await client.close()
}

function movie01() {
    return cypher("MATCH (n) RETURN n")
}

async function cypher(cypherQuery) {
    return await session.run(cypherQuery);
}

module.exports = {};
module.exports.connect = connect;
module.exports.disconnect = disconnect;
module.exports.movie01 = movie01;