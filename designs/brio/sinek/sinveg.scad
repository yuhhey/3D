use <../tracklib.scad>
$fs=0.5;
$fa=5;


sinveg();

module sinveg(){ //makeme
    difference(){
        union(){
            translate([0,0,0])intersection(){
                translate([0,2,2]) minkowski(){
                    cube([35, wood_width()-4, wood_height()-4]);
                    sphere(r=2);
                }
                cube([35, wood_width(), 2*wood_height()]);
            }
            translate([0,2,2])minkowski(){
                difference(){
                    cube([8, wood_width()-4,16+wood_height()]);
                    translate([-2,-2,14])rotate([0,-45,0])cube([32,42,42], center=false);        
                }
                sphere(r=2);
            }
        }
        translate([14,0,0])
            wood_rails(23, bevel_ends=false);
        translate([37,wood_width()/2,0]) rotate([0,0,180])wood_cutout();
        
    }
    translate([8, wood_width()/2, wood_height()*3/2]) sphere(r=wood_height()/2, center=true);
}