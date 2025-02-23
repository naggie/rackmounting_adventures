include <../main.scad>;
%rack2u();
translate([0, rack_h/2]) silkscreen();

// tiny squares to workaround SVG origin issues
// https://github.com/openscad/openscad/issues/3460
square([0.1,0.1]);
