include <../main.scad>;
color("#555") linear_extrude(panel_t) plate();
translate([dac_location[0], dac_location[1], panel_t]) dac();
color("#777") translate(dac_location) dac_bracket();
