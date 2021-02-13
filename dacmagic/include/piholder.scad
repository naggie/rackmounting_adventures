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

module piholder() color("green") {
    t=8;
    l=80;
    difference() {
        // main panel
        union() {
            translate([0,0,-t])
                linear_extrude(t)
                square([piholder_w, rack_h], center=true);
            // shelf
            translate([-piholder_w/2,-rack_h/2,-t+0.001]) rotate([-90,0,0]) pi_shelf();
        }

        // bolt holes
        translate([0,0,2-bolt_l]) linear_extrude(bolt_l+2) piholder_screwholes(bolt_clearance_d);

        // brass inserts
        translate([0,0,1-threaded_insert_l]) linear_extrude(threaded_insert_l+1) piholder_screwholes(threaded_insert_d);
    }
}

// https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/README.md
// origin top left of page, bottom left of pi (pi rotated 180)
module pi_screwholes(d) {
    translate([-3.5,-3.5]) circle(d=d);
    translate([-3.5,-3.5-49]) circle(d=d);
    translate([-3.5-58,-3.5]) circle(d=d);
    translate([-3.5-58,-3.5-49]) circle(d=d);
}

//t=8;
//translate([0,0,t+1]) mirror([0,0,1]) linear_extrude(threaded_insert_l+1) pi_screwholes(threaded_insert_d);

module pi() {
    difference() {
        linear_extrude(1.4) rounded_square(85,56,3.0);
        translate([0, 0,-50]) linear_extrude(100) pi_screwholes(bolt_clearance_d);
    }
}

// shelf to put Pi on. origin at lower left, not center
// TODO chamfer against panel
module pi_shelf() {
    t=8;
    c=3;
    difference() {
        rotate([90,0,90]) linear_extrude(piholder_w) polygon([
            [0,0],
            [0,t+c],
            [c,t],
            [piholder_d,t],
            [piholder_d,0],
            [0,0],
        ]);

        translate([piholder_w,piholder_d,t+0.01]) {
            translate([0,0,-threaded_insert_l])
                linear_extrude(threaded_insert_l)
                pi_screwholes(threaded_insert_d);
            translate([0,0,-bolt_l])
                linear_extrude(bolt_l)
                pi_screwholes(bolt_d);
        }
    }
}
