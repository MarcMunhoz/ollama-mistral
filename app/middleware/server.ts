import express from 'express';
import cors from 'cors';

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.get('/api/ping', (req, res) => {
  res.json({ message: 'pong from backend' });
});

app.listen(port, () => {
  console.log(`✅ Backend Express rodando na porta ${port}`);
});
