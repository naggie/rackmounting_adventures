module usb_cutout() {
    // TODO correct
    rounded_square(12,13,1.5);
    translate([0,12.5]) circle(d=bolt_clearance_d);
    //translate([0,-12.5]) circle(d=bolt_clearance_d); // collides with label
}

module usb_text()
    standard_text("USB IN", 13);

module usb() mirror([0,0,1]) color("#333") {
    linear_extrude(9.5) rounded_square(15,40,1.5);
    linear_extrude(25) rounded_square(15,17.5,1.5);
    linear_extrude(38) circle(d=10.5);
}
