# Spout GD

[Godot](https://github.com/godotengine/godot) 4.1.1 bindings for [Spout](https://github.com/leadedge/Spout2).

## Status

The sender/receiver apis have been implemented but are mostly untested. Please open an issue
if something doesn't seem to work.

## Building

Prerequisites:

* Windows (Spout only works on Windows)
* git
* bash
* scons
* a C++ compiler capable of [compiling Godot](https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_for_windows.html)
* cmake

Clone the repository: `git clone --recurse-submodules https://github.com/you-win/spout-gd.git`

Run `build.sh` in a bash-compatible terminal. This will:

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
var img: Image

func _ready():
    spout = Spout.new()
    
func _process():
    img = get_viewport().get_texture().get_image()
    spout.send_image(img, img.get_width(), img.get_height(), Spout.FORMAT_RGBA, false)
```