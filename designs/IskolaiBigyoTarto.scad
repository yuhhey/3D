gyd_sz = 35;
gyd_m = 15;
gyd_h = 55;

nagy_gyd_sz = gyd_h;
nagy_gyd_m = gyd_m * 2;
nagy_gyd_h = gyd_sz * 2;


fv = 2; //falvastagság
gap = 0.2;
db_v = 2; // fakkok száma vízszintesen
db_f = 3; // fakkok száma függőlegesen
keret_sz = db_v * (fv + 2 * gap) + fv + 2 * nagy_gyd_sz;
keret_m = db_f * (fv + 2 * gap) + fv + 3 * nagy_gyd_m;
keret_h = fv + nagy_gyd_h;


delta_sz = nagy_gyd_sz + fv + 2 * gap;
delta_m = nagy_gyd_m + fv + 2 * gap;

//translate([fv + gap, 0, fv + gap]) fiok();
//keret();
//fiok();
felso_fiok();

//gombolyitett_cube([100,120,130]);


    
module gombolyitett_cube(dims){
    r=fv;
    translate([r,r,r])minkowski(){
       cube(dims - 2 * [r,r,r]);
       sphere(r, $fn=12*r);
    }
} 
module keret(){
    difference(){
        gombolyitett_cube([keret_sz, keret_h, keret_m+gyd_m+fv]);
        for (x = [fv: delta_sz : keret_sz])
            for(z = [fv: delta_m : keret_m-delta_m])
                translate([x,0,z]){
                    cube([nagy_gyd_sz+ 2 * gap, nagy_gyd_h + 2 * gap, nagy_gyd_m + 2 * gap]);
                    translate([nagy_gyd_sz/2, 0, nagy_gyd_m/2])rotate([-90,0,0])cylinder(r=10, h = 100, $fn = 12*10);
                }
        translate([0,0,keret_m]){
            translate([fv, 0, 0])cube([keret_sz - 2 * fv, keret_h - fv, gyd_m]);
            translate([keret_sz/2, 0, gyd_m/2])rotate([-90,0,0])cylinder(r=7, h = 100, $fn = 12*6);
        }
    }
}

module fiok(){
    difference(){
        gombolyitett_cube([nagy_gyd_sz-2*gap, nagy_gyd_h-gap, nagy_gyd_m-2*gap]);
        translate([fv, fv, fv])cube([nagy_gyd_sz-2*fv-2*gap, nagy_gyd_h-2*fv-gap, nagy_gyd_m - fv-2*gap]);
    }
}

module felso_fiok(){
    difference(){
        gombolyitett_cube([keret_sz - 2 * fv - 2 * gap, keret_h - fv - gap, gyd_m - 2 * gap]);
        translate([fv, fv, fv])cube([keret_sz - 2 * fv - 2 * gap - 2*fv, keret_h - fv - 2 * fv, gyd_m - 2 * gap - fv]);
    }
}