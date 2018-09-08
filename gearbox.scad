$fn = 120;

module hole(r) {
    translate([0,4,0]) rotate([90,0,0]) cylinder(5,r,r);
}

module tab() {
    difference() {
        cube([10,15,3]);
        hull() {
            translate([5,10,-1]) cylinder(5,2,2);
            translate([5,5,-1]) cylinder(5,2,2);
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

    // rebate joins
    // L rebate top
    translate([-3,0,0]) cube([3,3,25/3]);

    // R rebate top
    translate([66,0,0]) cube([3,3,25/3]);

    // L rebate bottom
    translate([-3,0,50/3]) cube([3,3,25/3]);

    // R rebate bottom
    translate([66,0,50/3]) cube([3,3,25/3]);
}

module sides() {
    difference() {
        translate([-3,3,0]) cube([3,27,25]);
        // zip tie mounting point for oled cables
        translate([-4,15,2]) cube([5,4,2]);
    }

    difference() {
        translate([66,3,0]) cube([3,27,25]);
        // zip tie mounting point for oled cables
        translate([65,15,2]) cube([5,4,2]);
    }

    // rebate joins
    translate([-3,0,25/3]) cube([3,3,25/3]);
    translate([66,0,25/3]) cube([3,3,25/3]);
}

module front() {
    translate([0,27,0]) {
        difference() {
            hull() {
                union() {
                    cube([66,3,25]);
                    // reinforcements for oled
                    translate([24,0,-3]) cube([35,3,3]);
                    translate([24,0,25]) cube([35,3,6]);
                    // screen seat
                    translate([26,-1,-0.5]) cube([30,3,30]);

                    // IR receiver holder
                    translate([68, -3, 2.5]) cube([12, 6, 20]);
                }

                // mount for switch
                translate([-17,0,12.5]) rotate([270,0,0]) cylinder(h=3,d=25);
            }
            // hole for switch
            translate([-17,0,12.5]) rotate([270,0,0]) translate([0,0,-1]) cylinder(h=5,d=17.5);

            // bearing seat
            translate([18.5,0,12.5]) hole(3.8);
            translate([18.5,-2,12.5]) hole(6);

            // OLED screen
            translate([28,-1,6]) cube([26,5,13]);
            translate([27,-3,0.5]) cube([28,5,28]);

            // hole to mount IR receiver
            translate([72, -6, 4.5]) cube([6, 8, 12]);
            translate([71.5, -6, 8.8]) cube([7, 8, 2.5]);
            translate([75, 0, 12.5]) rotate([270,0,0]) translate([0,0,-1]) cylinder(h=5,d=6);
        }
        // bearing seat
        translate([18.5,0,12.5]) {
            difference() {
                rotate([90,0,0]) cylinder(2,7,7);
                translate([0,1,0]) rotate([90,0,0]) cylinder(5,6,6);
            }
        }

        // cable mount for IR receiver
        translate([72, -17, 3]) cube([6, 20, 3]);

    }
}

module pcb() {
    // PCB holder
    translate([36,-73,22]) difference() {
        cube([45,73,3]);
        translate([5.5,3.5,-8]) {
            // standoff holes
            translate([0,0,0]) cylinder(10,r=1.55);
            translate([36,0,0]) cylinder(10,r=1.55);
            translate([36,56,0]) cylinder(10,r=1.55);
            translate([0,56,0]) cylinder(10,r=1.55);
        }
    }

    // PCB bracket
    translate([38,0,22]) rotate([180,90,0]) linear_extrude(2) polygon([[0,0],[15,0],[0,70]]);
}

difference() {
    front();
    // cut of buttom to clear folded metal
    translate([0, 0, 28]) cube([100, 100, 10]);
}
//
sides();
//color("gray") back();
