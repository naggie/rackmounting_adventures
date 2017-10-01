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
//

module logpotgear() {
    difference() {
        union() {
            cylinder(14.5,4.5,4.5);
            cylinder(34,3,3);

            gear (circular_pitch=350,
                gear_thickness = 4,
                rim_thickness = 4,
                hub_thickness = 4,
                bore_diameter = 6
                );
        }
        translate([0,0,-1]) cylinder(14,3.1,3.1);

        // air hole
        translate([0,0,-1]) cylinder(40,0.6,0.6);
    }
}

module linpotgear() {
    gear (circular_pitch=350,
        gear_thickness = 5,
        rim_thickness = 4,
        hub_thickness = 6,
        bore_diameter = 6.2
        );
}

//linpotgear();
//logpotgear();
