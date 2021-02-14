include <../main.scad>;
color("#444") linear_extrude(plate_t) plate();

rack2u_rails();

// back
translate(switch1_location) switch();
translate(switch2_location) switch();
translate(piholder_location) piholder();
//translate(display_location) display();
translate(dac_location) dac_bracket();
translate(usb_location) usb();

// front
translate([0,0,plate_t]) {
    translate(knob_location) knob();
    translate(dac_location) dac();
    color("white") linear_extrude(0.001) silkscreen();
}
