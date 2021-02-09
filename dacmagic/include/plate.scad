module plate() {
    difference() {
        translate([0,-rack_h/2,0]) rack2u();

        // main power
        translate([35,20,0]) switch();

        // soft power
        translate([35,-20,0]) circle(d=16);


        translate([57,-display_h/2,0]) display();
        translate([144,0,0]) knob();
        translate([dac_offset_x,0,0]) dac_cutout();

        // AUX switch
        translate([415,0,0]) circle(d=6);

        translate([445,0,0]) xlr();
    }
}
