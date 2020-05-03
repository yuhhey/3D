haz_m = 715;
haz_j_h = 1325;
haz_j_sz = 458;
haz_b_h = haz_j_h + 76;
haz_b_sz = 700;
beugro_h = 670;
beugro_sz = 120;
beugro_m = 348;

haz();
translate([-991+haz_j_sz, haz_j_h+846,0])garage();
translate([-haz_b_sz,haz_j_h,beugro_m])cube([haz_b_sz,846,50]);

module haz(){
    cube([haz_j_sz, haz_j_h ,haz_m]);
    translate([-haz_b_sz, -76,0])difference(){
        cube([haz_b_sz, haz_b_h ,haz_m]);
        translate([0,775,0])cube([beugro_sz, beugro_h, beugro_m]);
        translate([0,775,beugro_m+30])cube([beugro_sz, beugro_h, beugro_m]);
    }
    translate([-haz_b_sz, -200-76])cube([haz_b_sz, 200, 50]);
}

module garage(){
    cube([991, 665, 500]);
}


kertfelol_sz = 400;
atjaro_sz = 150;
eloteto_sz = haz_j_sz + haz_b_sz + kertfelol_sz;
eloteto_m = 200;
eloteto_vastagsag = 50;
translate([-haz_b_sz-kertfelol_sz,-76-eloteto_m,0]){
    tarolo_elotti_fal_vastagsag = 30;
    tarolo_elotti_fal_sz = 200;
    difference(){
        cube([eloteto_sz, eloteto_m, beugro_m]);
        #translate([kertfelol_sz - atjaro_sz,tarolo_elotti_fal_vastagsag, 0])cube([eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag, eloteto_m-tarolo_elotti_fal_vastagsag, beugro_m-20]);
        translate([kertfelol_sz - atjaro_sz+tarolo_elotti_fal_sz,0, 0])cube([eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag - tarolo_elotti_fal_sz, eloteto_m-tarolo_elotti_fal_vastagsag, beugro_m-20]);
    }
}
translate([-(kertfelol_sz + haz_b_sz), -76-eloteto_m,0])cube([kertfelol_sz + beugro_sz, haz_b_h+eloteto_m, 50]);