const redis = require('./redis');

beforeAll(async () => {
    await redis.connect();
});

test('redis01', async () => {
    const data = await redis.redis01();
    expect(data).toBe("value");
});

afterAll(async () => {
    await redis.disconnect();
});