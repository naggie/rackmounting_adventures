module xlr_cutout() {
    spacing = 30;
    translate([0,-spacing/2])
    for (i = [0:1]) {
        translate([0, i*spacing,]) circle(d=25);
        translate([0, i*spacing,]) rotate([0, 0, 45]) translate([0, 15, 0]) circle(d=bolt_clearance_d);
        translate([0, i*spacing,]) rotate([0, 0, 225]) translate([0, 15, 0]) circle(d=bolt_clearance_d);
    }
}

module xlr_text() {
    standard_text("AUX IN", 53);
    translate([18,21.5]) standard_text("L");
    translate([18,-8.5]) standard_text("R");
}
