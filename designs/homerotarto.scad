use <dotscad/pie.scad>;
//Minden mm-ben
d_merofej = 4;
iv_r_merofej = 25;
hh_merofej = 70;
hr_merofej = 30;
kijelzo_vastagsag=18;
kijelzo_sz = 70;
kijelzo_m = 50;
kijelzo_sarok_r = 10;
kijelzo_kava_r = 5;

r_merofej = d_merofej / 2;
hajtas_sugar = iv_r_merofej + r_merofej;

//kijelzo();
merofej();
module merotarto(){
    kocka = hh_merofej + hajtas_sugar;
    difference(){
        cube([kocka, kocka, kocka]);
        translate([0,0, kijelzo_vastagsag + 10])merofej();
        kijelzo();
    }
}

module kijelzo(){
    
    o = kijelzo_sarok_r + kijelzo_kava_r;
    translate([o, o, kijelzo_kava_r])minkowski(){
        minkowski(){
            cube([kijelzo_sz - 2 * (kijelzo_sarok_r + kijelzo_kava_r),
                  kijelzo_m - 2 * (kijelzo_sarok_r + kijelzo_kava_r),
                  kijelzo_vastagsag - 2 *kijelzo_kava_r]);
            cylinder(r = kijelzo_sarok_r, h = 0.01, $fn= 12 * kijelzo_sarok_r);
        }
        sphere(r = kijelzo_kava_r, $fn= 12 * kijelzo_kava_r);
    }
}

module merofej(){
    minkowski(){
        difference(){
            cube([hr_merofej+iv_r_merofej+r_merofej,hh_merofej+iv_r_merofej+r_merofej,0.1]);
            minkowski(){
                d =  - iv_r_merofej - 0.1;
                cube([hr_merofej+r_merofej,hh_merofej+r_merofej,0.1]);
                cylinder(r=iv_r_merofej, h=0.01, $fn=12*iv_r_merofej);
            }
        }
        sphere(r=r_merofej, $fn=12*r_merofej);
    }
}

module merofej1(){
    
    translate([hr_merofej+hajtas_sugar,hh_merofej,0]){
        
        translate([0,0,0])rotate([90,0,0])cylinder(r = r_merofej, h = hh_merofej, $fn = 12 * r_merofej);
        translate([r_merofej,hajtas_sugar,0])rotate([0,-90,0])cylinder(r = r_merofej, h = hr_merofej+hajtas_sugar+r_merofej, $fn = 12 * r_merofej);
        translate([-hajtas_sugar,0,0])
            {
                difference(){
                    rotate_extrude($fn= 12*iv_r_merofej)translate([iv_r_merofej + r_merofej, 0, 0])circle(r = r_merofej, $fn = 12 * r_merofej); 
                    d = iv_r_merofej + d_merofej;
                    translate([0,0, -2*r_merofej]){
                        translate([-d,0,0])cube([d, ,d, d]);
                        translate([-d,-d,0])cube([d, ,d, d]);
                        translate([0,-d,0])cube([d, ,d, d]);
                    }
                }
                translate([hajtas_sugar,0,0])rotate([-90,0,0])cylinder(r=r_merofej, h=hajtas_sugar+r_merofej, $fn=12*r_merofej);
        }
    }
}