# tools version
GO_OAPI_CODEGEN_VERSION=latest

# go
go/install/tools:
	go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@$(GO_OAPI_CODEGEN_VERSION)

# quick start
quick-start:
	go mod tidy &&\
	make go/install/tools &&\
	source ~/.zshrc &&\
	make oapi/codegen &&\
	go run main.go

# swagger
docker/swagger/gen:
	docker run --rm -v $(PWD):/spec redocly/cli:latest bundle docs/swagger/root.yml -o docs/swagger/root.gen.yml

docker/swagger/run: docker/swagger/gen
	docker run -p 8081:8080 -v $(PWD)/docs/swagger:/usr/share/nginx/html/api -e API_URL=api/root.gen.yml swaggerapi/swagger-ui

# oapi
oapi/codegen: docker/swagger/gen
	oapi-codegen  --config oapicodegen.yml docs/swagger/root.gen.yml

# git
git/commit-template:
	cp ./.github/.gitmessage.txt.example ./.github/.gitmessage.txt &&\
    git config commit.template ./.github/.gitmessage.txt &&\
    git config --add commit.cleanup strip
