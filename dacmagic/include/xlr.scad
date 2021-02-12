// neutrik combination TRS/XLR
module xlr_cutout() {
    // d is 23.5, allowing a 1mm margin (0.5mm rad)
    spacing = 30;
    translate([0,-spacing/2])
    for (i = [0:1]) {
        translate([0, i*spacing,]) circle(d=24.5);
        translate([0, i*spacing,]) rotate([0, 0, 45]) translate([0, 15, 0]) circle(d=bolt_clearance_d);
        translate([0, i*spacing,]) rotate([0, 0, 225]) translate([0, 15, 0]) circle(d=bolt_clearance_d);
    }
}

module xlr_text() {
    standard_text("AUX IN", 53);
    translate([17,21.5]) standard_text("L");
    translate([17,-8.5]) standard_text("R");
}
