module plate() {
    difference() {
        // x=0 is centerline
        translate([0,-rack_h/2,0]) rack2u();

        // main power
        translate([35,20,0]) switch_cutout();

        // soft power
        translate([35,-20,0]) circle(d=16);

        translate([60,0,0]) display_cutout();
        translate([144,0,0]) knob_cutout();
        translate(dac_location) dac_cutout();

        // AUX switch
        translate([415,0,0]) circle(d=6);

        translate([445,0,0]) xlr_cutout();
    }
}
