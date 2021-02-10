module display(mode=NORMAL) {
    if (mode == NORMAL) {
        offset(1.5) offset(-1.5) square([display_w,display_h]);
    } else if (mode == CLEARANCE) {
        translate([0,-5]) square([72,43]);
    }
}

module display_negative() {
}

// display PCB clearance = 2.9mm, 1.1mm PCB thickness
