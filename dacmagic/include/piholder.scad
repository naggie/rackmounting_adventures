// Holds Pi, display and rotary encoder

// screw cut outs for front panel and brass inserts (hence variable R)
// defines footprint, too
module piholder_screwholes(d) {
    x_sep = piholder_w - threaded_insert_d * 2;

    translate([-x_sep/2,-dac_screw_offset[1]]) circle(d=d);
    translate([-x_sep/2, dac_screw_offset[1]]) circle(d=d);
    translate([ x_sep/2, dac_screw_offset[1]]) circle(d=d);
    translate([ x_sep/2,-dac_screw_offset[1]]) circle(d=d);
}

module piholder_cutout() piholder_screwholes(bolt_clearance_d);

module piholder() color("#444") {
    t=8;
    l=80;
    difference() {
        // main panel
        translate([0,0,-t])
            linear_extrude(t)
            square([piholder_w, rack_h], center=true);

        // bolt holes
        translate([0,0,2-bolt_l]) linear_extrude(bolt_l+2) piholder_screwholes(bolt_clearance_d);

        // brass inserts
        translate([0,0,1-threaded_insert_l]) linear_extrude(threaded_insert_l+1) piholder_screwholes(threaded_insert_d);
    }
    // shelf
    translate([-piholder_w/2,-rack_h/2,-l-t-0.001]) linear_extrude(l+t) square([piholder_w, t]);
}

// centered to pi()
// https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/README.md
module pi_screwholes(d) {
    translate([-39.5,-24.5]) circle(d=d);
    translate([-39.5,24.5]) circle(d=d);
    translate([18.5,24.5]) circle(d=d);
    translate([18.5,-24.5]) circle(d=d);
}

//t=8;
//translate([0,0,t+1]) mirror([0,0,1]) linear_extrude(threaded_insert_l+1) pi_screwholes(threaded_insert_d);

module pi() {
    difference() {
        linear_extrude(1.4) rounded_square(85,56,3.0);
        translate([0, 0,-50]) linear_extrude(100) pi_screwholes(bolt_clearance_d);
    }
}
