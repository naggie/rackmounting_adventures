module rack_hole(d,l) {
    translate([d/2,d/2,0]) hull() {
        circle(d=d);
        translate([l-d,0]) circle(d=d);
    }
}

module rack2u() {
    hole_d = 6.4;
    hole_l = 9.7;
    hole_offset_x = 4.5;
    hole_offset_y = 2.8;

    difference() {
        // main body
        square([rack_w,rack_h]);
        // holes
        translate([hole_offset_x, hole_offset_y]) rack_hole(hole_d, hole_l);
        translate([hole_offset_x, rack_h-hole_offset_y-hole_d]) rack_hole(hole_d, hole_l);
        translate([rack_w-hole_offset_x-hole_l, hole_offset_y]) rack_hole(hole_d, hole_l);
        translate([rack_w-hole_offset_x-hole_l, rack_h-hole_offset_y-hole_d]) rack_hole(hole_d, hole_l);
    }
}

module rack2u_rails() translate([0,0,-10]) linear_extrude(10) {
    translate([0,-rack_h]) square([rack_ear, rack_h*3]);
    translate([rack_w-rack_ear,-rack_h]) square([rack_ear, rack_h*3]);
}
