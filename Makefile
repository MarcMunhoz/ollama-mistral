up:
	docker compose up -d --force-recreate

start:
	docker compose start

stop:
	docker compose stop

down:
	docker compose down --volumes --remove-orphans && docker image rm ollama-mistral_frontend_img && rm -rf frontend/node_modules