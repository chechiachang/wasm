run:
	GOOS=js GOARCH=wasm go run -exec="$(shell go env GOROOT)/misc/wasm/go_js_wasm_exec" .

build:
	GOOS=js GOARCH=wasm go build -o public/fmt.wasm ./src/fmt

test:
	GOOS=js GOARCH=wasm go test -exec="$(shell go env GOROOT)/misc/wasm/go_js_wasm_exec"

js:
	cp "$(shell go env GOROOT)/misc/wasm/wasm_exec.js" public

server: js
	go build ./src/server && ./server -listen :8080 -dir public
