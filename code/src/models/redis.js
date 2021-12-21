require('dotenv').config()
import {createClient} from 'redis';

const client = createClient({
    url: 'redis://' + process.env.REDIS_URL + ":" + process.env.REDIS_PORT
});

async function redis01() {
    await client.set('key', 'value');
    return await client.get('key')
}

async function connect() {
    await client.connect()
}

async function disconnect() {
    await client.shutdown()
}

module.exports = {};
module.exports.disconnect = disconnect;
module.exports.connect = connect;
module.exports.redis01 = redis01;