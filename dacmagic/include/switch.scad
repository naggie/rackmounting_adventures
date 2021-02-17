module switch_cutout() {
    circle(d=12.5);
}

module switch() color("#111") mirror([0,0,1]) {
    // TODO correct and implement fully
    translate([0,0,4]) linear_extrude(10) square([15,29],center=true);
}

module switch1_text()
    standard_text("STANDBY POWER", 10);

module switch2_text()
    standard_text("MAIN POWER", 10);

module switch_box() {
    difference() {
        sidebox(15.5);

        translate([0,0,-50])
            translate([0,switch1_location[1]])
            linear_extrude(100)
            switch_cutout();

        translate([0,0,-50])
            translate([0,switch2_location[1]])
            linear_extrude(100)
            switch_cutout();

        // space for nut
        translate([0,0,-47.01])
            linear_extrude(5.5)
            square([17.5,17.5],center=true);
    }
}

module switch_box_lid() {
    difference() {
        sidebox_lid(15.5);
        translate([0,0,-50])
            linear_extrude(100)
            circle(d=12);
    }
}
