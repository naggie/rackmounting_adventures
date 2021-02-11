module rounded_square(x,y,r) {
    offset(r) offset(-r) square([x,y], center=true);
}

// h = height of thing it's under
module standard_text(msg,h=0)
    color("#fff")
    translate([0,-h/2-7])
    text(
        text=msg,
        font="Helvetica Neue:style=Regular",
        size=3,
        halign="center"
    );
