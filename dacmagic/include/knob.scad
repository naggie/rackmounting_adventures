module knob_cutout() {
    circle(d=6);
}

module knob() color("#333") {
    // TODO correct extrusion amount + offset
    translate([0,0,1]) linear_extrude(8) circle(d=30);
    // TODO add back/encoder/shaft
}
