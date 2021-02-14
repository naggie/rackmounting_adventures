#!/usr/bin/env bash

# EXPERIMENTAL

# https://github.com/openscad/openscad/pull/448
set -e

export PATH=$PATH:/usr/local/Caskroom/inkscape/1.0.2/Inkscape.app/Contents/MacOS/
export PATH=$PATH:/usr/local/Caskroom/openscad/2021.01/OpenSCAD.app/Contents/MacOS/

openscad parts/plate.scad -o plate.svg
inkscape --export-filename=plate.dxf plate.svg # --export-extension=org.ekips.output.dxf_outlines
