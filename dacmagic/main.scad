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
dac_bezel_t=3; // TODO correct
dac_d=200; // TODO correct
dac_case_w=214;
dac_case_h=50;
dac_case_r=5;

dac_offset_x = 286;

panel_t = 2.0;

// M3 is 3.2mm in diameter, add 10% for clearance
// https://www.nmri.go.jp/oldpages/eng/khirata/metalwork/basic/bolt/index_e.html
bolt_clearance_d = 3.5;

// modes to allow offsets without spanning modules
NORMAL=1;
SILKSCREEN=2;
CLEARANCE=3;


include <include/dac.scad>;

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

module rack_hole(d,l) {
    translate([d/2,d/2,0]) hull() {
        circle(d=d);
        translate([l-d,0]) circle(d=d);
    }
}

module rack2u(mode=NORMAL) {
    hole_d = 6.4;
    hole_l = 9.7;
    hole_offset_x = 4.5;
    hole_offset_y = 2.8;

    if (mode == NORMAL) {
        difference() {
            // main body
            square([rack_w,rack_h]);
            // holes
            translate([hole_offset_x, hole_offset_y]) rack_hole(hole_d, hole_l);
            translate([hole_offset_x, rack_h-hole_offset_y-hole_d]) rack_hole(hole_d, hole_l);
            translate([rack_w-hole_offset_x-hole_l, hole_offset_y]) rack_hole(hole_d, hole_l);
            translate([rack_w-hole_offset_x-hole_l, rack_h-hole_offset_y-hole_d]) rack_hole(hole_d, hole_l);
        }
    } else if (mode == CLEARANCE) {
        square([rack_ear, rack_h]);
        translate([rack_w-rack_ear,0]) square([rack_ear, rack_h]);
    }
}


module plate() {
    difference() {
        translate([0,-rack_h/2,0]) rack2u();

        // main power
        translate([35,20,0]) switch();

        // soft power
        translate([35,-20,0]) circle(d=16);


        translate([57,-display_h/2,0]) display();
        translate([144,0,0]) knob();
        translate([dac_offset_x,0,0]) dac_cutout();

        // AUX switch
        translate([415,0,0]) circle(d=6);

        translate([445,0,0]) xlr();
    }
}

// TODO view:
//color("#555") linear_extrude(panel_t)
//translate([dac_offset_x,0,panel_t]) dac();
//color("#777") translate([dac_offset_x,0,0]) dac_bracket();
