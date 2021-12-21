const mysql = require('./mysql');

beforeAll(async () => {
    await mysql.connect();
});

test('mysql01', async () => {
    const data = await mysql.mysql01();
    expect(data).toBeGreaterThan(0);
});

afterAll(async () => {
    await mysql.disconnect();
});