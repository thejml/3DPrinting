echo(version=version());

// simple 2D -> 3D extrusion of a rectangle
color("red")
    translate([0, 0, 0])
      difference() {
        cube(size = [97,100,10], center = false);
        union() {
          translate([15,0,0]) {
           // The lip
           cube(size = [67,80,6], center = false);
          }
           // The thing
          translate([20,0,0]) {
           cube(size = [58,73,120], center = false);
          }
          // screww holes
          translate([8,10,0])  { cylinder(h=20, r=2.5, center=false); }
          translate([8,10,5])  { cylinder(h=5, r1=2.5, r2=7, center=false); }
          translate([89,10,0]) { cylinder(h=20, r=2.5, center=false); }
          translate([89,10,5]) { cylinder(h=5, r1=2.5, r2=7, center=false); }

          translate([8,90,0])  { cylinder(h=20, r=2.5, center=false); }
          translate([8,90,5])  { cylinder(h=5, r1=2.5, r2=7, center=false); }

          translate([89,90,0]) { cylinder(h=20, r=2.5, center=false); }
          translate([89,90,5]) { cylinder(h=5, r1=2.5, r2=7, center=false); }
        }
    }