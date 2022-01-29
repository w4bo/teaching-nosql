const mysql = require('./mysql');

beforeAll(async () => {
    await mysql.connect();
});

async function mysql01() {
    return await mysql.query("select * from customer");
}

test('mysql01', async () => {
    const data = await mysql01();
    expect(data.length).toBeGreaterThan(0);
});

afterAll(async () => {
    await mysql.disconnect();
});