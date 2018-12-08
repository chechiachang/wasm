Go WebAssembly
===

# What is WebAssembly

[Using WebAssembly and Threads](https://www.youtube.com/watch?v=zgOGZgAPUjQ)

1. A new language for web. Supported by all modern browsers.
2. NOT replace JS, but Fill the gaps of JS.
3. Compiled from other languages (like c, go, ruby, python, perl, php, .net, ...)
4. Maximized, reliable performance

# Features

"Unlock the super power computer in your pocket"

- Performance -> We can do more things in Front-End
- Protable -> benefits from other languages
- Flexibility -> Use wasm with JS

# Multi-Theads management

- From single thread web app to parallel worker threads
- In JS, we can create many V8 instances, who don't share state with each others.
- In wasm, Wasm module control it's SharedArrayBuffer and workers

# Real Applications

Online compiler / image editor
Game loading(ex. Unity)
Google Earth

# Go WebAssembly

[https://github.com/golang/go/wiki/WebAssembly](https://github.com/golang/go/wiki/WebAssembly)

See wasm code in chrome 70

chrome 71 source map support (more like source code)

# Still experimental 

Not all golang feature can be correctly adapt to wasm.
Don't use in production, yet

# We Want You

1. Try adpt wasm to your work
2. Share with community
