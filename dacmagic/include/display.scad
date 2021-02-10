module display_cutout() {
    rounded_square(display_w,display_h, 1.5);
}

module display() {
    translate([0,0,2.9]) linear_extrude(1.1) translate([0,-5]) square([72,43], center=true);
    linear_extrude(2.9) display_cutout();
}

module display_holder_negative() {

}
