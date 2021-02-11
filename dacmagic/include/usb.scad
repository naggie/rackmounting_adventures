module usb_cutout() {
    // TODO correct
    rounded_square(12,13,1.5);
    translate([0,12.5]) circle(d=bolt_clearance_d);
    //translate([0,-12.5]) circle(d=bolt_clearance_d); // collides with label
}

module usb_text()
    standard_text("USB IN", 13);
