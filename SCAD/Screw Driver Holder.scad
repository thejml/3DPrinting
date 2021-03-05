//// CONFIGURATION In mm////
numColumns=4;
numRows=3;

baseHeight=70;
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
        translate([0,0,x*centerSpacing*2]) {
          cube([totalWidth,baseHeight+(x*stepHeight),centerSpacing*2]
            ,center=false);  
        }
      }
    }
  }
  union() {
    translate([0,0.01,0]) {
      for(x =[0 : 1 : numRows-1]) {
        for(y =[0 : 1 : numColumns-1]) {
          translate([y*holeSpacing+centerSpacing,baseHeight+stepHeight*x,x*centerSpacing*2+centerSpacing]) {
            rotate([90,0,0]) {
              // Large Hole
              cylinder(h=holeDepth,d=holeSize,center=false,$fn=36);
              // Bump at bottom of handle where rod meets
              cylinder(h=holeDepth+bumpDepth,d=bumpSize,center=false,$fn=36);
              // Guide Cone
              translate([0,0,holeDepth+bumpDepth]) {
                cylinder(h=guideDepth,d1=bumpSize,d2=centerHoleSize,center=false,$fn=36); 
              }
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
                cylinder(h=2+numRows*centerSpacing*2,d=holeSize,center=false);
              //}      
            }
          }
          for(y =[0 : 1 : numRows-1]) {
            translate([-1,x*holeSpacing+centerSpacing,y*holeSpacing+centerSpacing]) {
              rotate([0,90,0]) {
                cylinder(h=2+holeSpacing*numColumns*2+centerSpacing,d=holeSize,center=false,$fn=36);
              }      
            }
          }
        }
      }
    }
  }
//  union() {
//    translate([x*spacing+(spacing/2),height/2,0])
//      cylinder(h=width+.1,d=shaftSize,center=false);    
//  }

}