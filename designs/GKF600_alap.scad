use <atis_lib.scad>;

gombolyites=1;

hossz = 96;
szel = 88;
vastagsag = 6.5;
oldal_kivagas_x =32.5;
oldal_kivagas_szel = 4;
kor_r = 3.5;

// Ezek a jó középpont koordináták
kor_x = 48;
kor_y = 42;



csavar_sullyesztes_r = 5;
csavar_r = 2.5;
csavar_dx = 7.5+csavar_r;
csavar_dy = 7.5+csavar_r;

csavarok = [[csavar_dx, csavar_dy],
            [hossz-csavar_dx, csavar_dy],
            [hossz-csavar_dx, szel - csavar_dy],
            [csavar_dx, szel - csavar_dy]];

difference(){
    translate([gombolyites, gombolyites, gombolyites])
        minkowski(){
            cube([hossz-2*gombolyites, szel-2*gombolyites,vastagsag-2*gombolyites]);  
            sphere(r=gombolyites, $fn=24*gombolyites);
        }
    translate([oldal_kivagas_x,0,0])cube([hossz-2*oldal_kivagas_x, oldal_kivagas_szel, vastagsag]);
    translate([kor_x, kor_y, 0]){
        cylinder(r=kor_r, h=vastagsag, $fn=12*kor_r);
        // ezt mindenképpen támasszal kéne nyomtatni. Első lépésben kihagyom. Lássuk meg hiányzik-e.
        //cylinder(r=kor_r+5, h=2); 
    }
    for( p = csavarok){
        translate([p[0], p[1],0]){
            cylinder(r=csavar_r, h=vastagsag*5, $fn=12*csavar_r);
            translate([0,0,3])cylinder(r=csavar_sullyesztes_r, h=vastagsag*5, $fn=12*csavar_sullyesztes_r);
        }
    }

}
translate([kor_x, kor_y, 0])
    gyuru(kor_r+1, kor_r+1, vastagsag+3, 1, $fn=12*kor_r);