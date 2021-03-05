//// CONFIGURATION ////
width=45;
spacing=20;
shaftSize=6.8;
holes=6;

//// DERIVED VARS ////

// Add 1.5mm of material on either side of the holes
height=shaftSize+5;

difference() {
  union() {
    translate([0,height/2,0])
      cylinder(h=width,d=height,center=false);
    translate([(holes)*spacing,height/2,0])
      cylinder(h=width,d=height,center=false);
    cube([(holes)*spacing,height,width],center=false);
  }
  union() {
    for(x =[0 : 1 : holes-1]) {
      translate([x*spacing+(spacing/2),height/2,0])
        cylinder(h=width+.1,d=shaftSize,center=false);    
    }
  }
}