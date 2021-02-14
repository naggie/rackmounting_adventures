#!/usr/bin/env bash
set -e

export PATH=$PATH:/usr/local/Caskroom/inkscape/1.0.2/Inkscape.app/Contents/MacOS/
export PATH=$PATH:/usr/local/Caskroom/openscad/2021.01/OpenSCAD.app/Contents/MacOS/

mkdir -p dist

openscad parts/plate-vflip.scad -o plate-vflip.svg
openscad parts/plate.scad -o dist/plate.svg
python3 etc/svg_to_dxf.py plate-vflip.svg dist/plate.dxf
rm plate-vflip.svg
