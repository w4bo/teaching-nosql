const mongo = require('./mongo');

beforeAll(async () => {
    await mongo.connect();
});

test('restaurants01', async () => {
    const data = await mongo.getResult(mongo.restaurants01());
    expect(data.length).toBe(25359);
});

test('restaurants02', async () => {
    const data = await mongo.getResult(mongo.restaurants02());
    expect(data.length).toBe(25359);
});

test('restaurants03', async () => {
    const data = await mongo.getResult(mongo.restaurants03());
    expect(data.length).toBe(25359);
});

test('restaurants04', async () => {
    const data = await mongo.getResult(mongo.restaurants04());
    expect(data.length).toBe(25359);
});

test('restaurants05', async () => {
    const data = await mongo.getResult(mongo.restaurants05());
    expect(data.length).toBe(112);
});

test('restaurants06', async () => {
    const data = await mongo.getResult(mongo.restaurants06());
    expect(data.length).toBe(433);
});

test('restaurants07', async () => {
    let data = await mongo.getResult(mongo.restaurants07());
    expect(data.length).toBe(24926);
    data = await mongo.getResult(mongo.restaurants07bis());
    expect(data.length).toBe(24926);
});

test('restaurants08', async () => {
    let data = await mongo.getResult(mongo.restaurants08());
    expect(data.length).toBe(1314);
    data = await mongo.getResult(mongo.restaurants08bis());
    expect(data.length).toBe(1314);
});

test('restaurants09', async () => {
    let data = await mongo.getResult(mongo.restaurants09());
    expect(data.length).toBe(24045);
    data = await mongo.getResult(mongo.restaurants09bis());
    expect(data.length).toBe(24045);
});

test('restaurants10', async () => {
    const data = await mongo.getResult(mongo.restaurants10());
    console.log(data)
    expect(data.length).toBe(1);
});

afterAll(async () => {
    await mongo.disconnect();
});