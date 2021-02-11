// screw cut outs for front panel and brass inserts (hence variable R)
module piholder_screwholes(d) {
    x_offset = piholder_w/2-6.5;

    translate([-x_offset,-dac_screw_offset[1]]) circle(d=d);
    translate([-x_offset, dac_screw_offset[1]]) circle(d=d);
    translate([ x_offset, dac_screw_offset[1]]) circle(d=d);
    translate([ x_offset,-dac_screw_offset[1]]) circle(d=d);
}

module piholder_cutout() piholder_screwholes(bolt_clearance_d);
