module plate() {
    difference() {
        // make x=0centerline
        translate([0,-rack_h/2,0]) rack2u();

        translate(switch_location) switch_cutout();
        translate(button_location) button_cutout();
        translate(display_location) display_cutout();
        translate(knob_location) knob_cutout();
        translate(dac_location) dac_cutout();
        translate(aux_location) circle(d=6);
        translate(xlr_location) xlr_cutout();
    }
}
