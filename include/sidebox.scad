sidebox_xt = 3;
sidebox_yt = 3 + threaded_insert_d;

module sidebox(internal_w,d=50) mirror([0,0,1]) {
    difference() {
        // main box
        linear_extrude(d-sidebox_xt)
            square([internal_w+2*sidebox_xt,rack_h], center=true);

        // cavity
        translate([0,0,sidebox_xt])
            linear_extrude(d)
            square([internal_w,rack_h-2*sidebox_yt], center=true);

        // threaded insert holes
        translate([0,0,d-sidebox_xt-threaded_insert_l+0.01])
            linear_extrude(threaded_insert_l)
            sidebox_screwholes(internal_w, threaded_insert_d);

        // bolt holes
        translate([0,0,d-sidebox_xt-bolt_l+0.01])
            linear_extrude(bolt_l)
            sidebox_screwholes(internal_w, bolt_clearance_d);
    }
}

module sidebox_lid(internal_w) {
    linear_extrude(sidebox_xt)
        difference() {
            square([internal_w+2*sidebox_xt,rack_h], center=true);
            sidebox_screwholes(internal_w, bolt_clearance_d);
        }
}

module sidebox_screwholes(internal_w, d) {
    y = rack_h/2 - sidebox_yt/2;
    x = internal_w/2;

    for (
        l = [
            [ x, y],
            [-x, y],
            [ x,-y],
            [-x,-y],
        ]
    ) translate(l) circle(d=d);
}
