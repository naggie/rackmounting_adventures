module rounded_square(x,y,r) {
    offset(r) offset(-r) square([x,y], center=true);
}

// h = height of thing it's under
module standard_text(msg,h=0)
    color("#fff")
    translate([0,-h/2-6])
    text(
        text=msg,
        font="Helvetica Neue:style=Regular",
        size=2,
        halign="center"
    );
