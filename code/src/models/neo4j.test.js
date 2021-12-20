const neo4j = require('./neo4j');

beforeAll(async () => {
    await neo4j.connect();
});

test('movie01', async () => {
    const data = await neo4j.movie01();
    expect(data.records.length).toBeGreaterThan(0); //
});

test('movie05', async () => {
    const data = await neo4j.movie05();
    expect(data.records.length).toBeGreaterThan(0); // .toBe(134);
});

afterAll(async () => {
    await neo4j.disconnect();
});