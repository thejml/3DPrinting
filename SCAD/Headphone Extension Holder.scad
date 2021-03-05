//// CONFIGURATION ////
width=15;
length=38.5;
plugSize=11.3;
wireSize=3.5;

//// DERIVED VARS ////

// Add 1.5mm of material on either side of the holes
totalLength=length+2;

difference() {
  union() {
    translate([0,0,0])
      cube([width,width,length],center=false);
//      cylinder(h=width,d=height,center=false);
//    translate([(holes)*spacing,height/2,0])
//      cylinder(h=width,d=height,center=false);
  }
  union() {
//    for(x =[0 : 1 : holes-1]) {
    translate([width/2,width/2,totalLength-length])
      cylinder(h=length,d=plugSize,center=false); 
    translate([width/2-wireSize/2,width/2-(wireSize/2),0])
      cube([width/2+wireSize/2,wireSize,totalLength],center=false);
   
//    }
  }
}