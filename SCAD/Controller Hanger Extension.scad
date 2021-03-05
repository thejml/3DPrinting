echo(version=version());
// 35mm & 32.6mm, each 30mm tall
// simple 2D -> 3D extrusion of a rectangle
color("red")
    translate([0, 0, 0])
        linear_extrude(height = 5) {
            difference() {
                square([53, 13], center = false);
                polygon ( points =
                    [[ 0, 0],
                    [ 0, 4],
                    [ 7, 4],
                    [ 4, 7],
                    [ 3, 7],
                    [ 3,10],
                    [10,10],
                    [10, 4],
                    [13, 0],
                    [ 0, 0]],

                convexity=10);
            }
        }