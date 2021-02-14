#!/usr/bin/env bash

# EXPERIMENTAL

# https://github.com/openscad/openscad/pull/448
set -e
openscad parts/plate.scad -o plate.svg
inkscape --export-filename=plate.dxf plate.svg --export-extension=org.ekips.output.dxf_outlines
