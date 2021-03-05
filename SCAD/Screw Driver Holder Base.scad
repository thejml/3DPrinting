//// CONFIGURATION In mm////
numColumns=4;
numRows=3;

baseHeight=40;
stepHeight=10;

holeSize=14;
holeSpacing=20;
holeDepth=25;
centerHoleSize=4;
bumpSize=9;
bumpDepth=2.5;
guideDepth=5;

speedHoles=1;

//// DERIVED VARS ////

centerSpacing=holeSpacing/2;
totalWidth=holeSpacing*(numColumns);
totalDepth=holeSpacing*(numRows);

difference() {
  union() {
    translate([0,0,0]) {
      for(x =[0 : 1 : numRows-1]) {
        translate([0,0,x*holeSpacing]) {
          cube([totalWidth,baseHeight,holeSpacing]
            ,center=false);  
        }
      }
    }
  }
  union() {
    translate([0,0,0]) {
      for(x =[0 : 1 : numRows-1]) {
        for(y =[0 : 1 : numColumns-1]) {
          translate([y*holeSpacing+centerSpacing,baseHeight+stepHeight*x,x*centerSpacing*2+centerSpacing]) {
            rotate([90,0,0]) {
              // Rod through hole
              cylinder(h=(baseHeight+x*stepHeight),d=centerHoleSize,center=false,$fn=36);
            }      
          }
        }
      }
      if (speedHoles==1) {
        // Cut some circles for less filament usage
        for(x =[0 : 1 : ((baseHeight)/holeSpacing-1)]) {
          for(y =[0 : 1 : numColumns-1]) {
            translate([y*holeSpacing+centerSpacing,x*holeSpacing+centerSpacing,-1]) {
              //rotate([0,0,0]) {
                cylinder(h=2+numColumns*centerSpacing*2,d=holeSize,center=false);
              //}      
            }
          }
          for(y =[0 : 1 : numRows-1]) {
            translate([-1,x*holeSpacing+centerSpacing,y*holeSpacing+centerSpacing]) {
              rotate([0,90,0]) {
                cylinder(h=2+holeSpacing*numRows+centerSpacing*2,d=holeSize,center=false,$fn=36);
              }      
            }
          }
        }
      }
    }
  }
}