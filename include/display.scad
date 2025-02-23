// everything here is referenced to viewable display center
// TODO prefix all with display_, add to readme

// TODO move to main?
display_hole_d=2.86;
display_pcb_t=1.1;
display_surround_t=2.9;

module display_cutout() {
    rounded_square(display_w,display_h, 1.5);
}

module pcb() {
    translate(display_pcb_offset) square([display_pcb_w, display_pcb_h], center=true);
}

// screw cut outs for front panel and brass inserts (hence variable R)
module pcb_screwholes(d) {
    hole_offset = 2.0;

    translate(display_pcb_offset) {
        translate([-display_pcb_w/2+hole_offset,-display_pcb_h/2+hole_offset]) circle(d=d);
        translate([-display_pcb_w/2+hole_offset, display_pcb_h/2-hole_offset]) circle(d=d);
        translate([ display_pcb_w/2-hole_offset, display_pcb_h/2-hole_offset]) circle(d=d);
        translate([ display_pcb_w/2-hole_offset,-display_pcb_h/2+hole_offset]) circle(d=d);
    }
}

module display() mirror([0,0,1]) {
    difference() {
        color("#237a63") translate([0,0,2.9]) linear_extrude(display_pcb_t) difference() {
            pcb();
            pcb_screwholes(display_hole_d);
        }

        // TODO add surround
        color("#1c2854") linear_extrude(2.9) display_cutout();
    }
}

module display_text()
    standard_text("PI DISPLAY", display_h);

module display_holder_negative() mirror([0,0,1]) translate([0,0,-0.01]) {
    translate([0,0,display_surround_t]) difference() {
        // main cut out to place PCB in
        linear_extrude(20) offset(0.2) pcb();
        // stakes
        translate([0,0,-0.01]) linear_extrude(display_pcb_t+2) pcb_screwholes(display_hole_d-0.5);
    }

    // space for display + surround
    translate(display_pcb_offset) linear_extrude(display_surround_t+0.1) square([display_pcb_w-9.5,display_pcb_h-1.5], center=true);
    // avoid solder connections
    translate(display_pcb_offset) linear_extrude(display_surround_t+0.2) translate([-5,0]) square([display_pcb_w-9,display_pcb_h-20], center=true);
}

//!display_holder_negative();
