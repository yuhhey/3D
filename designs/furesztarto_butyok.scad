use <atis_lib.scad>


inset_first_layer(inset_height=0.31,inset_width=0.2){
    difference(){
        intersection(){
            cylinder(r1=7, r2=12, h=40, $fn=18*12);
            translate([0,0,15]) sphere(r=25, $fn=150);
        }
        cylinder(r=2,h=20,$fn=24);
    }
}