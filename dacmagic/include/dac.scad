module dac_bracket() mirror([0,0,1]) {
    margin=0.2;

    difference() {
        // main shape
        hull() {
            linear_extrude(30) offset(3) rounded_square(dac_case_w, dac_case_h, dac_case_r);
            linear_extrude(5) rounded_square(dac_case_w, dac_case_h+30, dac_case_r);
        }

        // dac cut through
        translate([0,0,-500]) linear_extrude(1000) rounded_square(dac_case_w+2*margin, dac_case_h+2*margin, dac_case_r+margin);

        // bezel cut through
        translate([0,0,-1]) linear_extrude(dac_bezel_t-panel_t+1) rounded_square(dac_bezel_w+2*margin, dac_bezel_h+2*margin, dac_bezel_r+margin);

        // bolt holes
        translate([0,0,-500]) linear_extrude(1000) dac_screwholes(bolt_clearance_d);

        // brass inserts
        translate([0,0,-1]) linear_extrude(threaded_insert_l+1) dac_screwholes(threaded_insert_d);
    }
}

// screw cut outs for front panel and brass inserts (hence variable R)
module dac_screwholes(d) {
    // gap applies positively vertically and negatively horizontally (where space is premium)
    gap=15;
    // left
    translate([-dac_bezel_w/2+gap,-dac_bezel_h/2-gap/2,0]) circle(d=d);
    translate([-dac_bezel_w/2+gap, dac_bezel_h/2+gap/2,0]) circle(d=d);
    translate([ dac_bezel_w/2-gap, dac_bezel_h/2+gap/2,0]) circle(d=d);
    translate([ dac_bezel_w/2-gap,-dac_bezel_h/2-gap/2,0]) circle(d=d);
}

// dac parts center referenced as many concentric parts
module dac_cutout() {
    margin = 1.0;
    rounded_square(dac_bezel_w+2*margin,dac_bezel_h+2*margin,dac_bezel_r+margin);
    dac_screwholes(bolt_clearance_d);
}

module dac() color("#333") mirror([0,0,1]) {
    linear_extrude(dac_bezel_t) rounded_square(dac_bezel_w,dac_bezel_h,dac_bezel_r);
    linear_extrude(dac_d) rounded_square(dac_case_w,dac_case_h,dac_case_r);
}
