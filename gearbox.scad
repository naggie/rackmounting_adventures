$fn = 120;

module hole(r) {
    translate([0,4,0]) rotate([90,0,0]) cylinder(5,r,r);
}

module tab() {
    difference() {
        cube([10,15,3]);
        hull() {
            translate([5,10,-1]) cylinder(5,2.5,2.5);
            translate([5,5,-1]) cylinder(5,2.5,2.5);
        }
    }
}


module back() {
    difference() {
        cube([66,3,25]);

        // log pot interface
        translate([18.5,0,12.5]) hole(4.2);
        translate([18.5,-2,12.5]) hole(6.9);
        translate([28.5,0,12.5]) hole(1.8);

        // lin pot hole
        translate([48.5,0,12.5]) hole(3.65);
        // lin pot locating leg
        translate([56.25,0,12.5]) translate([0,2,0]) cube([1.5,5,2.7],true);
    }

    // feet
    translate([-8,0,-8.39]) cube([10,3,8.39]);
    translate([59,0,-8.39]) cube([10,3,8.39]);

    // rebate joins
    // L
    translate([-3,0,0]) cube([3,3,25/3]);
    translate([-3,0,50/3]) cube([3,3,25/3]);

    // R
    translate([66,0,0]) cube([3,3,25/3]);
    translate([66,0,50/3]) cube([3,3,25/3]);

    // left leg support
    translate([-8,3,0]) rotate([90,0,0]) linear_extrude(3) polygon([[0,0],[5,5],[5,0]]);

    // bolt fixing points
    translate([-8,-15,-8.39]) tab();
    translate([59,-15,-8.39]) tab();
}

module sides() {
    translate([-3,3,0]) cube([3,27,25]);
    translate([66,3,0]) cube([3,27,25]);

    // rebate joins
    translate([-3,0,25/3]) cube([3,3,25/3]);
    translate([66,0,25/3]) cube([3,3,25/3]);
}

module front() {
    translate([0,27,0]) {
        difference() {
            cube([66,3,25]);
            // bearing seat
            translate([18.5,0,12.5]) hole(3.8);
            translate([18.5,-2,12.5]) hole(6);
        }
        // bearing seat
        translate([18.5,0,12.5]) {
            difference() {
                rotate([90,0,0]) cylinder(2,7,7);
                translate([0,1,0]) rotate([90,0,0]) cylinder(5,6,6);
            }
        }
    }
}

//union(r=4) {
//    union() sides();
//    union() front();
//}
color("gray") back();
