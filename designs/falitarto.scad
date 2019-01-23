use <atis_lib.scad>

ww=3.2;

csavar_fej_vastagsag=3;


macbook_pro();

//lenovo_tolto();

//macbook_pro();

//taviranyito_tarto();

//mirror()macbook_pro();

module macbook_pro(){  // make me
    falitarto(130, 80, 28,0,0,0,0,false);
}

module hp_tolto(){ // make me
    falitarto(128, 52, 32, 24, 31, 21,4, true);
}

module lenovo_tolto(){ // make me
    falitarto(109, 47, 30, 18, 23, 12,6, true);
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
            translate([0,csavar_fej_vastagsag,ww])
                cube([belso_w, belso_d, belso_h+5*ww]);
            translate([0,ww+csavar_fej_vastagsag,2*ww])rotate([0,-atan((belso_h-ww)/belso_w),0])cube([sqrt(belso_w*belso_w+belso_h*belso_h)+2*ww,belso_d+1,belso_h]);
        }
        else{
            translate([-ww,csavar_fej_vastagsag,ww])
                cube([belso_w+ww, belso_d, belso_h+5*ww]);
            translate([-ww,ww+csavar_fej_vastagsag,ww])rotate([0,-atan(belso_h/(belso_w+ww)),0])cube([sqrt(belso_w*belso_w+belso_h*belso_h)+2*ww,belso_d+1,belso_h]);
        }
        translate([-ww,ww+csavar_fej_vastagsag,2*ww])cube([ww,belso_d,belso_h]);

        
        
        for(x=[(belso_w+2*ww)/4, (belso_w+2*ww)*3/4]){
            translate([x,0,(belso_h+2*ww)/2])rotate([-90,0,0]){
                r_csavar=2.5;
                translate([0,0,-2*ww])cylinder(r=r_csavar, h=belso_d+4*ww+csavar_fej_vastagsag, $fn=12*r_csavar);
                translate([0,0,0.012])cylinder(r=1.9*r_csavar, h=csavar_fej_vastagsag, $fn=1.9*r_csavar*12);
            }
        }
        translate([belso_w-1, cs_y + csavar_fej_vastagsag, cs_z+ww])cube([2*ww, cs_w, cs_h]);
    }
}






module taviranyito_tarto(){ // make me
    ww=3;
    gr=1;
    sz = 55;
    m = 25;
    h = 70;

    ksz=sz+2*ww-2*gr;
    km=m+2*ww-2*gr;
    kh=h+ww;

    difference(){
        minkowski()
        {
            difference(){
                
                cube([ksz, km, kh], center=true);
                translate([0,-ww+2*gr,ww+35])cube([ksz,km,h],center=true);
                translate([0,0,ww])cube([sz+2*gr,m+2*gr,h+2*gr],center=true);
                translate([0,m/2,ww])rotate([90,0,0])cylinder(r=sz/2+gr,h=m+ww, $fn=12*sz/2);
            }
            sphere(r=gr, $fn=gr*12);
        }
        for(z = [-h/4,h/4]){
            translate([0,km/2+gr,z])rotate([0,-90,90]){
                kivagas(13,4,ww);
                cylinder(r=4,h=ww, $fn=12*4);
            }
        }
    }
}