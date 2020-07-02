use <atis_lib.scad>
s = 2;
o = 2;
r = 55;
difference(){
    cube([s*r, o*r,30]);
    for(i = [0:s])
        for(f = [0:o])
            translate([r/2+i*r, r/2+f*r, 0]){
                translate([0,0,5])cylinder(r=20, h= 80, $fn=12*20);
                translate([0,0,5+19])cylinder(r=43/2, h= 80, $fn=12*43/2);
            }
}