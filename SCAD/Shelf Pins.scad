width=15;
holesize=6;
holedepth=10;
rotate(a=[90,0,90]) {
    translate([width/3,width/2,-holedepth])
    cylinder(h=holedepth, d=holesize, center=false, $fn=32);
}
linear_extrude(width) {
  polygon(points=[[0,0],[width,0],[0,width]]);
}