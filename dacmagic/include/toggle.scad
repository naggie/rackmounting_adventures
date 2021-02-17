module toggle_cutout() {
    circle(d=6);
}
module toggle_text() {
    translate([0, 16.5]) standard_text("AUX", 6);
    standard_text("DAC", 6);
}
