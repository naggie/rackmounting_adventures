module knob_cutout() {
    circle(d=7.2);
}

module knob() color("#333") {
    // TODO correct extrusion amount + offset
    translate([0,0,1]) linear_extrude(8) circle(d=30);
    // TODO add back/encoder/shaft
}

module knob_text()
    standard_text("PI VOLUME", display_h);
