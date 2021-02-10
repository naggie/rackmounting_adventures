module plate() {
    difference() {
        // make x=0centerline
        translate([0,-rack_h/2,0]) rack2u();

        translate(power_switch_location) switch_cutout();
        translate(soft_button_location) circle(d=16);
        translate(display_location) display_cutout();
        translate(knob_location) knob_cutout();
        translate(dac_location) dac_cutout();
        translate(aux_location) circle(d=6);
        translate(xlr_location) xlr_cutout();
    }
}
