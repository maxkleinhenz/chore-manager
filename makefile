dev:
	make -j 2 dev-css dev-go

dev-go:
	air

dev-css:
	pnpm run -C ./tailwind watch:css


db-generate:
	sqlc generate