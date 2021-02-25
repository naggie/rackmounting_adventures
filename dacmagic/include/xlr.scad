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
    translate([16.5,21]) standard_text("L");
    translate([16.5,-9.5]) standard_text("R");
}

module xlr_box() {
    difference() {
        translate([-15,0,0]) sidebox(58.5);

        translate([0,0,-50])
            linear_extrude(100)
            xlr_cutout();

        translate([usb_location[0]-xlr_location[0],usb_location[1],0.01])
            usb(expand=0.5);

        translate([toggle_location[0]-xlr_location[0],toggle_location[1],0.01])
            toggle_negative();
    }
}

module xlr_box_lid() {
    difference() {
        sidebox_lid(58.5);
        translate([0,0,-50])
            linear_extrude(100)
            circle(d=12);

        #translate([usb_location[0]-xlr_location[0],usb_location[1],0.01]) circle(d=6);
    }
}
