require('dotenv').config()
const mysql = require('mysql');

const client = mysql.createConnection({
    host: process.env.MYSQL_URL,
    user: process.env.MYSQL_SER,
    password: process.env.MYSQL_PWD,
    database: 'foodmart'
});

async function mysql01() {
    return query("select count(*) from customer");
}

async function query(s) {
    return client.query(s);
}

async function connect() {
}

async function disconnect() {
    await client.end();
}

module.exports = {};
module.exports.disconnect = disconnect;
module.exports.connect = connect;
module.exports.mysql01 = mysql01;