const neo4j = require('./neo4j');

beforeAll(async () => {
    await neo4j.connect();
});

test('movie01', async () => {
    const data = await neo4j.movie01();
    expect(data.records.length).toBe(171);
});

afterAll(async () => {
    await neo4j.disconnect();
});