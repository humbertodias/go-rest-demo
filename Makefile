TAG_NAME=$(shell git describe --always --abbrev=0 --tags)
APP_NAME=rest-demo
MAC_EXE=$(APP_NAME)-darwin-amd64-$(TAG_NAME).app
LIN_EXE=$(APP_NAME)-linux-amd64-$(TAG_NAME)
WIN_EXE=$(APP_NAME)-windows-amd64-$(TAG_NAME).exe

run:
	go run main.go

init:
	mkdir -p dist


build-mac-arm:  init
	GOOS=darwin GOARCH=arm64 go build -o dist/$(MAC_EXE)
	chmod +x dist/$(MAC_EXE)
	tar zcvf dist/$(MAC_EXE).tar.gz -C dist $(MAC_EXE)

build-mac:  init
	GOOS=darwin GOARCH=amd64 go build -o dist/$(MAC_EXE)
	chmod +x dist/$(MAC_EXE)
	tar zcvf dist/$(MAC_EXE).tar.gz -C dist $(MAC_EXE)

build-lin:  init
	GOOS=linux GOARCH=amd64 go build -o dist/$(LIN_EXE)
	chmod +x dist/$(LIN_EXE)
	tar zcvf dist/$(LIN_EXE).tar.gz -C dist $(LIN_EXE)

build-win:  init
	GOOS=windows GOARCH=amd64 go build -o dist/$(WIN_EXE)
	chmod +x dist/$(WIN_EXE)
	zip -9 -D -r dist/$(WIN_EXE).zip dist/$(WIN_EXE)

build: build-mac    build-lin   build-win

test:
	go test -v

lint:
	golint

format:
	go fmt

fix:
	go fix

clean-dist:
	rm -rf dist

clean: clean-dist

docker-build:
	docker build . -t $(APP_NAME)

docker-run:
	docker run -p 8080:8080 $(APP_NAME)
