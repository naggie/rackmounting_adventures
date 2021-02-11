module display_cutout() {
    rounded_square(display_w,display_h, 1.5);
}

module display() mirror([0,0,1]) {
    difference() {
        color("#237a63") translate([0,0,2.9]) linear_extrude(1.1) translate(display_pcb_offset) square([display_pcb_w, display_pcb_h], center=true);
        translate([0,0,-250]) linear_extrude(500) display_screwholes(2.86);
    }
    color("#1c2854") linear_extrude(2.9) display_cutout();
}

module display_holder_negative() {

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
    standard_text("HIFIBERRY", display_h);
