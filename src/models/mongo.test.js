const mongo = require('./mongo');

test('connection works', async () => {
    const data = await mongo();
    expect(data.length).toBe(3);
});