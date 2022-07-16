postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14.4-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root graphql_go

deopdb:
	docker exec -it postgres14 deopdb graphql_go

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/graphql_go?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/graphql_go?sslmode=disable" -verbose down

.PHONY: postgres createdb deopdb migrateup migratedown