module plate(mode=NORMAL) {
    difference() {
        translate([0,-rack_h/2,0]) rack2u();

        // main power
        translate([35,20,0]) switch(mode);

        // soft power
        translate([35,-20,0]) circle(d=16);


        translate([57,-display_h/2,0]) display(mode);
        translate([144,0,0]) knob(mode);
        translate([dac_offset_x,0,0]) dac_cutout(mode);

        // AUX switch
        translate([415,0,0]) circle(d=6);

        translate([445,0,0]) xlr();
    }
}
