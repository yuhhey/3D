use <../atis_lib.scad>
use <allvany_lib.scad>
//minden adat mm-ben

anyagvastagsag = 20;
vastagsag=20;
r_uveg = 40;
max_r_uveg = 45;
h_uveg = 400-anyagvastagsag;
h_uveghely = ceil(2*max_r_uveg)+anyagvastagsag;
rasztermeret = ceil(2*max_r_uveg)+anyagvastagsag;

//rotate(45)cylinder(r1=5*sqrt(2),r2=0, h=5, $fn=4);
//mirror([0,0,1])rotate(45)cylinder(r1=5*sqrt(2),r2=0, h=5, $fn=4);

//translate([20,0,20])uvegtartooszlop(4);

difference()
{
    union(){
        translate([10,0,440-20])rotate([90,0,0])cube([40,40,360], center=true);
        translate([880-200, 0, 440-20])rotate([90,0,0]) cube([60,40,360], center=true);
    }
    hezagos_keret(880,880,360,20,"");
}

module pincevege(){
    intersection(){
        nyolcszornyolcas();
        translate([0,0,-450])rotate([90,0,0])cylinder(r=34*rasztermeret/2, h=600, center=true);
    }
}


module hezagos_keret(w, h, d, av, cimke){
    module oldalfal(h,d){
        for(y = [-d/2+20:80:d/2]){
            translate([0,y,0])deszka(20,40,h,20,"oldalfal");
        }
    }
    module vizszintesfal(w,d){
        for(y = [-d/2+60:80:d/2-40]){
            translate([0,y,0])rotate([0,90,0]) deszka(20,40,w,20,cimke);
        }
    }
    oldalfal(h,d); // bal oldal
    translate([w-20,0,0])oldalfal(h,d); // jobb oldal
    translate([w-200,0,0])oldalfal(h,d); // jobb oldal
    
    translate([w/2-20/2,0,h/2-20/2])vizszintesfal(w,d); // tető
    translate([w/2-20/2,0,-(h/2-20/2)])vizszintesfal(w,d);
    
    /*
    translate([0,-h_uveg/2+30,0])deszka(20,40,880,20,"");
    for(y=[-h_uveg/2+30+40:80:+h_uveg/2-30]){
        translate([0,y+40,0])deszka(20,40,880,20,"");
        translate([880/2-10,y,880/2-10])rotate([0,90,0])deszka(20,40,880,20,"");
    }
    translate([10,0, 440-40/2])rotate([-90,0,0])sarok_osszefogo();*/
}

module sarok_osszefogo(){
    h = h_uveg-anyagvastagsag;
    difference(){
        deszka(40,40,h,40,"");
        translate([40/2, 40/2,0])
        rotate(45)deszka(sqrt(2)*40,sqrt(2)*40,h,40,"");
    }
}

module hatszogbelseju(){
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
    hezag = rasztermeret - 3*anyagvastagsag;
    echo(hezag);
    uveg_felfekves = sqrt(r_uveg*r_uveg-hezag/2*hezag/2);
    translate([max_r_uveg-anyagvastagsag/2,0,uveg_felfekves+anyagvastagsag/2])uveg_model(); 
   
}


module uvegtartooszlop(n){
    for(i =[0:n-1]){
        translate([0,0,i*(rasztermeret-anyagvastagsag/n)]) uvegtartok();
    }   
}


module nyolcszornyolcas(){
    n = 33;
    m = 8;
    keret(n*rasztermeret+anyagvastagsag, m*rasztermeret + anyagvastagsag, h_uveg, anyagvastagsag, "nxm"); // TODO 
    
    translate([0, -anyagvastagsag/2,0]){
        translate([-(n*rasztermeret-anyagvastagsag)/2,0, anyagvastagsag])uvegtartomatrix(n,4);
        deszka(n*rasztermeret, h_uveg-anyagvastagsag, anyagvastagsag, anyagvastagsag, "8x8 - középső polc");
        translate([-(n*rasztermeret-anyagvastagsag)/2,0, anyagvastagsag-4*rasztermeret])uvegtartomatrix(n,4);
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

module egyseges_keret(av, cimke){
    keret(900,900,h_uveg+av, av, cimke);
}

module keret(w, h, d, av, cimke){
    echo(w,h,d,av,cimke);
    w1 = (w - av)/2;
    h1 = (h - av)/2;
    rotate([90,0,0]){
        //bal oldal
        translate([-w1, 0,0])deszka(av,h,d,av, cimke);
        //jobb oldal
        translate([w1,0,0])deszka(av,h,d,av, cimke);
        //teteje
        wv=w-2*av;
       translate([0,h1,0])deszka(wv, av,d, av, cimke);
        //alja
        translate([0,-h1,0])deszka(wv, av,d, av, cimke);
        //hátlap
        translate([0,0, -(d-av)/2])deszka(w-2*av,h-2*av,av, av, cimke);
    }
}

module uveg_model(){
   rotate([90,0,0]) cylinder(r=r_uveg,h=h_uveg-anyagvastagsag, center=true);
}