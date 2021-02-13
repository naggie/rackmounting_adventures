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

piholder_w = 120;
piholder_d = 80;


dac_bezel_r=5;
dac_bezel_w=215;
dac_bezel_h=51.6;
dac_bezel_d=4.73;
dac_bezel_t=4.5;
dac_d=190;
dac_case_w=214;
dac_case_h=50;
dac_case_r=5;
// defined here so other panel features can use y vals; pi holder does.
dac_screw_offset=[dac_bezel_w/2-13,dac_bezel_h/2+6.5];

// layout in X is done by eye -- calculating gaps is time consuming and might
// not necessarily result in a visually balanced look due varied shapes.
switch1_location = [35,22];
switch2_location = [35,-18];
piholder_location = [110,0];
display_location = [88,0];
knob_location = [148,0];
dac_location = [286,0];
usb_location = [413,18];
toggle_location = [413,-22];
xlr_location = [445,0];

// 1.5mm is standard. 2.0 for extra strength
plate_t = 2.0;

// used for most fixtures. XLR uses M2 or M2.5. M3 CSK depth 2mm
bolt_d = 2.5;
bolt_l = 10;
bolt_clearance_d = bolt_d * 1.1;
threaded_insert_d = 3.6;
threaded_insert_l = 4.1;

include <include/etc.scad>;
include <include/rack2u.scad>;
include <include/switch.scad>;
include <include/display.scad>;
include <include/piholder.scad>;
include <include/knob.scad>;
include <include/usb.scad>;
include <include/dac.scad>;
include <include/toggle.scad>;
include <include/xlr.scad>;
include <include/silkscreen.scad>;

include <include/plate.scad>;
