use <atis_lib.scad>;

w = 176; // előlap élhossza
rl = 10; //lap sarkának gömbölyítése
ww = 2.9; // anyagvastagság
h_kurto=50;

hezag=1;
r_kurto_cso_kulso1 = 72;
//r_kurto_cso_kulso1 = 72 // Mosókonyha, Ez kicsi.
//r_kurto_cso_kulso1 = 74 // nappali
//r_kurto_cso_kulso1 = 65 //Szülői háló
r_kurto_cso_kulso2 = r_kurto_cso_kulso1 - ww + 1; // maradjon értékelhető anyag a végére
r_kurto_cso_belso = r_kurto_cso_kulso1 - ww;

echo(r_kurto_cso_kulso1,r_kurto_cso_kulso2, r_kurto_cso_belso);

//inset_first_layer(inset_width=0.5, render=true)
//       translate([0,0,1.5]) szellozo();

//szellozo();

ventillatoros_szellozteto();

module felgomb(r){
    difference(){
        sphere(r=r, $fn=12*r);
        translate([0,0,-r])cube([2*r,2*r,2*r], center=true);
    }
}

module atfurt_felgomb(rg, rf){
    difference(){
        felgomb(rg);
        translate([0,0,-0.5])cylinder(r=rf, h=rg+1, $fn=rf*12);
    }
}
module szellozo(){ // make me
    difference(){
        union(){
            elolap();
            translate([0,0,ww/2])kurtobe();
            
        }
    }
    
    translate([0,0,0])elzaro_korong();
}

module elzaro_korong(){
    
    translate([0,0,(4-ww)/2]){
        difference(){
            minkowski(){
                cylinder(r=r_kurto_cso_belso-1.5, h=2, center=true, $fn=12*(r_kurto_cso_belso-0.5));
                sphere(r=1, $fn=12);
            }
            translate([0,0,0])rotate([90,0,0])cylinder(r=1, h = 2*r_kurto_cso_belso, center=true, $fn=12*1);
            translate([0,r_kurto_cso_belso,0]) rotate([90,0,0])felgomb(5.8);
            translate([0,-r_kurto_cso_belso,0]) rotate([-90,0,0])felgomb(5.8);
        }
    }
}

module kurtobe(){
    difference(){
        cylinder(r1=r_kurto_cso_kulso1, r2=r_kurto_cso_kulso2, h = h_kurto, $fn=77*6);
        translate([0,0,-5])cylinder(r=r_kurto_cso_belso, h=h_kurto+10, $fn=72*6);
        translate([0,0,2])rotate([90,0,0])cylinder(r=1, h = 2*r_kurto_cso_kulso1+2, center=true, $fn=12);
        for(a = [0:60:360]){
            translate([0,0, h_kurto/2+10])rotate(a)cube([w, 40,h_kurto], center=true);
        }
    }
    translate([0,r_kurto_cso_belso,2]) rotate([90,0,0])atfurt_felgomb(5,1);
    translate([0,-r_kurto_cso_belso,2]) rotate([-90,0,0])atfurt_felgomb(5,1);
    
    //#gyuru(77-ww/2-hezag, 77-ww/2-hezag, ww, ww/2, $fn=77*6);
}


module elolap(){
    difference(){
        minkowski(){
            wc = w-2*rl;
            cube([wc,wc,ww], center=true);
            cylinder(r=rl,h=0.1, $fn=12*rl);    
        }
        csx = w/2 - w/2/10-2.5;
        csy = w/2 - w/2/10-2.5;
        l = [[csx, csy],
             [csx, -csy],
             [-csx, -csy],
             [-csx, csy]];

        for(c = l){
            translate([c[0], c[1],0]){
                cylinder(r=2.5,h=60, center=true, $fn=2.5*12);
                //translate([0,0,-ww/2])cylinder(r=5, h=ww/2, $fn=5*12);
            }
        }
        cylinder(r=r_kurto_cso_belso, h=22, center=true, $fn=77*6);
    }
}

   

module keringeto_elolap(){
    dx=35;
    difference(){
        elzaro_korong();
        
        translate([dx, 0,0])cylinder(r=dx-10, h=20, center=true, $fn=12*(dx-10));
        translate([-dx, 0,0])cylinder(r=dx-10, h=20, center=true, $fn=12*(dx-10));
    }
    translate([dx, 0,0]) gyuru(dx-10+3,dx-10+3, 30,3);
    translate([-dx, 0,0]) gyuru(dx-10+3,dx-10+3, 30,3);
}

module ventillatoros_szellozteto(){
    difference(){
        translate([0,0,ww/2])elolap();
        //minkowski(){
            cube(2* r_kurto_cso_belso - 2 * rl, center = true);
        //    cylinder(r = rl, h=0.1);
    }
    elhossz = 2* r_kurto_cso_belso - 2 * rl;
    minkowski(){
         cube([elhossz, elhossz, 39], center = true);
         translate([0,0,39/2])cylinder(r = rl, h=0.1);
    }
}