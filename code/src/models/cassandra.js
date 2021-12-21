require('dotenv').config()
const cassandra = require('cassandra-driver');

const client = new cassandra.Client({
    contactPoints: [process.env.CASSANDRA_URL],
    authProvider: new cassandra.auth.PlainTextAuthProvider(process.env.CASSANDRA_USER, process.env.CASSANDRA_PWD)
});

function killrvideo01() {
    return query("select * from videos");
}

async function query(s) {
    return await client.execute(s);
}

module.exports = {};
module.exports.killrvideo01 = killrvideo01;