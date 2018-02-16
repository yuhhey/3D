use <atis_lib.scad>;

w = 176; // előlap élhossza
rl = 10; //lap sarkának gömbölyítése
ww = 3; // anyagvastagság
h_kurto=50;

hezag=1;
r_kurto_cso_kulso1 = w/2-13;
r_kurto_cso_kulso2 = r_kurto_cso_kulso1 - ww + 1; // maradjon értékelhető anyag a végére
r_kurto_cso_belso = r_kurto_cso_kulso1 - ww;

echo(r_kurto_cso_kulso1,r_kurto_cso_kulso2, r_kurto_cso_belso);

translate([0,0,4])
    //szellozo();
    //translate([0,r_kurto_cso_kulso1+50.5,0])cube([100,100,100], center=true);
elzaro_korong();


module szellozo(){
    difference(){
        union(){
            elolap();
            translate([0,0,ww/2])kurtobe();
        }
    }
    
    elzaro_korong();
}

module elzaro_korong(){
    
    translate([0,0,(4-ww)/2]){
        difference(){
            minkowski(){
                cylinder(r=r_kurto_cso_belso-1.5, h=2, center=true, $fn=12*(r_kurto_cso_belso-0.5));
                sphere(r=1, $fn=12);
            }
            translate([r_kurto_cso_belso-10,0,0])rotate([90,0,0])cylinder(r=2, h = 200, center=true);
        }
    }
}

module kurtobe(){
    difference(){
        cylinder(r1=r_kurto_cso_kulso1, r2=r_kurto_cso_kulso2, h = h_kurto, $fn=77*6);
        translate([0,0,-5])cylinder(r=r_kurto_cso_belso, h=h_kurto+10, $fn=72*6);
    }
    
    
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

