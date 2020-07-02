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

//translate([fv + gap, 0, fv + gap])
//fiok();
//keret();
//translate([0,0,keret_m]){
//    felso_resz();
//    translate([fv + gap,0,gap ])
felso_fiok();
//}
    
module keret(){
    difference(){
        cube([keret_sz, keret_h, keret_m]);
        for (x = [fv: delta_sz : keret_sz])
            for(z = [fv: delta_m : keret_m])
                translate([x,0,z]){
                    cube([nagy_gyd_sz+ 2 * gap, nagy_gyd_h + 2 * gap, nagy_gyd_m + 2 * gap]);
                    translate([nagy_gyd_sz/2, 0, nagy_gyd_m/2])rotate([-90,0,0])cylinder(r=10, h = 100, $fn = 12*10);
                }
    }
}

module fiok(){
    difference(){
        cube([nagy_gyd_sz, nagy_gyd_h, nagy_gyd_m]);
        translate([fv, fv, fv])cube([nagy_gyd_sz - 2 * fv, nagy_gyd_h - 2 * fv, nagy_gyd_m - fv]);
    }
}

module felso_resz(){
    difference(){
        cube([keret_sz, keret_h, gyd_m + fv]);
        translate([fv, 0, 0])cube([keret_sz - 2 * fv, keret_h - fv, gyd_m]);
        translate([keret_sz/2, 0, gyd_m/2])rotate([-90,0,0])cylinder(r=6, h = 100, $fn = 12*6);
    }
}

module felso_fiok(){
    difference(){
        cube([keret_sz - 2 * fv - 2 * gap, keret_h - fv, gyd_m - 2 * gap]);
        translate([fv, fv, fv])cube([keret_sz - 2 * fv - 2 * gap - 2*fv, keret_h - fv - 2 * fv, gyd_m - 2 * gap - fv]);
    }
}