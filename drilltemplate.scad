$fn = 200;

// fudge to prevent z-fighting on preview
f = 0.01;

module guide(l=200) {
    h = 45;
    t = 2;
    d = 10;

    translate([0,-h/2-t,-d]) difference() {
        cube([l,h+t*2,d+t]);
        translate([-f,t,0-f]) cube([l+2*f,h,d]);
    }
}

guide();
