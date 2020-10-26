use <atis_lib.scad>

//csatlakozo([45,60,80,5,25,15]);

uloke_elem();

module uloke_elem(){
    difference(){
        cube([400,400,100], center=true);
        for (sz = [0:90:270]){
            rotate(sz){
                translate([200,200,0])rotate(45){
                    cube(100, center=true);
                    translate([-74,0,-10])rotate(180)csatlakozo([50,70,80,30,35,15]);
                }
            }
        }
    }
}