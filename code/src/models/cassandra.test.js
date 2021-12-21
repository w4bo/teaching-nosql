const cassandra = require('./cassandra');

beforeAll(async () => {
    await cassandra.connect();
});

test('killrvideo01', async () => {
    const data = await cassandra.killrvideo01();
    expect(data.rowLength).toBeGreaterThan(0); //
});

afterAll(async () => {
    await cassandra.disconnect();
});