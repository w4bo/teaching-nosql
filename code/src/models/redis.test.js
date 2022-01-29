const redis = require('./redis');
let db

beforeAll(async () => {
    await redis.connect()
    db = redis.db
});

async function redis01() {
    await db.set('key', 'value')
    return await db.get('key')
}

test('redis01', async () => {
    const data = await redis01();
    expect(data).toBe("value")
});

afterAll(async () => {
    await redis.disconnect()
});