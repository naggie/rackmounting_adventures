$fn = 200;

difference() {
    cube([79, 51, 4]);
    translate([8, 29.4, -1]) cube([63, 40, 10]);
    translate([8, -18.6, -1]) cube([63, 40, 10]);
    translate([10.5, 25.4, -1]) cylinder(h=10, d=3.5);
    translate([65.5, 25.4, -1]) cylinder(h=10, d=3.5);
}
