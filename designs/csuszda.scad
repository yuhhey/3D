
//lepcsofok();

lf_m = 100;
lf_sz = 1200;
lf_mely = 290;
lf_n = 10;    
l_m = (lf_n - 1) * 160+lf_m;
l_y = (lf_n - 1) * lf_mely;


//lepcso(lf_mely,150, lf_n);
csuszda();
//Lejto();

module lepcsofok(){
    cube([lf_sz,lf_mely, lf_m]);
}

module lepcso(y_offset, z_offset, n){
    lepcsofok();  //legalso lepcsofokot mindig megrajzoljuk
    for (f = [1:n-1]){
        z = f*z_offset;
        y = f*y_offset;
        translate([0,y,z]) lepcsofok();
        echo("lepcso y, z:", y, z);
    }
    z = n * z_offset + lf_m;
    y = n * y_offset;
    echo("Hossz:",sqrt(y*y+z*z));
    for(f = [0:2]){
        translate([0, (n+f)*y_offset, (n-1)*z_offset])lepcsofok();
    } 
}

module valyu_lecekbol(l_v, fal_v_n, v_v, h, v_mag, v_mely){
    n_l = v_v/l_v;
    difference(){
        union(){
            for(l = [0:fal_v_n-1]){
                translate([0, l*l_v,0])cube([h, l_v, v_mag]);
                translate([0,v_v - l * l_v])cube([h, l_v, v_mag]);
            }
            
            for(l = [fal_v_n:n_l-fal_v_n]){
                translate([0, l*l_v,0])cube([h, l_v, v_mag-v_mely]);
            }
        }
        for(l = [1:2:n_l]){
            translate([0, l*l_v,0])cube([h*0.05, l_v, v_mag]);
        }
    }
}

module FelsoBeulo(){
    valyu_lecekbol(20, 3, 520, 600, 200, 160);    
}

module Lejto(){
    
    cs_felso_y = (lf_n - 1) * lf_mely;
    cs_felso_z = (lf_n - 1) * 160;
    tan_alfa = cs_felso_z/cs_felso_y;
    ctan_alfa = 1/tan_alfa;
    cs_h = sqrt(cs_felso_y * cs_felso_y + cs_felso_z * cs_felso_z)+100 * (1 + ctan_alfa);
    echo(cs_h);
    translate([0,-100 * ctan_alfa,0])rotate([atan(tan_alfa),0,0])rotate(90)valyu_lecekbol(20, 3, 520, cs_h, 200,150);
}

module csuszda(){
    translate([0, l_y-100, l_m])rotate(90)FelsoBeulo();
    Lejto();
    AlsoKifuto();

}

        