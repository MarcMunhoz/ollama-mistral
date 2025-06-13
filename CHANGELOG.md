# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Changed

- Restructured the project: replaced `/frontend` with `/app`
- Updated `README.md`, `Dockerfile`, and `docker-compose.yaml` to reflect new structure
- Updated Node.js target from 20 to 22 in `quasar.config.ts`
- Changed Prettier setting: `singleQuote` is now `false` (uses double quotes)
- Updated `quasar.config.ts` to write API route properly
- Removed port 11434 from `docker-compose.yaml`
- Added restriction to use only Yarn, disallowing npm
- Replaced `ts-node` with `tsx` in the backend (Express middleware) development script
- Added TailwindCSS integration via PostCSS (postcss.config.js)
- Exposed Ollama port to localhost
- Updated Tailwind CSS PostCSS plugin import to `@tailwindcss/postcss` to support Tailwind v4

### Added

- WSL-specific polling configuration in Quasar `devServer.watch`
- Cleanup step in `make down` to remove `app/.quasar`
- Added `middleware/server.ts` for backend Express API
- Added route `/api/ollama` in frontend Axios requests
- Added new dependencies: `concurrently`, `cors`, `express`, `http-proxy-middleware`
- Added middleware target in `Makefile`

### Fixed

- Fixed `docker compose build` command in `Makefile` (removed deprecated `docker-compose` syntax)

---

## [0.1.0] - 2025-06-10

### Added

- Initial Quasar frontend setup with Docker support
- Ollama + Mistral integration via container
