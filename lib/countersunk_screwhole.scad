
module countersunk_screwhole(panel=18,head=8.5,shank=3.6,thread=2.5,length=35) {
    $fn=100;

    // fudge for manifold differences
    f = 0.01;

    // plug hole
    translate([0,0,panel-f])
        cylinder(h=250,r=head/2);

    // head
    translate([0,0,panel-head*0.762])
        cylinder(h=head*0.762,r1=0,r2=head/2);

    // shank
    translate([0,0,-f])
        cylinder(h=panel+f,d=shank);

    // thread hole (for remainder of screw to bite into)
    translate([0,0,-length+f])
        cylinder(d=thread,h=length);
}

countersunk_screwhole();
