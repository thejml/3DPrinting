color("red")
    translate([0, 0, 0]) {
        union() {
            cylinder(h=5, r1=64, r2=62, true, $fn=96); 
            //62mm wide, 85mm high, 14.6mm post  
            cylinder(h=82, r=7.3, center=false, $fn=96);
            translate([0,0,82])
            cylinder(h=3, r1=7.3, r2=4, center=false, $fn=96);
        } 
    }