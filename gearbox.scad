$fn = 120;

module hole(r) {
    translate([0,4,0]) rotate([90,0,0]) cylinder(5,r,r);
}


module back() {
    difference() {
        cube([66,3,25]);

        translate([18.5,0,12.5]) hole(4.2);
        translate([18.5,-2,12.5]) hole(6.9);
        translate([28.5,0,12.5]) hole(1.8);

        translate([48.5,0,12.5]) hole(3.65);

        translate([56.25,0,12.5]) translate([0,2,0]) cube([1.5,5,2.7],true);
    }

    // feet
    translate([0,0,-8.39]) cube([5,3,8.39]);
    translate([61,0,-8.39]) cube([5,3,8.39]);

    // rebate joins
    translate([-3,0,0]) cube([3,1.5,25]);
    translate([66,0,0]) cube([3,1.5,25]);

}

// 19.7 min, 21mm between back and front bearing with a margin
module sides() {
    translate([-3,1.5,0]) cube([3,27.5,25]);
    translate([66,1.5,0]) cube([3,27.5,25]);
}

module front() {
    // bearing seat
    translate([0,26,0]) {
        difference() {
            cube([66,3,25]);
            translate([18.5,0,12.5]) hole(3.8);
            translate([18.5,-2,12.5]) hole(6);
        }
        translate([18.5,0,12.5]) {
            difference() {
                rotate([90,0,0]) cylinder(2,7,7);
                translate([0,1,0]) rotate([90,0,0]) cylinder(5,6,6);
            }
        }
    }
}

back();

//union() {
//    sides();
//    front();
//}
