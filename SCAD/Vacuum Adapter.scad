echo(version=version());
// 35mm & 32.6mm, each 30mm tall
// simple 2D -> 3D extrusion of a rectangle
color("red")
    translate([0, 0, 0])
        linear_extrude(height = 30) {
            difference() {
                circle(38/2,$fn=80);
                circle(35/2,$fn=80);
            }
        }
    translate([0, 0, 30])
        linear_extrude(height = 30) {
            difference() {
                circle(38/2,$fn=80);
                circle(32.6/2,$fn=80);
            }
        }