$fn = 200;


module gasket(count=6, height=4, spacing=30) {
    difference() {
        hull() union() for (i = [0:count]) {
            translate([0, i*spacing, 0]) cylinder(h=height, d=35);
        }
        for (i = [0:count]) {
            translate([0, i*spacing, -1]) cylinder(h=height+2, d=25);
            translate([0, i*spacing, -1]) rotate([0, 0, 45]) translate([0, 15, 0]) cylinder(h=height+2, d=3);
            translate([0, i*spacing, -1]) rotate([0, 0, 225]) translate([0, 15, 0]) cylinder(h=height+2, d=3);
        }
    }

}

gasket();
