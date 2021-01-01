# web_gpu

So far there is no way to render 3D objects efficently in Flutter. Also directly accessing and programming the GPU from Dart isn't supported yet. This plugin shall close this gap. 

Originally @kentcb and I were working on a wrapper for OpenGL for a project for the company Aaronia. Altough we got pretty far with that one looking at the fact the Apple deprecated OpenGL I wondered if this still is the right approach and did some research. It turns out that there is a new standard emerging called [WebGPU](https://gpuweb.github.io/gpuweb/) that offers a unified API to programm GPUs and automatically translates it to Vulkan/Metal

So I decided it makes more sense to target this API as it supports modern GPUs better than OpenGL (at least that's what I read) and it will be Future prove if Apple decides to completely remove OpenGL.

Although WebGPU is aimed as to be integrated into web browsers so that web applications can direct and securely access the GPU to build high performance web apps. There are currently two implementations with a C interface that could be used from Dart via FFI.

* [Dawn from Google](https://dawn.googlesource.com/dawn/) which is written in c++ and is actually the engine that is integrated into Chrome
* [wgpu-native](https://github.com/gfx-rs/wgpu-native) which is written in Rust from an very active community.

So the idea is taking one of them and create a Dart-FFI layer so that it will work on all platforms.

Luckily [Aaronia](https://aaronia.de) supports this project by that I can work part of the time I do for them on this project. 

As there is a lot to do, and it needs knowledge of the tool chains for the different platforms it would be amazing if you could join this project.

Currently I see this tasks that need to be solved

- [] Try to download and build *Dawn* and try to get one of the C++ examples running
- [] If Dawn doesn't work, try with *wgpu-native*
- [] Set up WebGPU to build for Windows (I would start there because I know VS much better than X-Code)
- [] Create a Dart-FFI layer for `web_gpu.h`. The nice thing is that Dawn has a full definition of the web_gpu API in a JSON file from that it generates C++ code. I'm pretty sure we will be able to use that too to generate the needed Dart code automatically.
- [] add Android
- [] add iOS
- [] add MacOS
- [] add Linux
- [] add a way to render Text. My current idea would be to render Text using Flutter onto a canvas and pass that down as texture to WebGPU
- [] design Widgets that let you use GPU in Flutter
- [] write examples and documantation

Some more resources:

https://sotrh.github.io/learn-wgpu/
https://alain.xyz/blog/comparison-of-modern-graphics-apis
https://alain.xyz/blog/a-review-of-shader-languages
https://aras-p.info/blog/2017/02/15/ Font-Rendering-is-Getting-Interesting/

