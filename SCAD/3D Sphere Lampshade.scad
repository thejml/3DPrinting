color("red")
  scale([1,1,0.75]){
    difference() {
        sphere(r=100,$fa=2);
        union() {
            sphere(r=98,$fa=2);
            translate([-400,-400,-400])
                cube([800,800,400], center = false);
        }
    }
  }