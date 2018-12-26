ww=3;

csavar_fej_vastagsag=4;

//lyuk a csatlakozónak


//egybe(cs_z = belso_h/2 - cs_h/2,
 //      cs_y = belso_d/2 - cs_w/2);

//hp_tolto();

lenovo_tolto();

module hp_tolto(){
    falitarto(127, 51, 31, 23, 30, 21,4, true);
}

module lenovo_tolto(){
    falitarto(108, 46, 29, 17, 22, 12,6, true);
}

module falitarto(belso_w=120,
               belso_h=80,
               belso_d=50,
               cs_w = 20,
               cs_h = 30,
               cs_z,
               cs_y,
               egybe=true)
{
    difference(){
        minkowski(){
            cube([belso_w, belso_d+csavar_fej_vastagsag, belso_h]);
            cylinder(r=ww, h=ww, $fn=12*ww);
        }
        if (egybe){
            translate([ww,ww+csavar_fej_vastagsag,2*ww])minkowski(){
                cube([belso_w-2*ww, belso_d-2*ww, belso_h+5*ww]);
                sphere(r=ww, $fn=12*ww);
            }
        }
        else{
            translate([-ww,ww+csavar_fej_vastagsag,2*ww])minkowski(){
                cube([belso_w, belso_d-2*ww, belso_h+5*ww]);
                sphere(r=ww, $fn=12*ww);
            }
        }
        translate([-ww,ww+csavar_fej_vastagsag,2*ww])cube([ww,belso_d,belso_h]);

        translate([0,ww+csavar_fej_vastagsag,2*ww])
        rotate([0,-atan(belso_h/belso_w),0])cube([sqrt(belso_w*belso_w+belso_h*belso_h)+2*ww,belso_d+1,belso_h]);
        for(x=[(belso_w+2*ww)/4, (belso_w+2*ww)*3/4]){
            translate([x,0,(belso_h+2*ww)/2])rotate([-90,0,0]){
                translate([0,0,-2*ww])cylinder(r=2.5, h=belso_d+4*ww+csavar_fej_vastagsag);
                translate([0,0,0.012])cylinder(r=6, h=csavar_fej_vastagsag);
            }
        }
        translate([belso_w-1, cs_y + csavar_fej_vastagsag, cs_z+ww])cube([2*ww, cs_w, cs_h]);
    }
}

module sarkos(){



}

