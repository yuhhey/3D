
kicsi_vesok();
//nagy_vesok();






module kicsi_vesok(){
    vesok(1);
}

module nagy_vesok(){
    vesok(n=0);
}

module vesok(n = 0){
    //nyélátmérő: 36-40mm
    helyek = [[19,11,25, 5,52,10, 5+52/2], //50mm
           [19,11,25, 5,39,10, 5+52/2], //38mm
           [19,11,25, 5,34, 9, 5+52+10+20], //32mm
           [19,11,25, 5,26,10, 5+52+10+20], //25mm
           [19,11,25, 5,19,10, 5+52+10+40+10+20],//18mm
           [19,10,25, 5,13, 9, 5+52+10+40+10+20], //12mm
           [19, 8,25, 5, 7, 7, 5+52+10+40+10+40+10+20],//6mm
           [19, 9,25, 5, 3, 8, 5+52+10+40+10+40+10+20] //3mm
    ];
    difference(){
        
        minkowski(){
            r=2;
            translate([r,r,r])cube([205-2*r,40-r,25-2*r]);
            difference(){
                sphere(r=r);
                translate([0,r,0])cube([2*r, 2*r, 2*r], center=true);
            }
        }
        translate([63.5,0,12.5])rotate([-90,0,0])rogzito_furat();
        translate([163,0,12.5])rotate([-90,0,0])rogzito_furat();
        x = 0;
        for(i = [n:2:len(helyek)]){
            h = helyek[i];
            translate([h[6],20,0])vesohely(h[0]/2,h[1]/2,h[2],h[3],h[4],h[5]);
        }
    }
}

module rogzito_furat(){
    cylinder(r=2.75, h=100, $fn=12*2.5);
    translate([0,0,-1])cylinder(r=5, h=20, $fn=12*5);
}

module vesohely(r_felso, r_also, h_teljes, h_egyenes, w, th){
    nyak(r_felso, r_also, h_teljes, h_egyenes);
    translate([0,0, h_teljes/2])cube([w, th , h_teljes], center=true);
}

module nyak(r_felso, r_also, h_teljes, h_egyenes){
    translate([0, 0, h_egyenes])cylinder(r2=r_felso, r1=r_also, h = h_teljes-h_egyenes, $fn=r_also*12);
    cylinder(r=r_also, h = h_egyenes, $fn=r_also*12);
}