d_kulso = 52;
d_belso = 25;
hossz = 100;
h_atlapolas = 30;

apa();
//anya();

module cso(H=hossz){
        difference(){
        union(){
            cylinder(d=d_kulso, h=H, $fn=6*d_kulso);
            translate([0,0,H-5])cylinder(d=d_kulso+5, h=5, $fn=6*(d_kulso+5));
        }
        translate([0,0,-.5])cylinder(d2=d_belso, d1=d_belso, h=H+1, $fn=6*d_belso);
    }
}


module anya(){
    difference(){
        cso();
        translate([0,0,-.1])cylinder(d1=d_belso+7, d2=d_belso+2, h=h_atlapolas, $fn=6*d_belso);
    }
}

module apa(){
    cso(H=50);
    translate([0,0,-h_atlapolas]){
        difference(){   
                cylinder(d2=d_belso+7, d1=d_belso+2,h=h_atlapolas, $fn=6*d_belso);
                translate([0,0,-.1])cylinder(d=d_belso,h=h_atlapolas+1, $fn=6*d_belso);
        }        
       
    }
}