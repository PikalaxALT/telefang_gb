# telefang_gb
Disassembly of Keitai Denjuu Telefang Speed and Power for the Gameboy Color (Japanese)

This repository builds telepower.gbc and telespeed.gbc, provided you have the appropriate build environment.

Requirements: GNU make, [rgbds](http://github.com/bentley/rgbds), Python 2.7 + pip, Python 3.x + pip

When cloning, remember to pass the `--recursive` flag to clone the `extras` submodule, required by `gfx.py`.

## WARNING
When building for the first time, the ROMs will not match.  This is because the colored PNGs do not build correctly due to a bug in gfx.py.  Resolve this by running the following commands in your UNIX shell:

    find . -iname "*.2bpp" -exec git checkout {} \;
