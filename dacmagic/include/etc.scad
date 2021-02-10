module rounded_square(x,y,r) {
    offset(r) offset(-r) square([x,y], center=true);
}
