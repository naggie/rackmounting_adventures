module sidebox(internal_w,d=50) mirror([0,0,1]) {
    t=3;
    tt = 3 + threaded_insert_d;
    difference() {
        linear_extrude(d-t)
            square([internal_w+2*t,rack_h], center=true);

        translate([0,0,t])
            linear_extrude(d)
            square([internal_w,rack_h-2*tt], center=true);

        // threaded insert holes
        translate([0,rack_h/2-tt/2,d-t-threaded_insert_l+0.01])
            linear_extrude(threaded_insert_l)
            circle(d=threaded_insert_d);

        translate([0,-rack_h/2+tt/2,d-t-threaded_insert_l+0.01])
            linear_extrude(threaded_insert_l)
            circle(d=threaded_insert_d);

        // bolt holes
        translate([0,rack_h/2-tt/2,d-t-bolt_l+0.01])
            linear_extrude(bolt_l)
            circle(d=bolt_clearance_d);

        translate([0,-rack_h/2+tt/2,d-t-bolt_l+0.01])
            linear_extrude(bolt_l)
            circle(d=bolt_clearance_d);
    }
}

module sidebox_lid(internal_w) {
    t=3;
    tt = 1.5*t + threaded_insert_d;
    difference() {
        linear_extrude(t)
            square([internal_w+2*t,rack_h], center=true);

        // CSK screw holes (TODO countersink with countersunk_screwhole or convert to M3)
        translate([0,rack_h/2-tt/2,-0.01])
            linear_extrude(100)
            circle(d=bolt_clearance_d);

        translate([0,-rack_h/2+tt/2,-0.01])
            linear_extrude(100)
            circle(d=bolt_clearance_d);
    }
}

//module sidebox_screwholes(d) {
//    for (
//        l = [
//            [],
//        ]
//    ) translate(l) circle(d=d);
//}
