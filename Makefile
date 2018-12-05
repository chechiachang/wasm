build:
	GOOS=js GOARCH=wasm go build -o public/fmt.wasm ./src/fmt

js:
	cp "$(shell go env GOROOT)/misc/wasm/wasm_exec.js" public

server: js
	go build . && ./wasm
