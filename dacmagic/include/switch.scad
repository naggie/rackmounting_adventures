module switch_cutout() {
    circle(d=10);
}

module switch() {
    // TODO correct and implement fully
    translate([0,0,-15]) linear_extrude(10) square([15,29],center=true);
}
