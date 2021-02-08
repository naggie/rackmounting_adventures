include <../main.scad>;
color("#555") linear_extrude(panel_t) plate();
translate([dac_offset_x,0,panel_t]) dac();
color("#777") translate([dac_offset_x,0,0]) dac_bracket();
