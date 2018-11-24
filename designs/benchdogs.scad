use  <atis_lib.scad>;

//egyenes_2lyukas_benchdog();
inset_first_layer(inset_height=0.31,inset_width=0.5, render=true){
translate([0,0,4.5]){hengeres_elem();
translate([50,0,0])hengeres_elem(12);
}
}

//derekszogu_3lyukas_benchdog();

module hengeres_elem(r_kulso=9.5, r_rugo=2){
    translate([10-r_kulso/2,0,0])cube([20+r_kulso,40,9], center=true);
    translate([0,0,4.5])difference(){
        cylinder(r=r_kulso,h=30, $fn=r_kulso*12);
        translate([0,0,10])cylinder(r=r_rugo,h=250, $fn=r_rugo*12);
        translate([-r_kulso,0,4])cylinder(r=r_rugo,h=50, $fn=r_rugo*12);
        translate([-r_kulso,0,4])rotate([0,90,0])cylinder(r=r_rugo,h=50, $fn=r_rugo*12);                        
    }
}
module egyenes_2lyukas_benchdog(){ // makeme
    //inset_first_layer(inset_height=0.31,inset_width=0.5, render=true)
    {
        translate([0,12.5,0]){
            hengeres_elem();
        }
        translate([100,12,0])rotate(180)hengeres_elem(r_kulso=12, r_rugo=2);
        translate([0,12,0]) cylinder(r=12,h=9, $fn=12*12.5);
        linear_extrude(height=9) polygon(points=[[0,24],[100,24],[100,0], [0,0],[0,26]]);
    }
}

module derekszogu_3lyukas_benchdog(){ // makeme
    translate([0,-12.5,0])egyenes_2lyukas_benchdog();
    rotate(90)translate([0,-12.5,0])egyenes_2lyukas_benchdog();
}