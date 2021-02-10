include <../main.scad>;
color("#555") linear_extrude(panel_t) plate();

translate([0,0,panel_t]) {
    translate(knob_location) knob();
    translate(dac_location) dac();
}

color("#777") translate(dac_location) dac_bracket();
