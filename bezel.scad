$fn = 120;

module hole(r=4) {
    translate([0,4,0]) rotate ([90,0,0]) cylinder(5,r,r);
}

difference() {
    cube([50,3,25]);
    translate([12.5,0,12.5]) hole();
    translate([37.5,0,12.5]) hole();
}
