use  <atis_lib.scad>;

//egyenes_2lyukas_benchdog();

//derekszogu_3lyukas_benchdog();

//beallito_blokk(37);

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
    inset_first_layer(inset_height=0.31,inset_width=0.5, render=true)
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

//körfűrész beállító blokk
module beallito_blokk(meret)
{
    difference(){
        inset_first_layer(inset_height=0.31,inset_width=0.5, render=true) cube([190, 85, meret]);
        // tapasztalatom szerint a vágás végére 0.5-1mm-rel keskenyebbet vág a körfűrészem, mint a kocka vastagsága
        translate([95,1.9, meret/2])rotate([90,0,0])linear_extrude(height=2)text(text=str(meret-1,"mm"), font="Purisa:style=bold", size=16, halign="center", valign="center");
    }
}


eNnedelo();
module eNnedelo(){
    l = 200;
    r = 5;
    w = 25;
    difference(){
        cube([l+4*r, w, 3],center = true);
        //cylinder(r=1, h= 5, center = true);
        for (n = [2:10]){
            translate([l*(1/2-1/n),0,0]){
                cylinder(r=0.75, h= 5, center = true);
                translate([0,7*pow(-1,n),-2])scale([0.5,1,1])linear_extrude(height=5)text(text=str("/",n), size=8, valign="center");
                echo(20*pow(-1,n));
            }
            translate([l/2*(1-n)/10,0,])cylinder(r=1, h= 5, center = true);
        }
    }
    translate([-(l/2 + r),0,-9])cylinder(r = r, h = 10);
    translate([(l/2 + r),0,-9])cylinder(r = r, h = 10);
}