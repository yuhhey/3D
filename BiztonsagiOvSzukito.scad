$fn=100;
minkowski(){
    difference(){
        cube([150,80,2], center=true);
        translate([0,35,0])cube([30,20,3], center=true);
        translate([0,-35,0])cube([30,20,3], center=true);
        translate([0,20,0]) cube([110,20,3], center=true);
        translate([0,-20,0]) cube([110,20,3], center=true);
    }
    sphere(r=3);
}