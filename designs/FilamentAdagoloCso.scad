d_kulso = 52;
d_belso = 25;
hossz = 100;


difference(){
    union(){
        cylinder(d=d_kulso, h=hossz, $fn=6*d_kulso);
        translate([0,0,hossz-5])cylinder(d=d_kulso+5, h=5, $fn=6*(d_kulso+5));
    }
    cylinder(d2=d_belso, d1=d_belso+10, h=hossz, $fn=6*d_belso);
}
