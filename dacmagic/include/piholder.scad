// Holds Pi, display and rotary encoder

// screw cut outs for front panel and brass inserts (hence variable R)
// defines footprint, too
module piholder_screwholes(d) {
    x_sep = 110;

    translate([-x_sep/2,-dac_screw_offset[1]]) circle(d=d);
    translate([-x_sep/2, dac_screw_offset[1]]) circle(d=d);
    translate([ x_sep/2, dac_screw_offset[1]]) circle(d=d);
    translate([ x_sep/2,-dac_screw_offset[1]]) circle(d=d);
}

module piholder_cutout() piholder_screwholes(bolt_clearance_d);

module piholder() color("#444") {
    t=6;
    difference() {
        // main panel
        translate([0,0,-t])
            linear_extrude(t)
            hull()
            piholder_screwholes(threaded_insert_d+2.5);

        // bolt holes
        translate([0,0,2-bolt_l]) linear_extrude(bolt_l+2) piholder_screwholes(bolt_clearance_d);

        // brass inserts
        translate([0,0,1-threaded_insert_l]) linear_extrude(threaded_insert_l+1) piholder_screwholes(threaded_insert_d);
    }
}
