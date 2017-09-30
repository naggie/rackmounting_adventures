// http://www.thingiverse.com/thing:3575
use <parametric_involute_gear_v5.0.scad>

$fn =120;

// original
//gear (circular_pitch=350,
//	gear_thickness = 5,
//	rim_thickness = 7,
//	hub_thickness = 10,
//    bore_diameter = 6
//    );
//
difference() {
    union() {
        cylinder(14.5,4.5,4.5);
        cylinder(32,2.8,2.8);

        gear (circular_pitch=350,
            gear_thickness = 4,
            rim_thickness = 4,
            hub_thickness = 4,
            bore_diameter = 6
            );
    }
    cylinder(13,3.2,3.2);
}
