module plate() {
    difference() {
        // make x=0centerline
        translate([0,-rack_h/2,0]) rack2u();

        translate(switch1_location) switch_cutout();
        translate(switch2_location) switch_cutout();
        translate(display_location) display_cutout();
        translate(knob_location) knob_cutout();
        translate(dac_location) dac_cutout();
        translate(usb_location) usb();
        translate(toggle_location) toggle();
        translate(xlr_location) xlr_cutout();
    }
}
