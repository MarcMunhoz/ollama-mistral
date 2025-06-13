import express from "express";
import cors from "cors";
import axios from "axios";

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.post("/api/mistral/comment", async (req, res) => {
  try {
    const { text } = req.body;

    const prompt = `Gere um comentário objetivo sobre o seguinte texto:\n\n${text}\n\nComentário:`;

    const response = await axios.post("http://ollama:11434/api/generate", {
      model: "mistral",
      prompt: prompt,
      stream: false,
    });

    const result = response.data.response.trim();

    res.json({
      comment: result,
    });
  } catch (err) {
    console.error("❌ Erro no backend:", err);
    res.status(500).json({ error: "Erro no servidor" });
  }
});

app.listen(port, () => {
  console.log(`✅ Backend Express rodando na porta ${port}`);
});
