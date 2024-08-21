# Spout GD

[Godot](https://github.com/godotengine/godot) 4.3 bindings for [Spout](https://github.com/leadedge/Spout2).

> [!IMPORTANT]
> Technically, this is 4.1.1 bindings built against latest Godot (4.3-stable) and Spout2 (2.007.014) codebases, but it works fine and has less footprint.

## Status

The sender/receiver APIs have been implemented but are mostly untested. PRs are welcome (I am not a C++ dev myself).

## Building

Prerequisites:

* Windows (Spout only works on Windows)
* git
* cmd/bash
* scons
* cmake
* a C++ compiler capable of [compiling Godot](https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_for_windows.html)
    > [!TIP]
    > You can quickly make a compatible virtual machine using Hyper-V's "Quick Create" feature.

Clone the repository: `git clone --recurse-submodules https://github.com/cjmaxik/spout-gd.git`

Run `build.sh` in a bash-compatible terminal or `build.bat` in cmd/Powershell. This will:

* Compile Spout2
* Compile the gdextension bindings
* Compile spout-gd

Once compilation is finished, create `addons/spout-gd` folder in the project root, then copy the following files there:

* `spout_gd.gdextension` -> `root`
* `Spout2/Binaries/x64/SpoutLibrary.dll` -> `bin/SpoutLibrary.dll`
* `out/spout_gd.windows.template_debug.dll` -> `bin/spout_gd.windows.template_debug.dll`
* `out/spout_gd.windows.template_release.dll` -> `bin/spout_gd.windows.template_release.dll`

## Basic usage

```gdscript
var spout: Spout

func _ready():
    spout = Spout.new()
    
func _process():
    await RenderingServer.frame_post_draw
    var img = get_viewport().get_texture().get_image()
    spout.send_image(img, img.get_width(), img.get_height(), Spout.FORMAT_RGBA, false)
```

> [!IMPORTANT]
> `send_texture` and `send_fbo` are not working on Vulkan/Forward+ since Spout2 does not support Vulkan, see [#69](https://github.com/leadedge/Spout2/issues/69).
