module switch_cutout() {
    circle(d=10);
}

module switch() mirror([0,0,1]) {
    // TODO correct and implement fully
    translate([0,0,4]) linear_extrude(10) square([15,29],center=true);
}

module switch1_text()
    standard_text("MAIN POWER", 10);

module switch2_text()
    standard_text("AMP POWER", 10);
