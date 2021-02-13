// TODO sort out application of offsets
module display_cutout() {
    rounded_square(display_w,display_h, 1.5);
}

module pcb(margin=0) {
    difference() {
        translate(display_pcb_offset) offset(margin) square([display_pcb_w, display_pcb_h], center=true);
        display_screwholes(2.86-2*margin);
    }
}

module surround(margin=0) {
    translate(display_pcb_offset) offset(margin) square([display_pcb_h, display_pcb_w], center=true);
}

module display() mirror([0,0,1]) {
    color("#237a63") translate([0,0,2.9]) linear_extrude(1.1) pcb();
    color("#1c2854") linear_extrude(2.9) display_cutout();
}

// screw cut outs for front panel and brass inserts (hence variable R)
module display_screwholes(d) {
    hole_offset = 2.0;

    translate(display_pcb_offset) {
        translate([-display_pcb_w/2+hole_offset,-display_pcb_h/2+hole_offset]) circle(d=d);
        translate([-display_pcb_w/2+hole_offset, display_pcb_h/2-hole_offset]) circle(d=d);
        translate([ display_pcb_w/2-hole_offset, display_pcb_h/2-hole_offset]) circle(d=d);
        translate([ display_pcb_w/2-hole_offset,-display_pcb_h/2+hole_offset]) circle(d=d);
    }
}

module display_text()
    standard_text("PI DISPLAY", display_h);

module display_holder_negative() mirror([0,0,1]) {
    translate([0,0,2.9]) linear_extrude(20) pcb(0.2);
    // space for display + surround
    translate(display_pcb_offset) linear_extrude(2.901) square([display_pcb_w-10-0.2,display_pcb_h-1.5], center=true);
    // avoid solder connections
    translate(display_pcb_offset) linear_extrude(2.901) translate([-5,0]) square([display_pcb_w-9,display_pcb_h-20], center=true);
}

!display_holder_negative();
