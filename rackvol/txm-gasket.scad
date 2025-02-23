use </Users/naggie/ioterminal/bezel.scad>;
$fn = 200;

// for 6mm CS M3 screws leaving 2mm to penetrate
// 1mm margin
// TXM 015 module allows for 3mm penetration
// https://assets.tracopower.com/20180411085828/TXM/documents/txm-datasheet.pdf

difference() {
    // interference fit
    difference() {
        translate([-1, -1, 0]) cube([82, 54, 5]);
        translate([0, 0, 2.6]) cube([80, 52, 10]);
    }
    translate([8.5, 30.4, -1]) rounded_cube(63, 40, 10, 1.75);
    translate([8.5, -17.6, -1]) rounded_cube(63, 40, 10, 1.75);
    translate([11, 26.4, -1]) cylinder(h=10, d=3.8);
    translate([66, 26.4, -1]) cylinder(h=10, d=3.8);
}
