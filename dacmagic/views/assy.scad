include <../main.scad>;
color("#555") linear_extrude(plate_t) plate();

translate([0,0,plate_t]) {
    translate(knob_location) knob();
    translate(dac_location) dac();
    silkscreen();
}
translate(display_location) display();

translate(dac_location) dac_bracket();

