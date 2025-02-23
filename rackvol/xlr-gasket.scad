$fn = 200;


module gasket(count=6, height=3, spacing=30) {
    difference() {
        hull() {
            cylinder(h=height, d=35);
            translate([0, spacing*(count-1), 0]) cylinder(h=height, d=35);
        }
        for (i = [0:count-1]) {
            translate([0, i*spacing, -1]) cylinder(h=height+2, d=25);
            translate([0, i*spacing, -1]) rotate([0, 0, 45]) translate([0, 15, 0]) cylinder(h=height+2, d=3);
            translate([0, i*spacing, -1]) rotate([0, 0, 225]) translate([0, 15, 0]) cylinder(h=height+2, d=3);
        }
    }

}

gasket();
