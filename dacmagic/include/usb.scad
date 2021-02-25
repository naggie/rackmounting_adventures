module usb_cutout() {
    // TODO correct
    rounded_square(12,13,1.5);
    translate([0,12.5]) circle(d=bolt_clearance_d);
    //translate([0,-12.5]) circle(d=bolt_clearance_d); // collides with label
}

module usb_text()
    standard_text("USB IN", 13);

module usb() mirror([0,0,1]) color("#333") {
    // for some reason (12,40,6) makes it disappear
    linear_extrude(5.3) difference() {
        rounded_square(12.1,34.7,6);
        translate([0,12.5]) circle(d=bolt_clearance_d);
        translate([0,-12.5]) circle(d=bolt_clearance_d); // collides with label
    }
    linear_extrude(25) rounded_square(14.5,20.4,1.5);
    linear_extrude(30) circle(d=9.72);
}

module xlr_box() {
    difference() {
        sidebox(60);

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
