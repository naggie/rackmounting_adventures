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
