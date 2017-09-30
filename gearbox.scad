$fn = 120;

module hole(r) {
    translate([0,4,0]) rotate ([90,0,0]) cylinder(5,r,r);
}

difference() {
    cube([47,3,25]);

    translate([13.5,0,12.5]) hole(4.2);
    translate([13.5,-2,12.5]) hole(6.9);
    translate([23.5,0,12.5]) hole(1.65);

    translate([33.5,0,12.5]) hole(3.65);
}
