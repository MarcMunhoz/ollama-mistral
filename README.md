# 🧠 Ollama Mistral App (ollama-mistral)

Projeto fullstack com [Quasar (Vue 3)](https://quasar.dev) no frontend e [Ollama](https://ollama.com) no backend, utilizando o modelo Mistral localmente via container Docker. Ideal para aplicações com LLM totalmente offline.

---

## 📁 Estrutura do Projeto

```
.
├── .vscode/               # Configurações do editor
├── frontend/              # Aplicação Quasar (Vue 3)
├── secrets/               # Chaves privadas para Ollama (não versionadas)
├── Dockerfile             # Build da aplicação principal
├── Dockerfile.ollama      # Build opcional do Ollama (se necessário)
├── docker-compose.yaml    # Orquestração dos containers
├── entrypoint.sh          # Script de entrada do container
├── Makefile               # Comandos facilitados
├── .gitignore
├── .editorconfig
└── README.md              # Este documento
```

---

## ⚙️ Requisitos

* Docker 22+
* Docker Compose v2+
* (Opcional) Node.js + Yarn para uso local

---

## ✨ Executando com Docker

> O modo recomendado para desenvolvimento e execução.

1. **Configure suas chaves para o Ollama**:

   Crie a pasta `secrets/` na raiz com suas chaves SSH em formato OpenSSH:

   ```
   secrets/
   ├── id_ed25519
   └── id_ed25519.pub
   ```

   > 🛡️ Essas chaves são montadas no container do Ollama e **não devem ser versionadas**.

2. **Suba os serviços**

```bash
docker compose up -d
```

Ou, se preferir, via make:
```bash
make up
```

3. Acesse o app no navegador:

```
http://localhost:9000
```

O backend (Ollama/Mistral) escutará em:

```
http://localhost:11434
```

---

## 🧠 Sobre o Ollama + Mistral

Este projeto utiliza o modelo [Mistral](https://mistral.ai) localmente, servido via [Ollama](https://ollama.com). O container faz o pull automático do modelo e usa chaves SSH montadas na pasta `secrets/`.

Caso queira trocar o modelo, edite o comando no `entrypoint.sh` ou `docker-compose.yaml`.

---

## 👩‍💻 Desenvolvimento manual (sem Docker)

> Apenas se você desejar rodar o frontend sem containers.

1. Acesse a pasta `frontend/`:

```bash
cd frontend
```

2. Instale as dependências:

```bash
yarn
# ou
npm install
```

3. Inicie o servidor Quasar:

```bash
quasar dev
```

---

## 🧹 Scripts úteis

* **Lint**:

  ```bash
  yarn lint
  # ou
  npm run lint
  ```

* **Formatar código**:

  ```bash
  yarn format
  # ou
  npm run format
  ```

* **Build de produção**:

  ```bash
  quasar build
  ```

---

## ⚙️ Configurações

Veja a documentação oficial:
[Quasar CLI - Configurações](https://v2.quasar.dev/quasar-cli-vite/quasar-config-js)

---

## 📄 Licença

Este projeto é livre para uso em projetos pessoais ou comerciais. Atribuições são bem-vindas, mas não obrigatórias.

---

## 👨‍💼 Contribuindo

Pull requests são bem-vindos. Para contribuições maiores, por favor abra uma issue antes para discutirmos mudanças significativas.
