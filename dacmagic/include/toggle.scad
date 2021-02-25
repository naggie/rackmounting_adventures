module toggle_cutout() {
    circle(d=6);
}
module toggle_text() {
    translate([0, 16.5]) standard_text("AUX", 6);
    standard_text("DAC", 6);
}

module toggle_negative() mirror([0,0,1]) {
    translate([0,0,1.5]) {
        linear_extrude(100) square([22.5,13.5],center=true);
        translate([0,0,0.001]) mirror([0,0,1]) linear_extrude(20) toggle_cutout();
    }
}
