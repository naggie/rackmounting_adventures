#!/usr/bin/env bash
set -e


export PATH=$PATH:/usr/local/Caskroom/inkscape/1.0.2/Inkscape.app/Contents/MacOS/
export PATH=$PATH:/usr/local/Caskroom/openscad/2021.01/OpenSCAD.app/Contents/MacOS/

openscad parts/plate-vflip.scad -o plate-vflip.svg
python3 svg_to_dxf.py plate-vflip.svg plate.dxf
