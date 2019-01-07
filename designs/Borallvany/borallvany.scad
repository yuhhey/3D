use <../atis_lib.scad>
use <allvany_lib.scad>
//minden adat mm-ben

anyagvastagsag = 20;
vastagsag=20;
r_uveg = 45;
h_uveg = 350;
h_uveghely = ceil(2*r_uveg)+anyagvastagsag;
rasztermeret = ceil(2*r_uveg)+anyagvastagsag;
echo(rasztermeret);

//nyolcszornyolcas();

module hatszogbelseju()({
translate([-430*sin(30),0, -430*cos(30)])
rotate([90,0,0])hatszog();
keret(8*rasztermeret+anyagvastagsag, 8*rasztermeret + 3*anyagvastagsag, h_uveg, anyagvastagsag, "8x8");
}

module uvegtarto(){
    deszka(20,h_uveg-anyagvastagsag, anyagvastagsag, anyagvastagsag,"v_tartóléc");
}

module uvegtartok(){
    uvegtarto();
    translate([rasztermeret-2*anyagvastagsag,0,0]) uvegtarto();
}


module uvegtartooszlop(n){
    for(i =[0:n-1]){
        translate([0,0,i*(rasztermeret)]) uvegtartok();
    }   
}


module nyolcszornyolcas(){
    keret(8*rasztermeret+anyagvastagsag, 8*rasztermeret + 3*anyagvastagsag, h_uveg, anyagvastagsag, "8x8");
    
    translate([0, -anyagvastagsag/2,0]){
        translate([-(8*rasztermeret-anyagvastagsag)/2,0, anyagvastagsag])uvegtartomatrix(8,4);
        deszka(8*rasztermeret, h_uveg-anyagvastagsag, anyagvastagsag, anyagvastagsag, "8x8 - középső polc");
        translate([-(8*rasztermeret-anyagvastagsag)/2,0, anyagvastagsag-4*rasztermeret-anyagvastagsag])uvegtartomatrix(8,4);
    }
    
}

module uvegtartomatrix(n_x, n_z){
    
    h_tarto = rasztermeret*n_z; // ez talán függvényesíthető
    z_tarto = h_tarto/2-anyagvastagsag/2;
    sz_teljes = n_x*(rasztermeret)+anyagvastagsag;
    translate([anyagvastagsag/2,0,0]){
        for(i = [0:n_x-2]){
            translate([i*(rasztermeret),0,0]){
                uvegtartooszlop(n_z);
                y_tarto = (h_uveg)/2-anyagvastagsag;
                for(y = [-y_tarto, y_tarto]){
                    translate([rasztermeret-anyagvastagsag, y,z_tarto]) deszka(anyagvastagsag,anyagvastagsag, h_tarto, anyagvastagsag, "f_tartóléc");
                }     
            }
            translate([(n_x-1)*(rasztermeret),0,0])
                uvegtartooszlop(n_z);
        }
             //#translate([sz_teljes-2*anyagvastagsag,0,z_tarto])deszka(anyagvastagsag, h_uveg, h_tarto);
    }
}

module keret(w, h, d, av, l){
    echo(w,h,d,av,l);
    w1 = (w - av)/2;
    h1 = (h - av)/2;
    rotate([90,0,0]){
        //bal oldal
        translate([-w1, 0,0])deszka(av,h,d,av, l);
        //jobb oldal
        translate([w1,0,0])deszka(av,h,d,av, l);
        //teteje
        wv=w-2*av;
        translate([0,h1,0])deszka(wv, av,d, av, l);
        //alja
        translate([0,-h1,0])deszka(wv, av,d, av, l);
        //hátlap
        translate([0,0, -(d-av)/2])deszka(w-2*av,h-2*av,av, av, l);
    }
}

module uveg_model(){
    cylinder(r=r_uveg,h=h_uveg);
}