$fn=200;

// TODO text for UV printing / silkscreen

// TODO scalars to vectors (whd and location)

rack_w = 19* 25.4;
rack_h = 88;
rack_ear = 20.2;

display_w=56.8;
display_h=29.4;
display_pcb_w=72;
display_pcb_h=43;
display_pcb_offset=[0,-5];


dac_bezel_r=5;
dac_bezel_w=215;
dac_bezel_h=51.6;
dac_bezel_d=4.73;
dac_bezel_t=4.5;
dac_d=190;
dac_case_w=214;
dac_case_h=50;
dac_case_r=5;

// layout in X is done by eye -- calculating gaps is time consuming and might
// not necessarily result in a visually balanced look due varied shapes.
switch1_location = [35,25];
switch2_location = [35,-18];
display_location = [88,0];
knob_location = [148,0];
dac_location = [286,0];
aux_location = [415,0];
xlr_location = [445,0];

// 1.5mm is standard. 2.0 for extra strength
plate_t = 2.0;

// used for most fixtures. XLR uses M2 or M2.5. M3 CSK depth 2mm
bolt_d = 2.5;
bolt_l = 10;
bolt_clearance_d = bolt_d * 1.1;
threaded_insert_d = 3.8;
threaded_insert_l = 4.1;

include <include/etc.scad>;
include <include/rack2u.scad>;
include <include/switch.scad>;
include <include/knob.scad>;
include <include/display.scad>;
include <include/dac.scad>;
include <include/xlr.scad>;
include <include/silkscreen.scad>;

include <include/plate.scad>;
