use <gears/gear.scad>;
use <gearbox.scad>;

union() {
    sides();
    front();
}
color("gray") back();

color("green") {
    translate([18.5,9,12.5]) rotate([270,0,0]) logpotgear();
    translate([48.5,13,12.5]) rotate([90,0,0]) linpotgear();
}

color("gray") pcb();
