use </Users/naggie/ioterminal/bezel.scad>;
$fn = 200;

// for 6mm CS M3 screws
// TXM 015 module allows for 3mm penetration
// https://assets.tracopower.com/20180411085828/TXM/documents/txm-datasheet.pdf

difference() {
    // interference fit
    difference() {
        translate([-1, -1, 0]) cube([81, 53, 5.6]);
        translate([0, 0, 4.6]) cube([79, 51, 10]);
    }
    translate([8, 29.4, -1]) rounded_cube(63, 40, 10, 1.75);
    translate([8, -18.6, -1]) rounded_cube(63, 40, 10, 1.75);
    translate([10.5, 25.4, -1]) cylinder(h=10, d=3.5);
    translate([65.5, 25.4, -1]) cylinder(h=10, d=3.5);
}
