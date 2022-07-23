use <atis_lib.scad>;

lyuk_atmero = 115;

r_n = lyuk_atmero/2 + 2;
r_k = lyuk_atmero/2 - 2;


module dugo(){
    gyuru_fixrb(r_n,r_k, 40,50);
    translate([0,0,-2])cylinder(r=r_n, h=2, $fn = 12*r_n);
}

rotate([180,0,90])foglalat();

module foglalat(){
    difference(){
        cube(shelly1L_befoglalo()+[4,1.5,1.5]);
        translate([2, 1.5, 1.5 ])shelly1L();
    }
}