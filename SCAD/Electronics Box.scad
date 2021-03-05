difference() {
  cube([190.5,89,26]);
  translate([0,0,3])
    union() {
      cube([35,55,24]);
      translate([38,0,0])
        cube([190.5,55,24]);
      translate([0,58,0])
        cube([71,28,24]);
      translate([74,58,0])
        cube([42.5,28,24]);
      translate([119.5,58,0])
        cube([71,28,24]);
    }
}