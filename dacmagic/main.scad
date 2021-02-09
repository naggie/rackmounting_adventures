$fn=200;

// TODO text for UV printing!

rack_w = 19* 25.4;
rack_h = 88;
rack_ear = 20.2;

display_w=56.8;
display_h=29.4;

dac_bezel_r=5;
dac_bezel_w=215;
dac_bezel_h=51.6;
dac_bezel_d=4.73;
dac_bezel_t=4.5;
dac_d=190;
dac_case_w=214;
dac_case_h=50;
dac_case_r=5;

dac_offset_x = 286;

panel_t = 2.0;

// M3 is 3.2mm in diameter, add 10% for clearance
// https://www.nmri.go.jp/oldpages/eng/khirata/metalwork/basic/bolt/index_e.html
// used for most fixtures. XLR uses M2 or M2.5
bolt_clearance_d = 3.5;
threaded_insert_d = 3.9;
threaded_insert_l = 6.0;

// modes to allow offsets without spanning modules
NORMAL=1;
SILKSCREEN=2;
CLEARANCE=3;

module rounded_square(x,y,r) {
    translate([-x/2,-y/2]) offset(r) offset(-r) square([x,y]);
}

module knob(mode=NORMAL) {
    if (mode == NORMAL) {
        circle(d=6);
    } else if (mode == CLEARANCE) {
        circle(d=30);
    }
}

module xlr(spacing=30) {
    translate([0,-spacing/2])
    for (i = [0:1]) {
        translate([0, i*spacing,]) circle(d=25);
        translate([0, i*spacing,]) rotate([0, 0, 45]) translate([0, 15, 0]) circle(d=3);
        translate([0, i*spacing,]) rotate([0, 0, 225]) translate([0, 15, 0]) circle(d=3);
    }
}

module display(mode=NORMAL) {
    if (mode == NORMAL) {
        offset(1.5) offset(-1.5) square([display_w,display_h]);
    } else if (mode == CLEARANCE) {
        // TODO correct
        translate([-5,-3]) square([63,35]);
    }
}

module switch(mode=NORMAL) {
    if (mode == NORMAL) {
        circle(d=10);
    } else if (mode == CLEARANCE) {
        square([15,29],center=true);
    }
}

include <include/dac.scad>;
include <include/rack2u.scad>;
include <include/plate.scad>;
