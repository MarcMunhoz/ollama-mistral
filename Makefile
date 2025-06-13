up:
	docker compose build --no-cache
	docker compose up -d --force-recreate --always-recreate-deps

start:
	docker compose start

stop:
	docker compose stop

down:
	docker compose down --volumes --remove-orphans && docker image rm ollama-mistral_frontend_img && rm -rf app/node_modules app/.quasar

middleware:
	node app/middleware/server.ts