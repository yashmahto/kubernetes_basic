import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.json({
         message: 'Hello, World!', 
        service: 'hello Node',
        pod: process.env.POD_NAME || 'unknown',
        time: new Date().toISOString(),
        });
});

app.get('/fcuk', (req, res) => {
    res.status(200).send('you too!!!');
});

app.get('/health', (req, res) => {
    res.status(200).send('OK');
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
