//// CONFIGURATION In mm////
width=20;
deskDepth=60;
supportLength=150;
deskThickness=27;
supportThickness=5;

//// DERIVED VARS ////

//difference() {
  union() {
    translate([0,0-supportThickness,0]) {
      cube([supportLength,supportThickness,width],center=false);
    }
    translate([supportLength-deskDepth,0,0]) {
      cube([supportThickness,deskThickness,width],center=false);  
    }
    translate([supportLength-deskDepth,deskThickness,0]) {
        cube([deskDepth,supportThickness,width],center=false); 
    } 
  }
//  union() {
//    translate([x*spacing+(spacing/2),height/2,0])
//      cylinder(h=width+.1,d=shaftSize,center=false);    
//  }

//}gt