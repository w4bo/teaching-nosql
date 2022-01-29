const cassandra = require('./cassandra');

beforeAll(async () => {
    await cassandra.connect();
});

test('killrvideo01', async () => {
    const data = await cassandra.query("select * from videos");
    expect(data.rowLength).toBeGreaterThan(0);
});

afterAll(async () => {
    await cassandra.disconnect();
});