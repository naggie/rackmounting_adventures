# General approach
Panel itself is 2d, as are cut-outs.

Real objects are 3D, implemented in front and behind for clearance + view
purposes.  Only necessary objects are implemented.

Features are center co-ordinate based with a globally defined offset. This is
so a cut out, bracket and object can share the same reference easily.

X-layout is done by eye. Some features are Y-aligned. No obsession over round
numbers or calculated spacing -- balance is more than a function of margin.

Modules are used to create new co-ordinate frames such that geometry can be
used to avoid calculating positioning mathematically.

# Conventions


# Include

Non-coherent part libraries dependent on main.scad.

Implementation for everything goes here, including views.

# Jigs


# Parts

Individual parts to manufacture, 2D or 3D as the manufacturing process
requires.

Normally just calling a module.

# Views

Normally just calling/assembling modules.





# OpenSCAD DXF

# dxf_outline inkscape extension

# svg_to_dxf.py

# implicitcad/openjscad

# FreeCAD DXF, import OpenSCAD/CSG settings

A1 revision, still badd obrounds





# Conclusion

switch cutout 10mm -> 12mm

Switch holder plate face too thick, reduce or eliminate in future

M2.5 might become M3 but probably not

toggle 6.5mm not 6mm



---


Thanks that’s, only the obround but I have fixed that. The 2 x 24.5 dia holes can they be 25 dia?

Also 2mm steel or 3mm alu? What better?

Lots of tool/retention marks needs:
Flattening, de-burring, sanding
Diamond needle files great for deburring/smoothing/blending -- can look bowed/non-square. Need to blend by eye, radius. Corners with round

Sandpaper mad huge difference. Perception influenced by how small distortions are amplified by the shiny surface.

320 for paint


Tolerance to low for large 3D printed parts -- due to warping or 3D printer inacurracy. Make holes 3mm

Plastic stuck in inserts, make holes much deeper
Bad alignment of power switch labels
Awkward power switch module construction. Better off as a shroud bolted to front.

Better off defining horizontal lines for bolts
XLR -- bolt to front and don't rely on XLR bolts?
