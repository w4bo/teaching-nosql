const mongo = require('./mongo');

beforeAll(async () => {
    await mongo.connect();
});

test('connection works', async () => {
    const data = await mongo.listDatabases();
    expect(data.length).toBe(4);
});

test('restaurants', async () => {
    const data = await mongo.getRestaurants();
    expect(data.length).toBe(25359);
});