//// CONFIGURATION In mm////
width=40;
baseThickness=1;
supportGap=20;
supportWidth=8;
length=120;
supportThickness=6;

//// DERIVED VARS ////

//difference() {
  union() {
    translate([0,0,0]) {
      cube([width,baseThickness,length],center=false);
    }
    for(x =[0 : 1 : width/supportGap]) {
      translate([x*supportGap,0,0]) {
        cube([supportWidth,supportThickness,length],center=false);  
      }
    }
//    translate([supportLength-deskDepth,deskThickness,0]) {
//        cube([deskDepth,supportThickness,width],center=false); 
//    } 
  }
//  union() {
//    translate([x*spacing+(spacing/2),height/2,0])
//      cylinder(h=width+.1,d=shaftSize,center=false);    
//  }

//}gt