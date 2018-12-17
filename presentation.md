Go WebAssembly
===

# What is WebAssembly

[Using WebAssembly and Threads](https://www.youtube.com/watch?v=zgOGZgAPUjQ)

1. A new language for web. Supported by all modern browsers.
2. NOT replace JS, but fill the gaps of JS.
3. Compiled from other languages (like c, go, ruby, python, perl, php, .net, ...)
4. Maximized, reliable performance

# Why wasm: Performance Boost

JS is not designed to be an assembly lang. But we are using it as one.

golang -> (compiler) -> executable -> (runtime) -> run
JS  ->  (interpreter) -> translation and run

Modern Browsers do lots of optimization
 - Just In Time compiler of JS engine
 - trace and re-optimize (loop)
 - GC
 - Built-in functions / Stadard Library / APIs

### Lin Clark:

[What makes WebAssembly fast](https://hacks.mozilla.org/2017/02/what-makes-webassembly-fast)
[A crash course in just-in-time (JIT) compilers](https://hacks.mozilla.org/2017/02/a-crash-course-in-just-in-time-jit-compilers/)

js -> parse -> compile + optimize -> re-optimize -> execute -> gc

js -> parse -> execuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuute -> gc

wasm -> decode -> compile + optimize -> execute

Wasm is already compiled, just download, decode, and use it.
JIT throw out optimized version of code and retry due to type asseumptions. Wasm types are explicit.

[Spidermonkey architecture](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey/Internals)

# Why wasm: Complilation for other languages

Add more libraries from other high-level languages

# Why wasm: Protable

JS modules are highly modulized. Comminities are dedicated to web-assemblize modules

Optimize and Modulize
Executables for Multiple Platforms -> Run anywhere on Browser

# Why wasm: sum

"Unlock the super power computer in your pocket"

- Performance -> We can do more things in Front-End
- Protable -> benefits from other languages
- Flexibility -> Use wasm with JS

# Real Applications

Online compiler / image editor
Game loading(ex. Unity)
Google Earth: [Earth on Web: The road to cross browser](https://medium.com/google-earth/earth-on-web-the-road-to-cross-browser-7338e0f46278)

# Go WebAssembly

[https://github.com/golang/go/wiki/WebAssembly](https://github.com/golang/go/wiki/WebAssembly)

# Examples

### Manipulate DOM

``` Golang
func add(i []js.Value) {
	value1 := js.Global().Get("document").Call("getElementById", "input1").Get("value").String()
	value2 := js.Global().Get("document").Call("getElementById", "input2").Get("value").String()

	int1, _ := strconv.Atoi(value1)
	int2, _ := strconv.Atoi(value2)

	js.Global().Get("document").Call("getElementById", "sum").Set("value", int1+int2)
}
```

``` Javascript
func add() {
	var value1 = document.getElementById("input1").value;
	vat value2 = document.getElementById("input2").value;

	document.getElementById("sum").value = Number(value1) + Number(value2);
}
```

### Build / Run go-wasm

``` Makefile
run-%:
	GOOS=js GOARCH=wasm go run -exec="$(shell go env GOROOT)/misc/wasm/go_js_wasm_exec" ./src/$*

test:
	GOOS=js GOARCH=wasm go test -exec="$(shell go env GOROOT)/misc/wasm/go_js_wasm_exec" ./...

build-%:
	GOOS=js GOARCH=wasm go build -o public/lib.wasm ./src/$*

server: js
	go run ./src/server -listen :8080 -dir public
```

# Package JS

https://godoc.org/syscall/js

Package js gives access to the WebAssembly host environment when using the js/wasm architecture. Its API is based on JavaScript semantics.

This package is EXPERIMENTAL. Its current scope is only to allow tests to run, but not yet to provide a comprehensive API for users. It is exempt from the Go compatibility promise. <- WARNING

# Browser Supports

Edge, Firefox, Chrome, Safari

See wasm code in chrome 70
chrome 71 source map support (more like source code)

Debug wasm in Chrome debug tooll

# Go-wasm examples

https://justinclift.github.io/wasmGraph1/

https://github.com/djhworld/gomeboycolor-wasm

# End

# Still experimental 

The DOM manipulation is quite stupid. There will be more support.
```
	value1 := js.Global().Get("document").Call("getElementById", "input1").Get("value").String()
	int1, _ := strconv.Atoi(value1)
#vs
	var value1 = document.getElementById("input1").value;
```

Not all golang feature can be correctly adapt to wasm.

# Extanding

1. Try adpt wasm to your work
2. Share with community
