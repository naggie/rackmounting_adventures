module silkscreen() {
    // make x=0centerline
    //translate([0,-rack_h/2,0]) rack2u();

    translate(switch_location) switch_text();
    translate(button_location) button_text();
    translate(display_location) display_text();
    translate(knob_location) knob_text();
    translate(dac_location) dac_text();
}
